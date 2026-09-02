import 'package:deriv_auth/deriv_auth.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('DerivAuthException', () {
    test('has concise toString', () {
      expect(
          DerivAuthException(
                  message: 'mock', type: AuthErrorType.connectionError)
              .toString(),
          'mock');
    });

    test('can hold optional data payload', () {
      final DerivAuthException exception = DerivAuthException(
        message: 'test message',
        type: AuthErrorType.socialSignupIncomplete,
        data: <String, dynamic>{'signup_code': 'test123'},
      );

      expect(exception.data, isNotNull);
      expect(exception.data?['signup_code'], equals('test123'));
    });

    test('works without data payload', () {
      final DerivAuthException exception = DerivAuthException(
        message: 'test message',
        type: AuthErrorType.connectionError,
      );

      expect(exception.data, isNull);
    });
  });
}
