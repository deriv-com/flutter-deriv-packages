// ignore_for_file: always_specify_types

import 'package:deriv_auth/core/models/landig_comany_model.dart';
import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_auth_ui/deriv_auth_ui.dart';
import 'package:deriv_auth_ui/src/features/login/widgets/deriv_social_auth_panel.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:patrol_finders/patrol_finders.dart';
import '../../../mocks.dart';
import '../../../pump_app.dart';

void main() {
  group('DerivLoginLayout', () {
    late MockAuthCubit authCubit;

    const String welcomeLabel = 'Welcome Back';
    const String greetingLabel = 'Let\'s start trading.';

    setUpAll(() => authCubit = MockAuthCubit());

    patrolWidgetTest(
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
            welcomeLabel: welcomeLabel,
            greetingLabel: greetingLabel,
            onResetPassTapped: () {},
            onSignupTapped: () {},
            onLoggedIn: (_) {},
            onSocialAuthButtonPressed: (p0) {},
            onLoginError: (_) {},
          ),
        ),
      );

      expect($(DerivLoginLayout), findsOneWidget);
      expect($(BaseTextField).$('Email'), findsOneWidget);
      expect($(BaseTextField).$('Password'), findsOneWidget);
      expect($(DerivSocialAuthPanel), findsOneWidget);
    });

    patrolWidgetTest('displays invalid email error on invalid email typed.',
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
            welcomeLabel: welcomeLabel,
            greetingLabel: greetingLabel,
            onResetPassTapped: () {},
            onSignupTapped: () {},
            onLoggedIn: (_) {},
            onSocialAuthButtonPressed: (_) {},
            onLoginError: (_) {},
          ),
        ),
      );

      final emailField = $(BaseTextField).first;
      // final emailField = $(BaseTextField).$('Email'); --> this doesn't work

      await $.enterText(emailField, invalidEmail);

      expect($(Text).$('Enter a valid email address'), findsOneWidget);
    });

    patrolWidgetTest('displays loading error on AuthLoadingState',
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
              welcomeLabel: welcomeLabel,
              greetingLabel: greetingLabel,
              onResetPassTapped: () {},
              onSignupTapped: () {},
              onLoggedIn: (_) {},
              onSocialAuthButtonPressed: (_) {},
              onLoginError: (_) {},
            ),
          ));

      expect($(LoadingIndicator), findsOneWidget);
    });

    patrolWidgetTest('calls signupTapped when signup button is pressed.',
        (PatrolTester $) async {
      final mockAuthState = DerivAuthLoggedOutState();

      when(() => authCubit.state).thenAnswer((_) => mockAuthState);

      when(() => authCubit.stream)
          .thenAnswer((_) => Stream.fromIterable([mockAuthState]));

      bool onSignupTappedCalled = false;

      await $.pumpApp(BlocProvider<DerivAuthCubit>.value(
        value: authCubit,
        child: DerivLoginLayout(
          welcomeLabel: welcomeLabel,
          greetingLabel: greetingLabel,
          onResetPassTapped: () {},
          onSignupTapped: () {
            onSignupTappedCalled = true;
          },
          onLoggedIn: (_) {},
          onSocialAuthButtonPressed: (_) {},
          onLoginError: (_) {},
        ),
      ));

      final signupButton = $(InkWell).$('Create a new account');

      await $.scrollUntilVisible(finder: signupButton);

      await signupButton.tap();

      expect(onSignupTappedCalled, isTrue);
    });

    patrolWidgetTest('calls onLoggedIn on successful login.',
        (PatrolTester $) async {
      final mockAuthState = DerivAuthLoggedInState(
        const DerivAuthModel(
          authorizeEntity: AuthorizeEntity(),
          landingCompany: LandingCompanyEntity(),
        ),
      );

      when(() => authCubit.state).thenAnswer((_) => mockAuthState);

      when(() => authCubit.stream)
          .thenAnswer((_) => Stream.fromIterable([mockAuthState]));

      bool onLoggedInCalled = false;

      await $.pumpApp(BlocProvider<DerivAuthCubit>.value(
        value: authCubit,
        child: DerivLoginLayout(
          welcomeLabel: welcomeLabel,
          greetingLabel: greetingLabel,
          onResetPassTapped: () {},
          onSignupTapped: () {},
          onLoggedIn: (_) {
            onLoggedInCalled = true;
          },
          onSocialAuthButtonPressed: (_) {},
          onLoginError: (_) {},
        ),
      ));

      expect(onLoggedInCalled, isTrue);
    });

    patrolWidgetTest('calls onLoginError on login error.',
        (PatrolTester $) async {
      final mockAuthState = DerivAuthErrorState(
          isSocialLogin: false,
          message: 'error',
          type: AuthErrorType.failedAuthorization);

      when(() => authCubit.state).thenAnswer((_) => mockAuthState);

      when(() => authCubit.stream)
          .thenAnswer((_) => Stream.fromIterable([mockAuthState]));

      bool onLoginErrorCalled = false;

      await $.pumpApp(BlocProvider<DerivAuthCubit>.value(
        value: authCubit,
        child: DerivLoginLayout(
          welcomeLabel: welcomeLabel,
          greetingLabel: greetingLabel,
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

    patrolWidgetTest('calls [AuthErrorStateHandler] on auth error state.',
        (PatrolTester $) async {
      final mockAuthState = DerivAuthErrorState(
        isSocialLogin: false,
        message: 'error',
        type: AuthErrorType.failedAuthorization,
      );

      when(() => authCubit.state).thenAnswer((_) => mockAuthState);

      when(() => authCubit.stream)
          .thenAnswer((_) => Stream.fromIterable([mockAuthState]));

      await $.pumpApp(BlocProvider<DerivAuthCubit>.value(
        value: authCubit,
        child: DerivLoginLayout(
          welcomeLabel: welcomeLabel,
          greetingLabel: greetingLabel,
          onResetPassTapped: () {},
          onSignupTapped: () {},
          onLoginError: (_) {},
          onLoggedIn: (_) {},
          onSocialAuthButtonPressed: (_) {},
        ),
      ));

      expect($(PopupAlertDialog).$('Authorization failed.'), findsOneWidget);
    });

    patrolWidgetTest('calls resetPassTapped when reset button is pressed.',
        (PatrolTester $) async {
      final mockAuthState = DerivAuthLoggedOutState();

      when(() => authCubit.state).thenAnswer((_) => mockAuthState);

      when(() => authCubit.stream)
          .thenAnswer((_) => Stream.fromIterable([mockAuthState]));

      bool onResetPassTappedCalled = false;

      await $.pumpApp(BlocProvider<DerivAuthCubit>.value(
        value: authCubit,
        child: DerivLoginLayout(
          welcomeLabel: welcomeLabel,
          greetingLabel: greetingLabel,
          onResetPassTapped: () {
            onResetPassTappedCalled = true;
          },
          onSignupTapped: () {},
          onLoggedIn: (_) {},
          onSocialAuthButtonPressed: (_) {},
          onLoginError: (_) {},
        ),
      ));

      await $(InkWell).$('Forgot password?').tap();

      expect(onResetPassTappedCalled, isTrue);
    });

    patrolWidgetTest(
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
          welcomeLabel: welcomeLabel,
          greetingLabel: greetingLabel,
          onResetPassTapped: () {},
          onSignupTapped: () {},
          onLoggedIn: (_) {},
          onSocialAuthButtonPressed: (_) {
            onSocialAuthButtonPressedCalled = true;
          },
          onLoginError: (_) {},
        ),
      ));

      await $(IconButton).at(1).tap();

      expect(onSocialAuthButtonPressedCalled, isTrue);
    });
  });
}
