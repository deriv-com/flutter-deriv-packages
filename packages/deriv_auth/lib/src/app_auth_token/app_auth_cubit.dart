import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:crypto/crypto.dart';
import 'package:deriv_auth/src/core/api_client/base_client.dart';
import 'package:meta/meta.dart';

import '../models/app_auth/app_authorization_response.dart';
import '../models/app_auth/app_authorization_reuest.dart';
import '../models/app_auth_challenge/app_auth_challenge_response.dart';
import '../models/app_auth_challenge_request.dart';

part 'app_auth_state.dart';

class AppAuthCubit extends Cubit<AppAuthState> {
  final BaseHttpClient client;
  AppAuthCubit({required this.client}) : super(AppAuthInitialState());

  Future<void> getAppAuthToken({
    required String appId,
    required String endpoint,
    required String appToken,
  }) async {
    emit(AppAuthLoadingState());
    final AppAuthorizationChallengeResponseModel challenge =
        await _getAppAuthorizationChallenge(endpoint: endpoint, appId: appId);

    final String solution = _solveLoginChallenge(
      appToken: appToken,
      challenge: challenge.challenge,
    );

    final String resToken = await _authorizeApp(
      solution: solution,
      expire: challenge.expire,
      endpoint: endpoint,
      appId: appId,
    );
    emit(AppAuthSuccessState(resToken));
  }

  Future<AppAuthorizationChallengeResponseModel> _getAppAuthorizationChallenge({
    required String endpoint,
    required String appId,
  }) async {
    final Map<String, dynamic> jsonResponse = await client.post(
      url: _getPtaVerifyUrl(endpoint),
      jsonBody: AppAuthorizationChallengeRequestModel(
        appId: int.parse(appId),
      ).toJson(),
    );

    return AppAuthorizationChallengeResponseModel.fromJson(jsonResponse);
  }

  Future<String> _authorizeApp({
    required String solution,
    required int expire,
    required String endpoint,
    required String appId,
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
}
