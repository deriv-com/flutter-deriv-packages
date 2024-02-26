import 'package:deriv_auth/deriv_auth.dart';

/// Functionality that DerivAuthCubit provides.
abstract class DerivAuthIO {
  /// Login with [email] and [password].
  ///
  /// If [otp] is provided, it will be used for two-factor-authentication.
  Future<void> systemLogin({
    required String email,
    required String password,
    String? otp,
  });

  /// Social login/signup with [oneAllConnectionToken] using one-all service.
  /// Using it as fallback plan of [socialAuth]. Will be removed in the future.
  @Deprecated(
      'OneAll has been removed so this method is no longer useful. Use socialAuth instead.')
  Future<void> socialLogin({
    required String oneAllConnectionToken,
    String? otp,
  });

  /// Social login/signup using custom in-house service.
  Future<void> socialAuth({
    required SocialAuthDto socialAuthDto,
    String? otp,
  });

  /// Log user in with [token] after reset password or sign up.
  Future<void> tokenLogin(String token);

  /// Log user out.
  Future<void> logout();

  /// Log default user in.
  Future<void> authorizeDefaultAccount();

  /// Deriv auth output.
  Stream<DerivAuthState> get output;
}
