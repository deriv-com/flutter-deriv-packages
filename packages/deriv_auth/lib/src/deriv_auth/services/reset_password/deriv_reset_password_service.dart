import '../../../../deriv_auth.dart';

/// [DerivGo] implementation of [BaseResetPasswordService] functions.
class DerivResetPasswordService extends BaseResetPasswordService {
  /// Initialize [DerivNewVirtualAccountService].
  DerivResetPasswordService({required this.repository});

  /// Client implemenntation of repository functions.
  final BaseResetPasswordRepository repository;

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
}
