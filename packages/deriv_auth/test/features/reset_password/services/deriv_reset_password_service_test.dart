import 'package:deriv_auth/deriv_auth.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../mock/verify_email_request_mock.dart';
import '../mock/verify_email_response_mock.dart';

class MockResetPasswordRepository extends Mock
    implements BaseResetPasswordRepository {}

void main() {
  const String validVerificationCode = 'valid-verification-code';
  const String invalidVerificationCode = 'invalid-verification-code';

  late final BaseResetPasswordRepository repository;
  late final DerivResetPasswordService service;

  setUpAll(() {
    repository = MockResetPasswordRepository();
    service = DerivResetPasswordService(repository: repository);

    when(() => repository.resetPassword(
        verificationCode:
            any(named: 'verificationCode', that: equals(validVerificationCode)),
        newPassword: any(named: 'newPassword'))).thenAnswer(
      (_) => Future<bool>.value(true),
    );

    when(() => repository.resetPassword(
        verificationCode: any(
            named: 'verificationCode', that: equals(invalidVerificationCode)),
        newPassword: any(named: 'newPassword'))).thenAnswer(
      (_) => Future<bool>.value(false),
    );
  });

  group(
    'reset password service test',
    () {
      test('returns TRUE if verification code is valid.', () async {
        final bool response = await service.resetPassword(
          verificationCode: validVerificationCode,
          newPassword: 'RandomNewPassword1234',
        );

        expect(response, equals(true));
        verify(() => repository.resetPassword(
            verificationCode: validVerificationCode,
            newPassword: 'RandomNewPassword1234')).called(1);
      });
      test('returns FALSE if verification code is invalid.', () async {
        final bool response = await service.resetPassword(
          verificationCode: invalidVerificationCode,
          newPassword: 'RandomNewPassword1234',
        );

        expect(response, equals(false));

        verify(() => repository.resetPassword(
            verificationCode: invalidVerificationCode,
            newPassword: 'RandomNewPassword1234')).called(1);
      });

      test(
          'returns [VerifyEmailResponseEntity] with [verifyEmail] true on verification email sent',
          () async {
        registerFallbackValue(validVerifyEmailRequest);

        when(() => repository.sendVerificationEmail(
              validVerifyEmailRequest,
            )).thenAnswer((_) => Future<VerifyEmailResponseEntity>.value(
              emailSentResponseEntity,
            ));

        final VerifyEmailResponseEntity response =
            await service.sendVerificationEmail(validVerifyEmailRequest);

        expect(response, isA<VerifyEmailResponseEntity>());
        expect(response.verifyEmail, equals(true));
      });

      test(
          'returns [VerifyEmailResponseEntity] with [verifyEmail] false on verification email not sent',
          () async {
        when(() => repository.sendVerificationEmail(
              invalidVerifyEmailRequest,
            )).thenAnswer((_) => Future<VerifyEmailResponseEntity>.value(
              emailNotSentResponseEntity,
            ));

        final VerifyEmailResponseEntity response =
            await service.sendVerificationEmail(invalidVerifyEmailRequest);

        expect(response, isA<VerifyEmailResponseEntity>());
        expect(response.verifyEmail, equals(false));
      });
    },
  );
}
