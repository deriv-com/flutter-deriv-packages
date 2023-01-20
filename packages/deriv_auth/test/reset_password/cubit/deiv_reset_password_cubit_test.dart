import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_auth/features/reset_password/services/base_reset_password_service.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../mock/verify_email_request_mock.dart';

class MockResetPasswordService extends Mock
    implements BaseResetPasswordService {}

void main() {
  late final DerivResetPassCubit resetPassCubit;
  late final MockResetPasswordService service;

  setUpAll(() {
    service = MockResetPasswordService();
    resetPassCubit = DerivResetPassCubit(service: service);
  });

  group('reset password cubit tests => ', () {
    test('Should start with [DerivResetPassInitialState]', () {
      expect(resetPassCubit.state, const DerivResetPassInitialState());
    });

    test(
        'Should emit [DerivResetPassEmailSentState] after successful sendVerificationEmail.',
        () async {
      registerFallbackValue(validVerifyEmailRequest);

      when(() => service.sendVerificationEmail(any())).thenAnswer(
        (_) => Future<VerifyEmailResponseEntity>.value(
          const VerifyEmailResponseEntity(
            verifyEmail: true,
          ),
        ),
      );

      await resetPassCubit
          .sendVerificationEmail(validVerifyEmailRequest.verifyEmail!);
      expect(resetPassCubit.state, const DerivResetPassEmailSentState());

      verify(() => service.sendVerificationEmail(validVerifyEmailRequest))
          .called(1);
    });

    test(
        'Should emit [DerivResetPassErrorState] if sendVerificationEmail throws an exception.',
        () async {
      when(() => service.sendVerificationEmail(invalidVerifyEmailRequest))
          .thenThrow(Exception('Error'));

      await resetPassCubit
          .sendVerificationEmail(invalidVerifyEmailRequest.verifyEmail!);

      expect(resetPassCubit.state, isA<DerivResetPassErrorState>());
    });

    test(
        'Should emit [DerivResetPassPasswordChangedState] after successful changePassword.',
        () async {
      when(() => service.resetPassword(
              verificationCode: any(named: 'verificationCode'),
              newPassword: any(named: 'newPassword')))
          .thenAnswer((_) async => Future<bool>.value(true));

      await resetPassCubit.changePassword(
          token: '123', newPassword: 'newpassword');
      expect(resetPassCubit.state, const DerivResetPassPasswordChangedState());

      verify(() => service.resetPassword(
          verificationCode: '123', newPassword: 'newpassword')).called(1);
    });
  });

  test(
      'Should emit [DerivResetPassErrorState] if chagePassword throws an exception.',
      () async {
    when(() => service.resetPassword(
        verificationCode: any(named: 'verificationCode'),
        newPassword: any(named: 'newPassword'))).thenThrow(Exception('Error'));

    await resetPassCubit.changePassword(
        token: '123', newPassword: 'newpassword');
    expect(resetPassCubit.state, isA<DerivResetPassErrorState>());
  });
}
