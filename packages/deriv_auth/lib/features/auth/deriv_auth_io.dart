import 'package:deriv_auth/features/auth/cubit/deriv_auth_cubit.dart';

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

  /// Social login with [oneAllConnectionToken].
  Future<void> socialLogin({
    required String oneAllConnectionToken,
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
