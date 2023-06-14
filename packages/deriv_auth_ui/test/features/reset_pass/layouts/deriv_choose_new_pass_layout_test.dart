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
  group('DerivChooseNewPassLayout', () {
    late MockDerivResetPassCubit mockResetPassCubit;
    const token = 'test token';

    setUp(() {
      mockResetPassCubit = MockDerivResetPassCubit();
    });

    patrolTest('should render DerivChooseNewPassLayout', ($) async {
      const resetPassState = DerivResetPassInitialState();

      when(() => mockResetPassCubit.state).thenAnswer((_) => resetPassState);
      when(() => mockResetPassCubit.stream)
          .thenAnswer((_) => Stream.fromIterable([resetPassState]));

      await $.pumpApp(
        DerivChooseNewPassLayout(
          resetPassCubit: mockResetPassCubit,
          onResetPassError: (String? error) {},
          onResetPassSucceed: () {},
          token: token,
        ),
      );

      expect($(DerivChooseNewPassLayout), findsOneWidget);
    });

    patrolTest(
        'should call onResetPassError when state is DerivResetPassErrorState',
        ($) async {
      const errorState = DerivResetPassErrorState(errorMessage: 'test error');

      when(() => mockResetPassCubit.state).thenAnswer((_) => errorState);
      when(() => mockResetPassCubit.stream)
          .thenAnswer((_) => Stream.fromIterable([errorState]));

      var onResetPassErrorCalled = false;

      await $.pumpApp(
        DerivChooseNewPassLayout(
          resetPassCubit: mockResetPassCubit,
          onResetPassError: (String? error) {
            onResetPassErrorCalled = true;
          },
          onResetPassSucceed: () {},
          token: token,
        ),
      );

      expect(onResetPassErrorCalled, isTrue);
    });

    patrolTest(
        'should call onResetPassSucceed after 2 seconds when state is DerivResetPassPasswordChangedState',
        ($) async {
      const passwordChangedState = DerivResetPassPasswordChangedState();

      when(() => mockResetPassCubit.state)
          .thenAnswer((_) => passwordChangedState);
      when(() => mockResetPassCubit.stream)
          .thenAnswer((_) => Stream.fromIterable([passwordChangedState]));

      var onResetPassSucceedCalled = false;

      await $.pumpApp(
        settle: false,
        DerivChooseNewPassLayout(
          resetPassCubit: mockResetPassCubit,
          onResetPassError: (String? error) {},
          onResetPassSucceed: () {
            onResetPassSucceedCalled = true;
          },
          token: token,
        ),
      );

      await $.pump(const Duration(seconds: 2));

      expect(onResetPassSucceedCalled, isTrue);
    });

    patrolTest('should call changePassword when input is valid', ($) async {
      const resetPassState = DerivResetPassInitialState();
      const newPassTest = 'newPassWordTest123@';

      when(() => mockResetPassCubit.state).thenAnswer((_) => resetPassState);
      when(() => mockResetPassCubit.stream)
          .thenAnswer((_) => Stream.fromIterable([resetPassState]));
      when(() => mockResetPassCubit.changePassword(
          token: any(named: 'token'),
          newPassword: any(named: 'newPassword'))).thenAnswer((_) async {});

      await $.pumpApp(
        DerivChooseNewPassLayout(
          resetPassCubit: mockResetPassCubit,
          onResetPassError: (String? error) {},
          onResetPassSucceed: () {},
          token: token,
        ),
      );

      await $(BaseTextField).first.enterText(newPassTest);
      await $(ElevatedButton).first.tap();

      verify(() => mockResetPassCubit.changePassword(
          token: token, newPassword: newPassTest)).called(1);
    });

    patrolTest('should not call changePassword when input is invalid',
        ($) async {
      const resetPassState = DerivResetPassInitialState();
      const newPassTest = 'pass';

      when(() => mockResetPassCubit.state).thenAnswer((_) => resetPassState);
      when(() => mockResetPassCubit.stream)
          .thenAnswer((_) => Stream.fromIterable([resetPassState]));
      when(() => mockResetPassCubit.changePassword(
          token: any(named: 'token'),
          newPassword: any(named: 'newPassword'))).thenAnswer((_) async {});

      await $.pumpApp(
        DerivChooseNewPassLayout(
          resetPassCubit: mockResetPassCubit,
          onResetPassError: (String? error) {},
          onResetPassSucceed: () {},
          token: token,
        ),
      );

      await $(BaseTextField).first.enterText(newPassTest);
      await $(ElevatedButton).first.tap();

      verifyNever(() => mockResetPassCubit.changePassword(
          token: token, newPassword: newPassTest));
    });
  });
}
