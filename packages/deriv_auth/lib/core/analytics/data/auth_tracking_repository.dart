import 'package:analytics/sdk/rudderstack/sdk/deriv_rudderstack_sdk.dart';
import 'package:deriv_auth/core/services/token/models/enums.dart';
import 'package:deriv_auth/core/analytics/data/auth_tracking_data.dart';
import 'package:deriv_auth/core/analytics/domain/auth_user_tracking_interface.dart';
import 'package:deriv_auth/core/analytics/enums.dart';

/// Repository to track user events.
class AuthTrackingRepository implements AuthUserTrackingInterface {
  /// Constructor for [AnalyticsRepository].
  AuthTrackingRepository._(
    this._appId,
    this._derivRudderstack,
  );

  static AuthTrackingRepository? _instance;

  /// Singleton instance of [AnalyticsRepository].
  static AuthTrackingRepository get instance => _instance ??=
      throw Exception('AuthTrackingRepository is not initialized');

  /// Instance of [DerivRudderstack].
  final DerivRudderstack _derivRudderstack;

  /// Initialize [AnalyticsRepository].
  static void init(
    String appId, {
    required DerivRudderstack derivRudderstack,
  }) =>
      _instance = AuthTrackingRepository._(
        appId,
        derivRudderstack,
      );

  /// Deriv client app ID.
  final String _appId;

  LoginProvider? _loginProvider;

  @override
  void trackUserOpenedLoginForm() {
    if (_loginProvider == null) {
      return;
    }

    final Map<String, dynamic> data = getUserTrackingData(
      LoginAction.openLoginForm,
      _appId,
      provider: _loginProvider!,
    );
    _derivRudderstack.track(
      eventName: data['event'] as String,
      properties: data['properties'] as Map<String, dynamic>,
    );
  }

  @override
  void trackError(String errorMessage) {
    if (_loginProvider == null) {
      return;
    }

    final Map<String, dynamic> data = getUserTrackingData(
      LoginAction.loginError,
      _appId,
      provider: _loginProvider!,
      errorMessage: errorMessage,
    );

    _derivRudderstack.track(
      eventName: data['event'] as String,
      properties: data['properties'] as Map<String, dynamic>,
    );
  }

  @override
  void trackSystemLoginPressed() {
    final Map<String, dynamic> data = getUserTrackingData(
      LoginAction.startLogin,
      _appId,
      provider: LoginProvider.email,
    );

    _loginProvider = LoginProvider.email;

    _derivRudderstack.track(
      eventName: data['event'] as String,
      properties: data['properties'] as Map<String, dynamic>,
    );
  }

  @override
  void trackPasskeyLoginPressed() {
    final Map<String, dynamic> data = getUserTrackingData(
      LoginAction.startLogin,
      _appId,
      provider: LoginProvider.passkey,
    );

    _loginProvider = LoginProvider.passkey;

    _derivRudderstack.track(
      eventName: data['event'] as String,
      properties: data['properties'] as Map<String, dynamic>,
    );
  }

  @override
  void trackSocialLoginPressed(SocialAuthProvider type) {
    _loginProvider = switch (type) {
      SocialAuthProvider.google => LoginProvider.google,
      SocialAuthProvider.facebook => LoginProvider.facebook,
      SocialAuthProvider.apple => LoginProvider.apple,
    };

    final Map<String, dynamic> data = getUserTrackingData(
      LoginAction.startLogin,
      _appId,
      provider: _loginProvider!,
    );

    _derivRudderstack.track(
      eventName: data['event'] as String,
      properties: data['properties'] as Map<String, dynamic>,
    );
  }

  @override
  void trackLoginFinished() {
    if (_loginProvider == null) {
      return;
    }

    final Map<String, dynamic> data = getUserTrackingData(
      LoginAction.finishLogin,
      _appId,
      provider: _loginProvider!,
    );

    _derivRudderstack.track(
      eventName: data['event'] as String,
      properties: data['properties'] as Map<String, dynamic>,
    );
  }
}
