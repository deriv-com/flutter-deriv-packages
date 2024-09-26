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
    bool useMultiToken = false,
  });

  /// Social login/signup with [oneAllConnectionToken] using one-all service.
  /// Using it as fallback plan of [socialAuth]. Will be removed in the future.
  @Deprecated(
      'OneAll has been removed so this method is no longer useful. Use socialAuth instead.')
  Future<void> socialLogin({
    required String oneAllConnectionToken,
    String? otp,
    bool useMultiToken = false,
  });

  /// Social login/signup using custom in-house service.
  Future<void> socialAuth({
    required SocialAuthDto socialAuthDto,
    String? otp,
    bool useMultiToken = false,
  });

  /// Log user in with [token] after reset password or sign up.
  @deprecated
  Future<void> tokenLogin(String token);

  /// Log user in with multi token authorization
  /// Add [token] to the list of authorized tokens.
  /// And authorize the user with the new list of tokens.
  Future<void> multiTokenAuthorize(String? token);

  /// Log user out.
  Future<void> logout();

  /// Log default user in.
  @deprecated
  Future<void> authorizeDefaultAccount();

  /// Uses multi authorization for all user accounts.
  Future<void> multiAuthorizeAllAccounts();

  /// Deriv auth output.
  Stream<DerivAuthState> get output;
}
