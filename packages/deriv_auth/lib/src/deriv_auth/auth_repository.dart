import 'package:deriv_auth/src/auth/models/authorize.dart';
import 'package:deriv_auth/src/core/api_client/base_client.dart';
import 'package:deriv_auth/src/models/login/login_request.dart';
import 'package:deriv_auth/src/models/login/login_response.dart';
import 'package:deriv_auth/src/models/logout/logout_response.dart';

abstract class BaseFetchAccountsRepository {
  Future<LoginResponseModel> fetchAccounts({
    required LoginRequestModel request,
    required String jwtToken,
  });
}

abstract class BaseAuthRepository implements BaseFetchAccountsRepository {
  Future<LogoutResponseEntity> logout();
  Future<AuthorizeResponseEntity> authorize(String? token);
}

class DerivFetchAccountRepository implements BaseFetchAccountsRepository {
  final BaseHttpClient client;
  final String appId;
  final String endpoint;

  DerivFetchAccountRepository({
    required this.client,
    required this.appId,
    required this.endpoint,
  });
  @override
  Future<LoginResponseModel> fetchAccounts({
    required LoginRequestModel request,
    required String jwtToken,
  }) async {
    final Map<String, dynamic> jsonResponse = await client.post(
      url: _loginUrl,
      jsonBody: request.copyWith(appId: int.parse(appId)).toJson(),
      headers: <String, String>{'Authorization': 'Bearer $jwtToken'},
    );

    return LoginResponseModel.fromJson(jsonResponse);
  }

  String get _loginUrl => '$_baseUrl/login';

  String get _baseUrl => 'https://$endpoint/oauth2/api/v1';
}
