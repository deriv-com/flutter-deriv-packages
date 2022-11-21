import 'package:deriv_auth/src/auth/models/authorize.dart';
import 'package:deriv_auth/src/models/logout/logout_response.dart';
import 'package:deriv_auth/src/models/reset_password/reset_password.dart';
import 'package:deriv_auth/src/models/verify_email/verify_email.dart';

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
  Future<void> onSendSignupEvent({
    required String signUpProvider,
    required String binaryUserId,
    required String loginId,
  });
  Future<VerifyEmailResponseEntity> verifyEmail(
      VerifyEmailRequestEntity requestEntity);
  Future<ResetPasswordResponseEntity> resetPassword(
      ResetPasswordRequestEntity requestEntity);
}
