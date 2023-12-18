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
  });
}
