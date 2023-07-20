// ignore_for_file: always_specify_types

import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_auth_ui/deriv_auth_ui.dart';
import 'package:deriv_auth_ui/src/features/login/widgets/deriv_social_auth_panel.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:patrol/patrol.dart';

import '../../../mocks.dart';
import '../../../pump_app.dart';

void main() {
  group('DerivSignupLayout', () {
    late MockSignupCubit signupCubit;

    setUpAll(() {
      signupCubit = MockSignupCubit();

      when(() => signupCubit.state)
          .thenAnswer((_) => const DerivSignupInitialState());

      when(() => signupCubit.stream).thenAnswer(
          (_) => Stream.fromIterable([const DerivSignupInitialState()]));
    });

    patrolTest('renders correctly', (PatrolTester $) async {
      await $.pumpApp(
          settle: false,
          BlocProvider<DerivSignupCubit>.value(
            value: signupCubit,
            child: DerivSignupLayout(
              labelSignupPageText: 'Create a free account',
              labelSignupPageDescription: 'Start trading within minutes.',
              onSocialAuthButtonPressed: (_) {},
              onSingupError: (_) {},
              onSingupEmailSent: (_) {},
              onSignupPressed: () {},
              onLoginTapped: () {},
            ),
          ));

      expect($(DerivSignupLayout), findsOneWidget);
      expect($(BaseTextField).$('Email'), findsOneWidget);
      expect($(ElevatedButton).$('Create free demo account'), findsOneWidget);
      expect($(DerivSocialAuthPanel), findsOneWidget);
    });

    patrolTest(
        'onSocialAuthButtonPressed is called upon tapping social auth option',
        (PatrolTester $) async {
      bool isOnSocialAuthButtonPressedCalled = false;

      await $.pumpApp(BlocProvider<DerivSignupCubit>.value(
        value: signupCubit,
        child: DerivSignupLayout(
          labelSignupPageText: 'Create a free account',
          labelSignupPageDescription: 'Start trading within minutes.',
          onSocialAuthButtonPressed: (_) {
            isOnSocialAuthButtonPressedCalled = true;
          },
          onSingupError: (_) {},
          onSingupEmailSent: (_) {},
          onSignupPressed: () {},
          onLoginTapped: () {},
        ),
      ));

      await $.tap($(DerivSocialAuthPanel));

      expect(isOnSocialAuthButtonPressedCalled, true);
    });

    patrolTest('onSignupEmailSent is called upon sign up email sent',
        (PatrolTester $) async {
      bool isOnSignupEmailSentCalled = false;

      when(() => signupCubit.state)
          .thenAnswer((_) => const DerivSignupEmailSentState());

      when(() => signupCubit.stream).thenAnswer(
          (_) => Stream.fromIterable([const DerivSignupEmailSentState()]));

      await $.pumpApp(BlocProvider<DerivSignupCubit>.value(
        value: signupCubit,
        child: DerivSignupLayout(
          labelSignupPageText: 'Create a free account',
          labelSignupPageDescription: 'Start trading within minutes.',
          onSocialAuthButtonPressed: (_) {},
          onSingupError: (_) {},
          onSingupEmailSent: (_) => isOnSignupEmailSentCalled = true,
          onSignupPressed: () {},
          onLoginTapped: () {},
        ),
      ));

      expect(isOnSignupEmailSentCalled, true);
    });

    patrolTest('onSignupPressed is called upon tapping signup button',
        (PatrolTester $) async {
      bool isOnSignupPressedCalled = false;

      when(() => signupCubit.sendVerificationEmail('test@gmail.com'))
          .thenAnswer((_) async => const DerivSignupEmailSentState());

      await $.pumpApp(BlocProvider<DerivSignupCubit>.value(
        value: signupCubit,
        child: DerivSignupLayout(
          labelSignupPageText: 'Create a free account',
          labelSignupPageDescription: 'Start trading within minutes.',
          onSocialAuthButtonPressed: (_) {},
          onSingupError: (_) {},
          onSingupEmailSent: (_) {},
          onSignupPressed: () => isOnSignupPressedCalled = true,
          onLoginTapped: () {},
        ),
      ));

      final signUpButton = $(ElevatedButton).$('Create free demo account');

      await $.enterText($(BaseTextField), 'test@gmail.com');
      await $.tap(signUpButton);

      expect(isOnSignupPressedCalled, true);

      verify(() => signupCubit.sendVerificationEmail('test@gmail.com'))
          .called(1);
    });

    patrolTest('onLoginTapped is called upon tapping login button',
        (PatrolTester $) async {
      bool isOnLoginTappedCalled = false;

      await $.pumpApp(BlocProvider<DerivSignupCubit>.value(
        value: signupCubit,
        child: DerivSignupLayout(
          labelSignupPageText: 'Create a free account',
          labelSignupPageDescription: 'Start trading within minutes.',
          onSocialAuthButtonPressed: (_) {},
          onSingupError: (_) {},
          onSingupEmailSent: (_) {},
          onSignupPressed: () {},
          onLoginTapped: () {
            isOnLoginTappedCalled = true;
          },
        ),
      ));

      final loginButton = $(InkWell).$('Log in');

      await $.scrollUntilVisible(finder: loginButton);
      await $.tap(loginButton);

      expect(isOnLoginTappedCalled, true);
    });

    patrolTest('onSignupError is called upon signup error state',
        (PatrolTester $) async {
      bool isOnSignupErrorCalled = false;

      when(() => signupCubit.state).thenAnswer(
          (_) => const DerivSignupErrorState('This is a test error message'));

      when(() => signupCubit.stream).thenAnswer(
          (_) => Stream.fromIterable([const DerivSignupErrorState('')]));

      await $.pumpApp(BlocProvider<DerivSignupCubit>.value(
        value: signupCubit,
        child: DerivSignupLayout(
          labelSignupPageText: 'Create a free account',
          labelSignupPageDescription: 'Start trading within minutes.',
          onSocialAuthButtonPressed: (_) {},
          onSingupError: (_) => isOnSignupErrorCalled = true,
          onSingupEmailSent: (_) {},
          onSignupPressed: () {},
          onLoginTapped: () {},
        ),
      ));

      expect(isOnSignupErrorCalled, true);
    });
  });
}
