import 'package:deriv_auth/core/models/verify_email_model.dart';
import 'package:test/test.dart';

void main() {
  const VerifyEmailResponseEntity mockVerifyEmailResponseEntity =
      VerifyEmailResponseEntity(
    verifyEmail: false,
  );

  group('VerifyEmailResponsEntity', () {
    test('supports fromJson', () {
      final VerifyEmailResponseEntity verifyEmailResponseEntity =
          VerifyEmailResponseEntity.fromJson(<String, dynamic>{
        'verify_email': false,
      });

      expect(verifyEmailResponseEntity.verifyEmail, false);
    });

    test(
      'supports toJson',
      () => expect(
        mockVerifyEmailResponseEntity.toJson(),
        <String, dynamic>{
          'verify_email': false,
        },
      ),
    );

    test('has a valid copyWith', () {
      expect(
          mockVerifyEmailResponseEntity.copyWith(verifyEmail: true).verifyEmail,
          true);
      expect(mockVerifyEmailResponseEntity.copyWith().verifyEmail, false);
    });
  });
}
