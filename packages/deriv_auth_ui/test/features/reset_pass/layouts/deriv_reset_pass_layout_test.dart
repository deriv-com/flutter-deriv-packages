import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_auth_ui/deriv_auth_ui.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:patrol/patrol.dart';

import '../../../mocks.dart';
import '../../../pump_app.dart';

void main() {
  group('DerivResetPassLayout', () {
    late MockDerivResetPassCubit mockResetPassCubit;

    setUpAll(() {
      mockResetPassCubit = MockDerivResetPassCubit();
    });

    patrolTest('should render DerivResetPassLayout', ($) async {
      const resetPassState = DerivResetPassInitialState();

      when(() => mockResetPassCubit.state).thenAnswer((_) => resetPassState);
      when(() => mockResetPassCubit.stream)
          .thenAnswer((_) => Stream.fromIterable([resetPassState]));

      await $.pumpApp(
        DerivResetPassLayout(
          cubit: mockResetPassCubit,
          onResetPassError: (String? error) {},
        ),
      );

      expect($(DerivResetPassLayout), findsOneWidget);
    });

    patrolTest(
        'should show emailSentPage when state is DerivResetPassEmailSentState',
        ($) async {
      const resetPassState = DerivResetPassEmailSentState();

      when(() => mockResetPassCubit.state).thenAnswer((_) => resetPassState);
      when(() => mockResetPassCubit.stream)
          .thenAnswer((_) => Stream.fromIterable([resetPassState]));

      await $.pumpApp(
        DerivResetPassLayout(
          cubit: mockResetPassCubit,
          onResetPassError: (String? error) {},
        ),
      );

      expect(
          $(PageView)
              .which<PageView>((pageView) => pageView.controller.page == 1),
          findsOneWidget);
    });

    patrolTest(
        'should show submitEmailForm when state is DerivResetPassInitialState',
        ($) async {
      const resetPassState = DerivResetPassInitialState();

      when(() => mockResetPassCubit.state).thenAnswer((_) => resetPassState);
      when(() => mockResetPassCubit.stream)
          .thenAnswer((_) => Stream.fromIterable([resetPassState]));

      await $.pumpApp(
        DerivResetPassLayout(
          cubit: mockResetPassCubit,
          onResetPassError: (String? error) {},
        ),
      );

      expect(
          $(PageView)
              .which<PageView>((pageView) => pageView.controller.page == 0),
          findsOneWidget);
    });

    patrolTest('should not call sendVerificationEmail when email is invalid',
        ($) async {
      const resetPassState = DerivResetPassInitialState();
      const email = 'wrongEmail@format';

      when(() => mockResetPassCubit.state).thenAnswer((_) => resetPassState);
      when(() => mockResetPassCubit.stream)
          .thenAnswer((_) => Stream.fromIterable([resetPassState]));

      await $.pumpApp(
        DerivResetPassLayout(
          cubit: mockResetPassCubit,
          onResetPassError: (String? error) {},
        ),
      );

      var emailTextField = $(BaseTextField).which<BaseTextField>(
          (baseTextField) => baseTextField.labelText == 'Email');

      await $.enterText(emailTextField, email);

      await $(ElevatedButton).tap();

      verifyNever(() => mockResetPassCubit.sendVerificationEmail(email));
    });

    patrolTest('should call sendVerificationEmail when email is valid',
        ($) async {
      const resetPassState = DerivResetPassInitialState();
      const email = 'correctEmail@format.com';

      when(() => mockResetPassCubit.state).thenAnswer((_) => resetPassState);
      when(() => mockResetPassCubit.stream)
          .thenAnswer((_) => Stream.fromIterable([resetPassState]));
      when(() => mockResetPassCubit.sendVerificationEmail(email))
          .thenAnswer((_) async {});

      await $.pumpApp(
        DerivResetPassLayout(
          cubit: mockResetPassCubit,
          onResetPassError: (String? error) {},
        ),
      );

      var emailTextField = $(BaseTextField).which<BaseTextField>(
          (baseTextField) => baseTextField.labelText == 'Email');

      await $.enterText(emailTextField, email);

      await $(ElevatedButton).tap();

      verify(() => mockResetPassCubit.sendVerificationEmail(email)).called(1);
    });

    patrolTest(
        'should call OnResetPassError when state is DerivResetPassErrorState',
        ($) async {
      const errorState = DerivResetPassErrorState(errorMessage: 'test error');

      when(() => mockResetPassCubit.state).thenAnswer((_) => errorState);
      when(() => mockResetPassCubit.stream)
          .thenAnswer((_) => Stream.fromIterable([errorState]));

      var onResetPassErrorCalled = false;

      await $.pumpApp(
        DerivResetPassLayout(
          cubit: mockResetPassCubit,
          onResetPassError: (String? error) {
            onResetPassErrorCalled = true;
          },
        ),
      );

      expect(onResetPassErrorCalled, isTrue);
    });
  });
}
