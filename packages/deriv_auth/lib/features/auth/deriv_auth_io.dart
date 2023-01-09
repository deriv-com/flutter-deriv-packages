import 'package:deriv_auth/features/auth/cubit/deriv_auth_cubit.dart';

/// Functionality that DerivAuthCubit provides.
abstract class DerivAuthIO {
  /// Login with [email] and [password].
  Future<void> systemLogin({
    required String email,
    required String password,
  });

  /// Social login with [oneAllConnectionToken].
  Future<void> socialLogin({required String oneAllConnectionToken});

  /// Two-Factor Authentication login with [email], [password] and [otp].
  Future<void> otpLogin({
    required String email,
    required String password,
    required String otp,
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
