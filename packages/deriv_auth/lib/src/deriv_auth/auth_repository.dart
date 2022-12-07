import 'package:deriv_auth/src/core/api_client/base_client.dart';

import '../../deriv_auth.dart';

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
  Future<List<AccountModel>> getLatestAccounts();

  /// Reset password functions
  ///
  /// Send Email Verifcation
  ///
  Future<bool> sendEmailVerification(String email);

  /// Reset user password
  ///
  Future<bool> resetPassword({
    required String verificationCode,
    required String newPassword,
  });

  /// Decode url and extract verification code
  /// from email redirection
  ///
  String? getVerificationToken(String url);

  /// Sign up
  ///
  /// Send sign up email to user
  ///
  Future<void> sendSignupEmail(String email);

  /// Creatiing new virtual account
  ///
  Future<AccountModel> submitNewVirtualAccountRequest({
    required NewVirtualAccountRequestModel newVirtualAccountModel,
  });
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
