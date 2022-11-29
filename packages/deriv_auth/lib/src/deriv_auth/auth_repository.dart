import 'package:deriv_auth/src/auth/models/authorize.dart';
import 'package:deriv_auth/src/core/api_client/base_client.dart';
import 'package:deriv_auth/src/deriv_auth/connection_info.dart';
import 'package:deriv_auth/src/models/account/account.dart';
import 'package:deriv_auth/src/models/login/login_request.dart';
import 'package:deriv_auth/src/models/login/login_response.dart';

abstract class BaseFetchAccountsRepository {
  Future<LoginResponseModel> fetchAccounts({
    required LoginRequestModel request,
    required String jwtToken,
  });
}

abstract class BaseAuthRepository implements BaseFetchAccountsRepository {
  Future<void> logout();
  Future<void> onLoggedOut();
  Future<void> onLogin(AuthorizeEntity authorizeEntity);
  Future<void> onAccountsFetched(LoginResponseModel response);
  Future<AuthorizeResponseEntity> authorize(String? token);
  Future<AccountModel?> getDefaultAccount();
}

class DerivFetchAccountRepository implements BaseFetchAccountsRepository {
  DerivFetchAccountRepository({
    required this.client,
    required this.connectionInfo,
  });
  final BaseHttpClient client;
  final AuthConnectionInfo connectionInfo;

  @override
  Future<LoginResponseModel> fetchAccounts({
    required LoginRequestModel request,
    required String jwtToken,
  }) async {
    final Map<String, dynamic> jsonResponse = await client.post(
      url: _loginUrl(),
      jsonBody:
          request.copyWith(appId: int.parse(connectionInfo.appId)).toJson(),
      headers: <String, String>{'Authorization': 'Bearer $jwtToken'},
    );

    return LoginResponseModel.fromJson(jsonResponse);
  }

  String _loginUrl() => '${_baseUrl()}/login';

  String _baseUrl() => 'https://${connectionInfo.endpoint}/oauth2/api/v1';
}
