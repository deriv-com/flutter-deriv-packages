import 'package:deriv_auth/core/exceptions/referral_code_exception.dart';
import 'package:test/test.dart';

void main() {
  group('ReferralCodeException', () {
    test('has concise toString', () {
      expect(
        ReferralCodeException(
          'mock',
        ).toString(),
        'mock',
      );
    });
  });
}
