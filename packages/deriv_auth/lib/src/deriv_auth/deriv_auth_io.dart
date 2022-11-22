import 'package:deriv_auth/src/models/account/account.dart';

import 'deriv_auth_state.dart';

abstract class DerivAuthIO {
  Future<void> systemLogin({
    required String email,
    required String password,
  });

  Future<void> socialLogin({required String oneAllConnectionToken});

  Future<void> otpLogin({
    required String email,
    required String password,
    required String otp,
  });

  Future<void> logout();

  Future<void> authorizeDefaultAccount();

  Stream<DerivAuthState> get output;
}
