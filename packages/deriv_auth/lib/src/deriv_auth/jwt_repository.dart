import 'package:deriv_auth/src/core/api_client/base_client.dart';
import 'package:deriv_auth/src/deriv_auth/connection_info.dart';
import 'package:deriv_auth/src/models/app_auth/app_authorization_response.dart';
import 'package:deriv_auth/src/models/app_auth/app_authorization_reuest.dart';
import 'package:deriv_auth/src/models/app_auth_challenge/app_auth_challenge_response.dart';
import 'package:deriv_auth/src/models/app_auth_challenge_request.dart';

abstract class BaseJwtRepository {
  Future<AppAuthorizationChallengeResponseModel> getAppAuthorizationChallenge();

  Future<String> authorizeApp({
    required String solution,
    required int expire,
  });
}

class DerivJwtRepository implements BaseJwtRepository {
  DerivJwtRepository({
    required this.client,
    required this.connectionInfo,
    required this.appToken,
  });
  final BaseHttpClient client;
  final AuthConnectionInfo connectionInfo;
  final String appToken;

  @override
  Future<String> authorizeApp({
    required String solution,
    required int expire,
  }) async {
    final Map<String, dynamic> jsonResponse = await client.post(
      url: _getAuthorizeAppUrl(connectionInfo.endpoint),
      jsonBody: AppAuthorizationRequestModel(
        appId: int.parse(connectionInfo.appId),
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
      url: _getChallengeUrl(connectionInfo.endpoint),
      jsonBody: AppAuthorizationChallengeRequestModel(
        appId: int.parse(connectionInfo.appId),
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
