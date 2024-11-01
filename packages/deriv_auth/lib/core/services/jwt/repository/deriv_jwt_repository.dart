import 'package:deriv_auth/core/connection_info.dart';
import 'package:deriv_auth/core/services/jwt/models/app_auth/app_authorization_request.dart';
import 'package:deriv_auth/core/services/jwt/models/app_auth/app_authorization_response.dart';
import 'package:deriv_auth/core/services/jwt/models/app_auth_challenge/app_auth_challenge_request.dart';
import 'package:deriv_auth/core/services/jwt/models/app_auth_challenge/app_auth_challenge_response.dart';
import 'package:deriv_http_client/deriv_http_client.dart';

import 'base_jwt_repository.dart';

/// Implementation of JWT interface.
class DerivJwtRepository implements BaseJwtRepository {
  /// Inititalize [BaseJwtRepository].
  DerivJwtRepository({
    required this.client,
    required this.connectionInfo,
    required this.getAppToken,
  });

  /// Http client.
  final BaseHttpClient client;

  /// Client connection info.
  final AuthConnectionInfo connectionInfo;

  /// Private client app token.
  final String Function() getAppToken;

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
      appToken: getAppToken(),
    );
  }

  Uri _getOAuthUrl({required String host, required String path}) =>
      Uri(scheme: 'https', host: host, path: 'oauth2/api/v1/$path');

  String _getChallengeUrl(String host) =>
      '${_getOAuthUrl(host: host, path: 'verify')}';

  String _getAuthorizeAppUrl(String host) =>
      '${_getOAuthUrl(host: host, path: 'authorize')}';
}
