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
  group('DerivLoginLayout', () {
    late MockAuthCubit authCubit;

    setUpAll(() => authCubit = MockAuthCubit());

    patrolTest(
        'renders email and password field including social auth buttons.',
        (PatrolTester $) async {
      final mockAuthState = DerivAuthLoggedOutState();

      when(() => authCubit.state).thenAnswer((_) => mockAuthState);

      when(() => authCubit.stream)
          .thenAnswer((_) => Stream.fromIterable([mockAuthState]));

      await $.pumpApp(
        BlocProvider<DerivAuthCubit>.value(
          value: authCubit,
          child: DerivLoginLayout(
            onResetPassTapped: () {},
            onSignupTapped: () {},
            onLoginError: (_) {},
            onLoggedIn: (_) {},
            onSocialAuthButtonPressed: (p0) {},
          ),
        ),
      );

      expect($(DerivLoginLayout), findsOneWidget);
      expect($(BaseTextField).$('Email'), findsOneWidget);
      expect($(BaseTextField).$('Password'), findsOneWidget);
      expect($(DerivSocialAuthPanel), findsOneWidget);
    });

    patrolTest('displays invalid email error on invalid email typed.',
        (PatrolTester $) async {
      final mockAuthState = DerivAuthLoggedOutState();
      const invalidEmail = 'invalid-email';

      when(() => authCubit.state).thenAnswer((_) => mockAuthState);

      when(() => authCubit.stream)
          .thenAnswer((_) => Stream.fromIterable([mockAuthState]));

      await $.pumpApp(
        BlocProvider<DerivAuthCubit>.value(
          value: authCubit,
          child: DerivLoginLayout(
            onResetPassTapped: () {},
            onSignupTapped: () {},
            onLoginError: (_) {},
            onLoggedIn: (_) {},
            onSocialAuthButtonPressed: (_) {},
          ),
        ),
      );

      final emailField = $(BaseTextField).first;
      // final emailField = $(BaseTextField).$('Email'); --> this doesn't work

      await $.enterText(emailField, invalidEmail);

      expect($(Text).$('Enter a valid email address'), findsOneWidget);
    });

    patrolTest('displays loading error on AuthLoadingState',
        (PatrolTester $) async {
      final mockAuthState = DerivAuthLoadingState();

      when(() => authCubit.state).thenAnswer((_) => mockAuthState);

      when(() => authCubit.stream)
          .thenAnswer((_) => Stream.fromIterable([mockAuthState]));

      await $.pumpApp(
          settle: false,
          BlocProvider<DerivAuthCubit>.value(
            value: authCubit,
            child: DerivLoginLayout(
              onResetPassTapped: () {},
              onSignupTapped: () {},
              onLoginError: (_) {},
              onLoggedIn: (_) {},
              onSocialAuthButtonPressed: (_) {},
            ),
          ));

      expect($(LoadingIndicator), findsOneWidget);
    });

    patrolTest('calls signupTapped when signup button is pressed.',
        (PatrolTester $) async {
      final mockAuthState = DerivAuthLoggedOutState();

      when(() => authCubit.state).thenAnswer((_) => mockAuthState);

      when(() => authCubit.stream)
          .thenAnswer((_) => Stream.fromIterable([mockAuthState]));

      bool onSignupTappedCalled = false;

      await $.pumpApp(BlocProvider<DerivAuthCubit>.value(
        value: authCubit,
        child: DerivLoginLayout(
          onResetPassTapped: () {},
          onSignupTapped: () {
            onSignupTappedCalled = true;
          },
          onLoginError: (_) {},
          onLoggedIn: (_) {},
          onSocialAuthButtonPressed: (_) {},
        ),
      ));

      final signupButton = $(InkWell).$('Create a new account');

      await $.scrollUntilVisible(finder: signupButton);

      await signupButton.tap();

      expect(onSignupTappedCalled, isTrue);
    });

    patrolTest('calls onLoggedIn on successful login.', (PatrolTester $) async {
      final mockAuthState = DerivAuthLoggedInState(const AuthorizeEntity());

      when(() => authCubit.state).thenAnswer((_) => mockAuthState);

      when(() => authCubit.stream)
          .thenAnswer((_) => Stream.fromIterable([mockAuthState]));

      bool onLoggedInCalled = false;

      await $.pumpApp(BlocProvider<DerivAuthCubit>.value(
        value: authCubit,
        child: DerivLoginLayout(
          onResetPassTapped: () {},
          onSignupTapped: () {},
          onLoginError: (_) {},
          onLoggedIn: (_) {
            onLoggedInCalled = true;
          },
          onSocialAuthButtonPressed: (_) {},
        ),
      ));

      expect(onLoggedInCalled, isTrue);
    });

    patrolTest('calls onLoginError on login error.', (PatrolTester $) async {
      final mockAuthState = DerivAuthErrorState(
          message: 'error', type: AuthErrorType.failedAuthorization);

      when(() => authCubit.state).thenAnswer((_) => mockAuthState);

      when(() => authCubit.stream)
          .thenAnswer((_) => Stream.fromIterable([mockAuthState]));

      bool onLoginErrorCalled = false;

      await $.pumpApp(BlocProvider<DerivAuthCubit>.value(
        value: authCubit,
        child: DerivLoginLayout(
          onResetPassTapped: () {},
          onSignupTapped: () {},
          onLoginError: (_) {
            onLoginErrorCalled = true;
          },
          onLoggedIn: (_) {},
          onSocialAuthButtonPressed: (_) {},
        ),
      ));

      expect(onLoginErrorCalled, isTrue);
    });

    patrolTest('calls resetPassTapped when reset button is pressed.',
        (PatrolTester $) async {
      final mockAuthState = DerivAuthLoggedOutState();

      when(() => authCubit.state).thenAnswer((_) => mockAuthState);

      when(() => authCubit.stream)
          .thenAnswer((_) => Stream.fromIterable([mockAuthState]));

      bool onResetPassTappedCalled = false;

      await $.pumpApp(BlocProvider<DerivAuthCubit>.value(
        value: authCubit,
        child: DerivLoginLayout(
          onResetPassTapped: () {
            onResetPassTappedCalled = true;
          },
          onSignupTapped: () {},
          onLoginError: (_) {},
          onLoggedIn: (_) {},
          onSocialAuthButtonPressed: (_) {},
        ),
      ));

      await $(InkWell).$('Forgot password?').tap();

      expect(onResetPassTappedCalled, isTrue);
    });

    patrolTest(
        'calls onSocialAuthButtonPressed when social auth button is pressed.',
        (PatrolTester $) async {
      final mockAuthState = DerivAuthLoggedOutState();

      when(() => authCubit.state).thenAnswer((_) => mockAuthState);

      when(() => authCubit.stream)
          .thenAnswer((_) => Stream.fromIterable([mockAuthState]));

      bool onSocialAuthButtonPressedCalled = false;

      await $.pumpApp(BlocProvider<DerivAuthCubit>.value(
        value: authCubit,
        child: DerivLoginLayout(
          onResetPassTapped: () {},
          onSignupTapped: () {},
          onLoginError: (_) {},
          onLoggedIn: (_) {},
          onSocialAuthButtonPressed: (_) {
            onSocialAuthButtonPressedCalled = true;
          },
        ),
      ));

      await $(IconButton).at(1).tap();

      expect(onSocialAuthButtonPressedCalled, isTrue);
    });
  });
}
