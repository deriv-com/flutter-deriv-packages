import 'package:deriv_auth/core/models/verify_email_model.dart';
import 'package:deriv_auth/features/reset_password/services/base_reset_password_service.dart';

class ExampleResetPassService implements BaseResetPasswordService {
  @override
  Future<bool> resetPassword({
    required String verificationCode,
    required String newPassword,
  }) =>
      Future.value(true);

  @override
  Future<VerifyEmailResponseEntity> sendVerificationEmail(
    VerifyEmailRequestEntity request,
  ) =>
      Future.value(const VerifyEmailResponseEntity(verifyEmail: true));
}
