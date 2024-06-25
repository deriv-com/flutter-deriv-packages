import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_auth/core/analytics/data/auth_tracking_repository.dart';

/// Mixin for tracking user authentication actions.
mixin AuthTrackingMixin {
  late final AuthTrackingRepository _repository =
      AuthTrackingRepository.instance;

  /// Track user opened login form.
  void trackUserOpenedLoginForm() => _repository.trackUserOpenedLoginForm();

  /// Track login error.
  void trackError(String errorMessage) => _repository.trackError(errorMessage);

  /// Track login started.
  void trackLoginWithEmailAndPassword() =>
      _repository.trackSystemLoginPressed();

  /// Track Passkey login started.
  void trackLoginWithPasskey() => _repository.trackPasskeyLoginPressed();

  /// Track Google login started.
  void trackLoginWithGoogle() =>
      _repository.trackSocialLoginPressed(SocialAuthProvider.google);

  /// Track Facebook login started.
  void trackLoginWithFacebook() =>
      _repository.trackSocialLoginPressed(SocialAuthProvider.facebook);

  /// Track Apple login started.
  void trackLoginWithApple() =>
      _repository.trackSocialLoginPressed(SocialAuthProvider.apple);

  /// Track login finished.
  void trackLoginFinished() => _repository.trackLoginFinished();
}
