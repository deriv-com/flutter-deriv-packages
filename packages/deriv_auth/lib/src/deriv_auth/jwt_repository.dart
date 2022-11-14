import 'package:deriv_auth/src/core/api_client/base_client.dart';
import 'package:deriv_auth/src/models/app_auth/app_authorization_response.dart';
import 'package:deriv_auth/src/models/app_auth/app_authorization_reuest.dart';
import 'package:deriv_auth/src/models/app_auth_challenge/app_auth_challenge_response.dart';
import 'package:deriv_auth/src/models/app_auth_challenge_request.dart';

abstract class JwtRepository {
  Future<AppAuthorizationChallengeResponseModel> getAppAuthorizationChallenge();

  Future<String> authorizeApp({
    required String solution,
    required int expire,
  });
}

class DerivJwtRepository implements JwtRepository {
  final BaseHttpClient client;
  final String appId;
  final String endpoint;
  final String appToken;

  DerivJwtRepository({
    required this.client,
    required this.appId,
    required this.endpoint,
    required this.appToken,
  });

  @override
  Future<String> authorizeApp({
    required String solution,
    required int expire,
  }) async {
    final Map<String, dynamic> jsonResponse = await client.post(
      url: _getAuthorizeAppUrl(endpoint),
      jsonBody: AppAuthorizationRequestModel(
        appId: int.parse(appId),
        solution: solution,
        expire: expire,
      ).toJson(),
    );

    return AppAuthorizationResponseModel.fromJson(jsonResponse).token;
  }

  @override
  Future<AppAuthorizationChallengeResponseModel>
      getAppAuthorizationChallenge() async {
    final Map<String, dynamic> jsonResponse = await client.post(
      url: _getChallengeUrl(endpoint),
      jsonBody: AppAuthorizationChallengeRequestModel(
        appId: int.parse(appId),
      ).toJson(),
    );

    return AppAuthorizationChallengeResponseModel.fromJson(
      jsonResponse,
      appToken: appToken,
    );
  }

  Uri _getOAuthUrl({required String host, required String path}) =>
      Uri(scheme: 'https', host: host, path: 'oauth2/api/v1/$path');

  String _getChallengeUrl(String host) =>
      '${_getOAuthUrl(host: host, path: 'verify')}';

  String _getAuthorizeAppUrl(String host) =>
      '${_getOAuthUrl(host: host, path: 'authorize')}';
}
