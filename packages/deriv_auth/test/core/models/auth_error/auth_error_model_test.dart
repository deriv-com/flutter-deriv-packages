import 'package:deriv_auth/deriv_auth.dart';
import 'package:test/test.dart';

void main() {
  test('AuthErrorModel initialization test', () {
    const AuthErrorModel authError = AuthErrorModel(
      errorMessage: 'message',
      authError: AuthErrorType.invalidToken,
    );
    expect(authError, isA<AuthErrorModel>());
  });
}
