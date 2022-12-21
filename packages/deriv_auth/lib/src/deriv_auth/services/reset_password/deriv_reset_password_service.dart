import '../../../../deriv_auth.dart';

/// [DerivGo] implementation of [BaseResetPasswordService] functions.
class DerivResetPasswordService extends BaseResetPasswordService {
  /// Initialize [DerivNewVirtualAccountService].
  DerivResetPasswordService({required this.repository});

  /// Client implemenntation of repository functions.
  final BaseResetPasswordRepository repository;

  @override
  Future<void> onBeforeResetPasswordEmailSent() =>
      repository.onBeforeResetPasswordEmailSent();

  @override
  Future<void> onResetPasswordEmailSent() =>
      repository.onResetPasswordEmailSent();

  @override
  Future<bool> resetPassword({
    required String verificationCode,
    required String newPassword,
  }) =>
      repository.resetPassword(
        verificationCode: verificationCode,
        newPassword: newPassword,
      );

  @override
  Future<VerifyEmailResponseEntity> sendVerificationEmail(
          VerifyEmailRequestEntity request) =>
      repository.sendVerificationEmail(request);

  @override
  Future<void> onResetPasswordEmailVerified() =>
      repository.onResetPasswordEmailVerified();

  @override
  Future<void> onPasswordReset({required String newPassword}) =>
      repository.onPasswordReset(newPassword: newPassword);
}
