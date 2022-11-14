import 'package:deriv_auth/src/auth/models/authorize.dart';
import 'package:deriv_auth/src/models/logout/logout_response.dart';

import '../../models/account/account.dart';

abstract class IAuthRepo {
  Future<LogoutResponseEntity> logout();
  Future<AuthorizeResponseEntity?> authorize(String? token);
  Future<void> initAnalyticsAndRegisterFCMToken(int? userId);
  Future<void> cleanUpUserData();
  Future<void> setFeedbackReminderFlag();
  Future<void> addAccountsToSecureStorage(List<AccountModel> accountsList);
  Future<void> setDefaultUserEmail(String? userEmail);
  Future<void> setDefaultUserId(int? userId);
  Future<void> setDefaultAccount(String accountId);
  Future<void> onSendSignupEvent();
}
