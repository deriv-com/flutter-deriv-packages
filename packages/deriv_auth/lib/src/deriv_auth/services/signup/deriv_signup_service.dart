import '../../../../deriv_auth.dart';

/// [DerivGo] implementation of [BaseSignupService].
class DerivSignupService extends BaseSignupService {
  /// Initialize [DerivSignupService].
  DerivSignupService({required this.repository});

  /// Client implementation of repository fucntions.
  final BaseSignupRepository repository;

  @override
  Future<DateTime> getClientServerTime() => repository.getClientServerTime();

  @override
  Future<void> onBeforeSignupEmailSent() =>
      repository.onBeforeSignupEmailSent();

  @override
  Future<void> onSignupEmailSent() => repository.onSignupEmailSent();

  @override
  Future<VerifyEmailResponseEntity> sendVerificationEmail(
          VerifyEmailRequestEntity request) =>
      repository.sendVerificationEmail(request);
}
