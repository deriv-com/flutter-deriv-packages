import 'package:deriv_auth/src/core/api_client/base_client.dart';
import 'package:deriv_auth/src/models/login/login_response.dart';

import '../../deriv_auth.dart';

abstract class BaseFetchAccountsRepository {
  Future<LoginResponseModel> fetchAccounts({
    required LoginRequestModel request,
    required String jwtToken,
  });
  Future<void> reloadAccounts();
}

abstract class BaseAuthRepository implements BaseFetchAccountsRepository {
  Future<LogoutResponseEntity> logout();
  Future<AuthorizeResponseEntity> authorize(String? token);

  Future<void> onSendSignupEvent({
    required String signupProvider,
    required String binaryUserId,
    final String loginId,
  });
}

abstract class BaseUserDataRepository implements BaseAuthRepository {
  Future<void> setDefaultUserEmail(String? userEmail);
  Future<void> setDefaultUserId(int? userId);
  Future<void> setDefaultAccount(String accountId);
  Future<void> setRefreshToken(String refreshToken);
  Future<void> addAccountsToSecureStorage(List<AccountModel> accountsList);
  Future<void> initAnalyticsAndRegisterFCMToken(int? userId);
  Future<void> cleanUpUserData();
  Future<void> setFeedbackReminderFlag();
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

  @override
  Future<void> reloadAccounts() {
    // TODO: implement reloadAccounts
    throw UnimplementedError();
  }
}
