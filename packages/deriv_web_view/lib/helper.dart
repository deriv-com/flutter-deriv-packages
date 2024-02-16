import 'dart:convert';
import 'dart:developer' as logger;
import 'dart:io' as io;
import 'package:http/io_client.dart';

import 'package:crypto/crypto.dart';

import 'package:deriv_http_client/deriv_http_client.dart';

import 'package:deriv_web_view/models/app_authorization_challenge_request_model.dart';
import 'package:deriv_web_view/models/app_authorization_challenge_response_model.dart';
import 'package:deriv_web_view/models/app_authorization_request_model.dart';
import 'package:deriv_web_view/models/app_authorization_response_model.dart';
import 'package:deriv_web_view/models/pta_login_request_model.dart';
import 'package:deriv_web_view/models/pta_login_response_model.dart';
import 'package:flutter_system_proxy/flutter_system_proxy.dart';

/// Using this function, a `one-time-token` will be generated in order to access current logged in user to the application with [destinationAppId].
Future<String?> performPassThroughAuthentication({
  required String redirectPath,
  required String destinationAppId,
  required String? refreshToken,
  required String? defaultAccount,
  required String endpoint,
  required String appId,
  required String appToken,
  String? action,
  String? code,
}) async {
  final url = getPtaLoginUrl(host: endpoint);
  final String proxy = await FlutterSystemProxy.findProxyFromEnvironment(url);
  final io.HttpClient httpClient = io.HttpClient();
  httpClient.findProxy = (uri) => proxy;

  final HttpClient client = HttpClient(IOClient(httpClient));

  final String jwtToken = await getJwtToken(
    endpoint: endpoint,
    appId: appId,
    appToken: appToken,
    client: client,
  );

  final Map<String, dynamic> request = PtaLoginRequestModel(
    refreshToken: refreshToken ?? '',
    appId: destinationAppId,
    urlParams: UrlParamsModel(
      redirectUrl: redirectPath,
      selectedAccount: defaultAccount ?? '',
      action: action,
      code: code,
    ),
  ).toJson();

  late final Map<String, dynamic> response;

  try {
    response = await client.post(
      url: getPtaLoginUrl(host: endpoint),
      jsonBody: request,
      headers: <String, String>{'Authorization': 'Bearer $jwtToken'},
    );
  } on Exception catch (e) {
    logger.log('Error while performing Pass-through authentication: $e');

    return null;
  }

  return PTALoginResponseModel.fromJson(response).token;
}

/// Gets Jwt token for authorizing the application.
Future<String> getJwtToken({
  required String endpoint,
  required String appId,
  required String appToken,
  required HttpClient client,
}) async {
  final AppAuthorizationChallengeResponseModel challenge =
      await _getAppAuthorizationChallenge(
    endpoint: endpoint,
    appId: appId,
    client: client,
  );

  final String solution = _solveLoginChallenge(
    appToken: appToken,
    challenge: challenge.challenge,
  );

  return _authorizeApp(
    solution: solution,
    expire: challenge.expire,
    endpoint: endpoint,
    appId: appId,
    client: client,
  );
}

Future<String> _authorizeApp({
  required String solution,
  required int expire,
  required String endpoint,
  required String appId,
  required HttpClient client,
}) async {
  final Map<String, dynamic> jsonResponse = await client.post(
    url: _getPtaAuthorizeUrl(endpoint),
    jsonBody: AppAuthorizationRequestModel(
      appId: int.parse(appId),
      solution: solution,
      expire: expire,
    ).toJson(),
  );

  return AppAuthorizationResponseModel.fromJson(jsonResponse).token;
}

Future<AppAuthorizationChallengeResponseModel> _getAppAuthorizationChallenge({
  required String endpoint,
  required String appId,
  required HttpClient client,
}) async {
  final Map<String, dynamic> jsonResponse = await client.post(
    url: _getPtaVerifyUrl(endpoint),
    jsonBody: AppAuthorizationChallengeRequestModel(
      appId: int.parse(appId),
    ).toJson(),
  );

  return AppAuthorizationChallengeResponseModel.fromJson(jsonResponse);
}

/// This function solves login challenge sent by server.
String _solveLoginChallenge({
  required String appToken,
  required String challenge,
}) {
  final List<int> encodedAppToken = utf8.encode(appToken);
  final List<int> encodedChallenge = utf8.encode(challenge);

  final Hmac hmacSHA256 = Hmac(sha256, encodedAppToken);
  final Digest digest = hmacSHA256.convert(encodedChallenge);

  return digest.toString();
}

/// Gets path through authentication login url.
String getPtaLoginUrl({required String host, String? token}) =>
    '${_getOAuthUrl(host: host, path: 'pta_login')}/${token ?? ''}';

/// Gets oauth url for specific path.
Uri _getOAuthUrl({required String host, required String path}) =>
    Uri(scheme: 'https', host: host, path: 'oauth2/api/v1/$path');

/// Gets path through authentication verification url.
String _getPtaVerifyUrl(String host) =>
    '${_getOAuthUrl(host: host, path: 'verify')}';

/// Gets path through authentication authorization url.
String _getPtaAuthorizeUrl(String host) =>
    '${_getOAuthUrl(host: host, path: 'authorize')}';
