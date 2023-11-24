// ignore_for_file: always_specify_types

import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_auth_ui/deriv_auth_ui.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:patrol_finders/patrol_finders.dart';
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
    patrolWidgetTest('renders correctly', (PatrolTester $) async {
      await $.pumpApp(
          settle: false,
          MultiBlocProvider(
            providers: [
              BlocProvider<DerivAuthCubit>.value(value: authCubit),
              BlocProvider<DerivSignupCubit>.value(value: signupCubit),
            ],
            child: DerivSetPasswordLayout(
              onDerivSignupState: (_, __) {},
              onPreviousPressed: () {},
              verificationCode: '123456',
              residence: 'id',
            ),
          ));

      expect($(DerivSetPasswordLayout), findsOneWidget);
      expect($(BaseTextField).$('Create a password'), findsOneWidget);
      expect($(ElevatedButton), findsNWidgets(2));
    });

    patrolWidgetTest(
        'onDerivSignupState is called on DerivSignup state changes',
        (PatrolTester $) async {
      bool isOnDerivSignupStateCalled = false;

      when(() => signupCubit.stream).thenAnswer((_) => Stream.fromIterable([
            const DerivSignupInitialState(),
            const DerivSignupProgressState(),
          ]));

      await $.pumpApp(
          settle: false,
          MultiBlocProvider(
            providers: [
              BlocProvider<DerivAuthCubit>.value(value: authCubit),
              BlocProvider<DerivSignupCubit>.value(value: signupCubit),
            ],
            child: DerivSetPasswordLayout(
                onDerivSignupState: (_, __) =>
                    isOnDerivSignupStateCalled = true,
                onPreviousPressed: () {},
                verificationCode: 'verificationCode',
                residence: 'residence'),
          ));

      expect(isOnDerivSignupStateCalled, true);
    });

    patrolWidgetTest('calls [AuthErrorStateHandler] on auth error state.',
        (PatrolTester $) async {
      final mockAuthState = DerivAuthErrorState(
        isSocialLogin: false,
        message: 'error',
        type: AuthErrorType.failedAuthorization,
      );

      when(() => authCubit.state).thenReturn(mockAuthState);
      when(() => authCubit.stream)
          .thenAnswer((_) => Stream.fromIterable([mockAuthState]));

      await $.pumpApp(MultiBlocProvider(
        providers: [
          BlocProvider<DerivAuthCubit>.value(value: authCubit),
          BlocProvider<DerivSignupCubit>.value(value: signupCubit),
        ],
        child: DerivSetPasswordLayout(
            onDerivSignupState: (_, __) {},
            onPreviousPressed: () {},
            verificationCode: 'verificationCode',
            residence: 'residence'),
      ));

      expect($(PopupAlertDialog).$('Authorization failed.'), findsOneWidget);
    });

    patrolWidgetTest('onAuthError is called on auth error state.',
        (PatrolTester $) async {
      final mockAuthState = DerivAuthErrorState(
        isSocialLogin: false,
        message: 'error',
        type: AuthErrorType.failedAuthorization,
      );

      when(() => authCubit.state).thenReturn(mockAuthState);
      when(() => authCubit.stream)
          .thenAnswer((_) => Stream.fromIterable([mockAuthState]));

      bool isOnAuthErrorCalled = false;

      await $.pumpApp(MultiBlocProvider(
        providers: [
          BlocProvider<DerivAuthCubit>.value(value: authCubit),
          BlocProvider<DerivSignupCubit>.value(value: signupCubit),
        ],
        child: DerivSetPasswordLayout(
            onDerivSignupState: (_, __) {},
            onPreviousPressed: () {},
            onAuthError: (_) {
              isOnAuthErrorCalled = true;
            },
            verificationCode: 'verificationCode',
            residence: 'residence'),
      ));

      expect(isOnAuthErrorCalled, true);
    });

    patrolWidgetTest('onPreviousPressed is called upon tapping previous button',
        (PatrolTester $) async {
      bool isOnPreviousPressedCalled = false;

      await $.pumpApp(
          settle: false,
          MultiBlocProvider(
            providers: [
              BlocProvider<DerivAuthCubit>.value(value: authCubit),
              BlocProvider<DerivSignupCubit>.value(value: signupCubit),
            ],
            child: DerivSetPasswordLayout(
                onDerivSignupState: (_, __) {},
                onPreviousPressed: () => isOnPreviousPressedCalled = true,
                verificationCode: 'verificationCode',
                residence: 'residence'),
          ));

      await $.tap($(ElevatedButton).$('Previous'));

      expect(isOnPreviousPressedCalled, true);
    });

    patrolWidgetTest(
        'password is no longer obscure after visibility icon pressed',
        (PatrolTester $) async {
      await $.pumpApp(
          settle: false,
          MultiBlocProvider(
            providers: [
              BlocProvider<DerivAuthCubit>.value(value: authCubit),
              BlocProvider<DerivSignupCubit>.value(value: signupCubit),
            ],
            child: DerivSetPasswordLayout(
                onDerivSignupState: (_, __) {},
                onPreviousPressed: () {},
                verificationCode: 'verificationCode',
                residence: 'residence'),
          ));

      await $.pump();

      await $.tap($(Icons.visibility_off));

      expect($(Icons.visibility), findsOneWidget);
      expect(
          $(BaseTextField)
              .which<BaseTextField>((widget) => widget.obscureText == false),
          findsOneWidget);
    });

    patrolWidgetTest('start trading button is disabled until password is valid',
        (PatrolTester $) async {
      const validPassword = 'Abcdefg123';

      await $.pumpApp(
          settle: false,
          MultiBlocProvider(
            providers: [
              BlocProvider<DerivAuthCubit>.value(value: authCubit),
              BlocProvider<DerivSignupCubit>.value(value: signupCubit),
            ],
            child: DerivSetPasswordLayout(
                onDerivSignupState: (_, __) {},
                onPreviousPressed: () {},
                verificationCode: 'verificationCode',
                residence: 'residence'),
          ));

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
