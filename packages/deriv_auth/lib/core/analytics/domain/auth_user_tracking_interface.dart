import 'package:deriv_auth/deriv_auth.dart';

/// Interface to define the methods for tracking user events.
abstract interface class AuthUserTrackingInterface {
  /// Track user opened login form.
  void trackUserOpenedLoginForm();

  /// Track user clicks log after entering email and password.
  void trackSystemLoginPressed();

  /// Track user clicks on Passkey login button.
  void trackPasskeyLoginPressed();

  /// Track user clicks on social login button.
  void trackSocialLoginPressed(
    SocialAuthProvider type,
  );

  /// Track login finished.
  void trackLoginFinished();

  /// Track login error.
  void trackError(String errorMessage);
}
