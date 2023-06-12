import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_auth_ui/deriv_auth_ui.dart';
import 'package:deriv_auth_ui/src/features/login/widgets/deriv_social_auth_panel.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:patrol/patrol.dart';

import '../../../mocks.dart';
import '../../../pump_app.dart';

void main() {
  group('DerivLoginLayout', () {
    late MockAuthCubit authCubit;

    setUpAll(() {
      authCubit = MockAuthCubit();
    });

    patrolTest(
        'renders email and password field including social auth buttons.',
        ($) async {
      final mockAuthState = DerivAuthLoggedOutState();

      when(() => authCubit.state).thenAnswer((_) => mockAuthState);

      when(() => authCubit.stream)
          .thenAnswer((_) => Stream.fromIterable([mockAuthState]));

      await $.pumpApp(DerivLoginLayout(
        authCubit: authCubit,
        onResetPassTapped: () {},
        onSignupTapped: () {},
        onLoginError: (_) {},
        onLoggedIn: (_) {},
        onSocialAuthButtonPressed: (p0) {},
      ));

      expect($(DerivLoginLayout), findsOneWidget);
      expect($(BaseTextField).$('Email'), findsOneWidget);
      expect($(BaseTextField).$('Password'), findsOneWidget);
      expect($(DerivSocialAuthPanel), findsOneWidget);
    });

    patrolTest('displays loading error on AuthLoadingState', ($) async {
      final mockAuthState = DerivAuthLoadingState();

      when(() => authCubit.state).thenAnswer((_) => mockAuthState);

      when(() => authCubit.stream)
          .thenAnswer((_) => Stream.fromIterable([mockAuthState]));

      await $.pumpApp(
          settle: false,
          DerivLoginLayout(
            authCubit: authCubit,
            onResetPassTapped: () {},
            onSignupTapped: () {},
            onLoginError: (_) {},
            onLoggedIn: (_) {},
            onSocialAuthButtonPressed: (_) {},
          ));

      expect($(LoadingIndicator), findsOneWidget);
    });

    patrolTest('calls onLoggedIn on successful login.', ($) async {
      final mockAuthState = DerivAuthLoggedInState(const AuthorizeEntity());

      when(() => authCubit.state).thenAnswer((_) => mockAuthState);

      when(() => authCubit.stream)
          .thenAnswer((_) => Stream.fromIterable([mockAuthState]));

      bool onLoggedInCalled = false;

      await $.pumpApp(DerivLoginLayout(
        authCubit: authCubit,
        onResetPassTapped: () {},
        onSignupTapped: () {},
        onLoginError: (_) {},
        onLoggedIn: (_) {
          onLoggedInCalled = true;
        },
        onSocialAuthButtonPressed: (_) {},
      ));

      expect(onLoggedInCalled, isTrue);
    });

    patrolTest('calls onLoginError on login error.', ($) async {
      final mockAuthState = DerivAuthErrorState(
          message: 'error', type: AuthErrorType.failedAuthorization);

      when(() => authCubit.state).thenAnswer((_) => mockAuthState);

      when(() => authCubit.stream)
          .thenAnswer((_) => Stream.fromIterable([mockAuthState]));

      bool onLoginErrorCalled = false;

      await $.pumpApp(DerivLoginLayout(
        authCubit: authCubit,
        onResetPassTapped: () {},
        onSignupTapped: () {},
        onLoginError: (_) {
          onLoginErrorCalled = true;
        },
        onLoggedIn: (_) {},
        onSocialAuthButtonPressed: (_) {},
      ));

      expect(onLoginErrorCalled, isTrue);
    });

    patrolTest('calls resetPassTapped when reset button is pressed.',
        ($) async {
      final mockAuthState = DerivAuthLoggedOutState();

      when(() => authCubit.state).thenAnswer((_) => mockAuthState);

      when(() => authCubit.stream)
          .thenAnswer((_) => Stream.fromIterable([mockAuthState]));

      bool onResetPassTappedCalled = false;

      await $.pumpApp(DerivLoginLayout(
        authCubit: authCubit,
        onResetPassTapped: () {
          onResetPassTappedCalled = true;
        },
        onSignupTapped: () {},
        onLoginError: (_) {},
        onLoggedIn: (_) {},
        onSocialAuthButtonPressed: (_) {},
      ));

      await $(InkWell).$('Forgot password?').tap();

      expect(onResetPassTappedCalled, isTrue);
    });

    patrolTest(
        'calls onSocialAuthButtonPressed when social auth button is pressed.',
        ($) async {
      final mockAuthState = DerivAuthLoggedOutState();

      when(() => authCubit.state).thenAnswer((_) => mockAuthState);

      when(() => authCubit.stream)
          .thenAnswer((_) => Stream.fromIterable([mockAuthState]));

      bool onSocialAuthButtonPressedCalled = false;

      await $.pumpApp(DerivLoginLayout(
        authCubit: authCubit,
        onResetPassTapped: () {},
        onSignupTapped: () {},
        onLoginError: (_) {},
        onLoggedIn: (_) {},
        onSocialAuthButtonPressed: (_) {
          onSocialAuthButtonPressedCalled = true;
        },
      ));

      await $(IconButton).at(1).tap();

      expect(onSocialAuthButtonPressedCalled, isTrue);
    });
  });
}
