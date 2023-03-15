import 'package:mocktail/mocktail.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_auth/features/signup/services/base_signup_service.dart';

import '../mock/signup_mock_data.dart';

class MockSignupService extends Mock implements BaseSignupService {}

void main() {
  late final DerivSignupCubit cubit;
  late final MockSignupService service;

  setUpAll(() {
    service = MockSignupService();
    cubit = DerivSignupCubit.initWithMyAffiliate(
        service: service,
        requestModel: const MyAffiliateReferralCodeRequestModel(
          authToken: '',
          brandId: '',
          feedId: '',
          host: '',
        ));
  });

  group('signup cubit test =>', () {
    test('Shouold start with [DerivSignupInitialState].', () {
      expect(cubit.state, const DerivSignupInitialState());
    });

    test(
        'Should emit [DerivSignupEmailSentState] after successful sendVerificationEmail.',
        () async {
      registerFallbackValue(validVerifyEmailRequest);

      final DateTime time = DateTime.now();
      when(() => service.getClientServerTime()).thenAnswer((_) async => time);

      when(() => service.sendVerificationEmail(any())).thenAnswer((_) =>
          Future<VerifyEmailResponseEntity>.value(validVerifyEmailResponse));

      await cubit.sendVerificationEmail('test@example.com');
      expect(cubit.state, const DerivSignupEmailSentState());

      verify(() => service.getClientServerTime()).called(1);
    });

    test(
        'Should emit [DerivSignupErrorState] when sendVerificationEmail throws an exception.',
        () async {
      // test error state
      when(() => service.sendVerificationEmail(any()))
          .thenThrow(Exception('Error'));

      await cubit.sendVerificationEmail('test@example.com');
      expect(cubit.state, isA<DerivSignupErrorState>());
    });

    test(
        'Should emit [DerivSignupDoneState] after successfull openNewVirtualAccount.',
        () async {
      registerFallbackValue(validNewVirtualAccountModel);

      when(
        () => service.openNewVirtualAccount(
          newVirtualAccountModel: any(named: 'newVirtualAccountModel'),
        ),
      ).thenAnswer((_) => Future<AccountModel>.value(accountResponse));

      await cubit.openNewVirtualAccount(validNewVirtualAccountModel);
      expect(cubit.state, isA<DerivSignupDoneState>());

      verify(
        () => service.openNewVirtualAccount(
            newVirtualAccountModel: validNewVirtualAccountModel),
      ).called(1);
    });

    test(
        'Should emit [DerivSignupErrorState] when openNewVirtualAccount throws an exception.',
        () async {
      when(
        () => service.openNewVirtualAccount(
          newVirtualAccountModel: any(
            named: 'newVirtualAccountModel',
          ),
        ),
      ).thenThrow(Exception('Error'));

      await cubit.openNewVirtualAccount(validNewVirtualAccountModel);
      expect(cubit.state, isA<DerivSignupErrorState>());
    });
  });
}
