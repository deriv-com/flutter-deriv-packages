// ignore_for_file: always_specify_types

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
  late MockAuthCubit authCubit;
  late MockSignupCubit signupCubit;

  setUp(() {
    authCubit = MockAuthCubit();
    signupCubit = MockSignupCubit();

    when(() => authCubit.state).thenReturn(DerivAuthLoggedOutState());
    when(() => authCubit.stream)
        .thenAnswer((_) => Stream.fromIterable([DerivAuthLoggedOutState()]));

    when(() => signupCubit.state).thenReturn(const DerivSignupInitialState());
    when(() => signupCubit.stream).thenAnswer(
        (_) => Stream.fromIterable([const DerivSignupInitialState()]));
    when(() => signupCubit.close()).thenAnswer((_) async {});
  });

  group('DerivSetPasswordLayout', () {
    patrolTest('renders correctly', (PatrolTester $) async {
      await $.pumpApp(
          settle: false,
          DerivSetPasswordLayout(
            authCubit: authCubit,
            signupCubit: signupCubit,
            onDerivAuthState: (_, __) {},
            onDerivSignupState: (_, __) {},
            onPreviousPressed: () {},
            verificationCode: '123456',
            residence: 'id',
          ));

      expect($(DerivSetPasswordLayout), findsOneWidget);
      expect($(BaseTextField).$('Create a password'), findsOneWidget);
      expect($(ElevatedButton), findsNWidgets(2));
    });

    patrolTest('onDerivAuthState is called on DerivAuth state changes',
        (PatrolTester $) async {
      bool isOnDerivAuthStateCalled = false;

      when(() => authCubit.stream).thenAnswer((_) => Stream.fromIterable([
            DerivAuthLoadingState(),
            DerivAuthLoggedOutState(),
          ]));

      await $.pumpApp(DerivSetPasswordLayout(
          authCubit: authCubit,
          signupCubit: signupCubit,
          onDerivAuthState: (_, __) => isOnDerivAuthStateCalled = true,
          onDerivSignupState: (_, __) {},
          onPreviousPressed: () {},
          verificationCode: 'verificationCode',
          residence: 'residence'));

      expect(isOnDerivAuthStateCalled, true);
    });

    patrolTest('onDerivSignupState is called on DerivSignup state changes',
        (PatrolTester $) async {
      bool isOnDerivSignupStateCalled = false;

      when(() => signupCubit.stream).thenAnswer((_) => Stream.fromIterable([
            const DerivSignupInitialState(),
            const DerivSignupProgressState(),
          ]));

      await $.pumpApp(
          settle: false,
          DerivSetPasswordLayout(
              authCubit: authCubit,
              signupCubit: signupCubit,
              onDerivAuthState: (_, __) {},
              onDerivSignupState: (_, __) => isOnDerivSignupStateCalled = true,
              onPreviousPressed: () {},
              verificationCode: 'verificationCode',
              residence: 'residence'));

      expect(isOnDerivSignupStateCalled, true);
    });

    patrolTest('onPreviousPressed is called upon tapping previous button',
        (PatrolTester $) async {
      bool isOnPreviousPressedCalled = false;

      await $.pumpApp(
          settle: false,
          DerivSetPasswordLayout(
              authCubit: authCubit,
              signupCubit: signupCubit,
              onDerivAuthState: (_, __) {},
              onDerivSignupState: (_, __) {},
              onPreviousPressed: () => isOnPreviousPressedCalled = true,
              verificationCode: 'verificationCode',
              residence: 'residence'));

      await $.tap($(ElevatedButton).$('Previous'));

      expect(isOnPreviousPressedCalled, true);
    });

    patrolTest('password is no longer obscure after visibility icon pressed',
        ($) async {
      await $.pumpApp(
          settle: false,
          DerivSetPasswordLayout(
              authCubit: authCubit,
              signupCubit: signupCubit,
              onDerivAuthState: (_, __) {},
              onDerivSignupState: (_, __) {},
              onPreviousPressed: () {},
              verificationCode: 'verificationCode',
              residence: 'residence'));

      await $.pump();

      await $.tap($(Icons.visibility_off));

      expect($(Icons.visibility), findsOneWidget);
      expect(
          $(BaseTextField)
              .which<BaseTextField>((widget) => widget.obscureText == false),
          findsOneWidget);
    });

    patrolTest('start trading button is disabled until password is valid',
        ($) async {
      const validPassword = 'Abcdefg123';

      await $.pumpApp(
          settle: false,
          DerivSetPasswordLayout(
              authCubit: authCubit,
              signupCubit: signupCubit,
              onDerivAuthState: (_, __) {},
              onDerivSignupState: (_, __) {},
              onPreviousPressed: () {},
              verificationCode: 'verificationCode',
              residence: 'residence'));

      final startTradingButton = $(ElevatedButton).$('Start trading');

      bool isStartTradingButtonEnabled =
          startTradingButton.hitTestable().exists;

      expect(isStartTradingButtonEnabled, false);

      await $.enterText($(BaseTextField), validPassword);

      isStartTradingButtonEnabled = startTradingButton.hitTestable().exists;

      expect(isStartTradingButtonEnabled, true);
    });
  });
}
