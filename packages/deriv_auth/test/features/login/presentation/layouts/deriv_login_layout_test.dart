import 'package:deriv_auth/core/models/landig_comany_model.dart';
import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nested/nested.dart';
import 'package:patrol_finders/patrol_finders.dart';

import '../../../../mocks.dart';
import '../../../../pump_app.dart';

void main() {
  group('DerivLoginLayout', () {
    late MockAuthCubit authCubit;
    late MockSocialAuthCubit socialAuthCubit;

    const String welcomeLabel = 'Welcome Back';
    const String greetingLabel = 'Let\'s start trading.';

    setUpAll(() {
      authCubit = MockAuthCubit();
      socialAuthCubit = MockSocialAuthCubit();

      registerFallbackValue(SocialAuthProvider.google);

      when(() => socialAuthCubit.stream).thenAnswer((_) =>
          Stream<SocialAuthState>.fromIterable(<SocialAuthState>[
            SocialAuthLoadedState(
                socialAuthProviders: <SocialAuthProviderModel>[])
          ]));

      when(() => socialAuthCubit.state).thenAnswer((_) => SocialAuthLoadedState(
          socialAuthProviders: <SocialAuthProviderModel>[]));
    });

    patrolWidgetTest(
        'renders email and password field including social auth buttons.',
        (PatrolTester $) async {
      final DerivAuthLoggedOutState mockAuthState = DerivAuthLoggedOutState();

      when(() => authCubit.state).thenAnswer((_) => mockAuthState);

      when(() => authCubit.stream).thenAnswer((_) =>
          Stream<DerivAuthState>.fromIterable(<DerivAuthState>[mockAuthState]));

      await $.pumpApp(
        MultiBlocProvider(
          providers: <SingleChildWidget>[
            BlocProvider<DerivAuthCubit>.value(value: authCubit),
            BlocProvider<SocialAuthCubit>.value(value: socialAuthCubit),
          ],
          child: DerivLoginLayout(
            socialAuthStateHandler: (SocialAuthState state) {},
            redirectURL: 'deriv://example',
            onWebViewError: (String error) {},
            welcomeLabel: welcomeLabel,
            greetingLabel: greetingLabel,
            onResetPassTapped: () {},
            onSignupTapped: () {},
            onLoggedIn: (_) {},
            onSocialAuthButtonPressed: (SocialAuthDto p0) {},
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
      final DerivAuthLoggedOutState mockAuthState = DerivAuthLoggedOutState();
      const String invalidEmail = 'invalid-email';

      when(() => authCubit.state).thenAnswer((_) => mockAuthState);

      when(() => authCubit.stream).thenAnswer((_) =>
          Stream<DerivAuthState>.fromIterable(<DerivAuthState>[mockAuthState]));

      await $.pumpApp(
        MultiBlocProvider(
          providers: <SingleChildWidget>[
            BlocProvider<DerivAuthCubit>.value(value: authCubit),
            BlocProvider<SocialAuthCubit>.value(value: socialAuthCubit),
          ],
          child: DerivLoginLayout(
            socialAuthStateHandler: (SocialAuthState state) {},
            redirectURL: 'deriv://example',
            onWebViewError: (String error) {},
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

      final PatrolFinder emailField = $(BaseTextField).first;
      // final emailField = $(BaseTextField).$('Email'); --> this doesn't work

      await $.enterText(emailField, invalidEmail);

      expect($(Text).$('Enter a valid email address'), findsOneWidget);
    });

    patrolWidgetTest('displays loading error on AuthLoadingState',
        (PatrolTester $) async {
      final DerivAuthLoadingState mockAuthState = DerivAuthLoadingState();

      when(() => authCubit.state).thenAnswer((_) => mockAuthState);

      when(() => authCubit.stream).thenAnswer((_) =>
          Stream<DerivAuthState>.fromIterable(<DerivAuthState>[mockAuthState]));

      await $.pumpApp(
          settle: false,
          MultiBlocProvider(
            providers: <SingleChildWidget>[
              BlocProvider<DerivAuthCubit>.value(value: authCubit),
              BlocProvider<SocialAuthCubit>.value(value: socialAuthCubit),
            ],
            child: DerivLoginLayout(
              socialAuthStateHandler: (SocialAuthState state) {},
              redirectURL: 'deriv://example',
              onWebViewError: (String error) {},
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
      final DerivAuthLoggedOutState mockAuthState = DerivAuthLoggedOutState();

      when(() => authCubit.state).thenAnswer((_) => mockAuthState);

      when(() => authCubit.stream).thenAnswer((_) =>
          Stream<DerivAuthState>.fromIterable(<DerivAuthState>[mockAuthState]));

      bool onSignupTappedCalled = false;

      await $.pumpApp(MultiBlocProvider(
        providers: <SingleChildWidget>[
          BlocProvider<DerivAuthCubit>.value(value: authCubit),
          BlocProvider<SocialAuthCubit>.value(value: socialAuthCubit),
        ],
        child: DerivLoginLayout(
          socialAuthStateHandler: (SocialAuthState state) {},
          redirectURL: 'deriv://example',
          onWebViewError: (String error) {},
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

      final PatrolFinder signupButton = $(InkWell).$('Create a new account');

      await $.scrollUntilVisible(finder: signupButton);

      await signupButton.tap();

      expect(onSignupTappedCalled, isTrue);
    });

    patrolWidgetTest('calls onLoggedIn on successful login.',
        (PatrolTester $) async {
      final DerivAuthLoggedInState mockAuthState = DerivAuthLoggedInState(
        const DerivAuthModel(
          authorizeEntity: AuthorizeEntity(),
          landingCompany: LandingCompanyEntity(),
        ),
      );

      when(() => authCubit.state).thenAnswer((_) => mockAuthState);

      when(() => authCubit.stream).thenAnswer((_) =>
          Stream<DerivAuthState>.fromIterable(<DerivAuthState>[mockAuthState]));

      bool onLoggedInCalled = false;

      await $.pumpApp(MultiBlocProvider(
        providers: <SingleChildWidget>[
          BlocProvider<DerivAuthCubit>.value(value: authCubit),
          BlocProvider<SocialAuthCubit>.value(value: socialAuthCubit),
        ],
        child: DerivLoginLayout(
          socialAuthStateHandler: (SocialAuthState state) {},
          redirectURL: 'deriv://example',
          onWebViewError: (String error) {},
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
      final DerivAuthErrorState mockAuthState = DerivAuthErrorState(
          isSocialLogin: false,
          message: 'error',
          type: AuthErrorType.failedAuthorization);

      when(() => authCubit.state).thenAnswer((_) => mockAuthState);

      when(() => authCubit.stream).thenAnswer((_) =>
          Stream<DerivAuthState>.fromIterable(<DerivAuthState>[mockAuthState]));

      bool onLoginErrorCalled = false;

      await $.pumpApp(MultiBlocProvider(
        providers: <SingleChildWidget>[
          BlocProvider<DerivAuthCubit>.value(value: authCubit),
          BlocProvider<SocialAuthCubit>.value(value: socialAuthCubit),
        ],
        child: DerivLoginLayout(
          socialAuthStateHandler: (SocialAuthState state) {},
          redirectURL: 'deriv://example',
          onWebViewError: (String error) {},
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
      final DerivAuthErrorState mockAuthState = DerivAuthErrorState(
        isSocialLogin: false,
        message: 'Authorization failed.',
        type: AuthErrorType.failedAuthorization,
      );

      when(() => authCubit.state).thenAnswer((_) => mockAuthState);

      when(() => authCubit.stream).thenAnswer((_) =>
          Stream<DerivAuthState>.fromIterable(<DerivAuthState>[mockAuthState]));

      await $.pumpApp(MultiBlocProvider(
        providers: <SingleChildWidget>[
          BlocProvider<DerivAuthCubit>.value(value: authCubit),
          BlocProvider<SocialAuthCubit>.value(value: socialAuthCubit),
        ],
        child: DerivLoginLayout(
          socialAuthStateHandler: (SocialAuthState state) {},
          redirectURL: 'deriv://example',
          onWebViewError: (String error) {},
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
      final DerivAuthLoggedOutState mockAuthState = DerivAuthLoggedOutState();

      when(() => authCubit.state).thenAnswer((_) => mockAuthState);

      when(() => authCubit.stream).thenAnswer((_) =>
          Stream<DerivAuthState>.fromIterable(<DerivAuthState>[mockAuthState]));

      bool onResetPassTappedCalled = false;

      await $.pumpApp(MultiBlocProvider(
        providers: <SingleChildWidget>[
          BlocProvider<DerivAuthCubit>.value(value: authCubit),
          BlocProvider<SocialAuthCubit>.value(value: socialAuthCubit),
        ],
        child: DerivLoginLayout(
          socialAuthStateHandler: (SocialAuthState state) {},
          redirectURL: 'deriv://example',
          onWebViewError: (String error) {},
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
      final DerivAuthLoggedOutState mockAuthState = DerivAuthLoggedOutState();

      bool onSocialAuthButtonPressedCalled = false;

      when(() => authCubit.state).thenAnswer((_) => mockAuthState);

      when(() => authCubit.stream).thenAnswer((_) =>
          Stream<DerivAuthState>.fromIterable(<DerivAuthState>[mockAuthState]));

      /// Should be called when social auth button is pressed.
      when(() => socialAuthCubit.selectSocialLoginProvider(
          selectedSocialAuthProvider: any(named: 'selectedSocialAuthProvider'),
          redirectUrl: 'deriv://example',
          onWebViewError: any(named: 'onWebViewError'),
          onRedirectUrlReceived:
              any(named: 'onRedirectUrlReceived'))).thenAnswer((_) async {
        onSocialAuthButtonPressedCalled = true;
      });

      await $.pumpApp(MultiBlocProvider(
        providers: <SingleChildWidget>[
          BlocProvider<DerivAuthCubit>.value(value: authCubit),
          BlocProvider<SocialAuthCubit>.value(value: socialAuthCubit),
        ],
        child: DerivLoginLayout(
          socialAuthStateHandler: (SocialAuthState state) {},
          redirectURL: 'deriv://example',
          onWebViewError: (String error) {},
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

    patrolWidgetTest('calls socialAuthHandler on [SocialAuthState]',
        (PatrolTester $) async {
      final DerivAuthLoggedOutState mockAuthState = DerivAuthLoggedOutState();

      bool onSocialAuthHandlerCalled = false;

      when(() => authCubit.state).thenAnswer((_) => mockAuthState);

      when(() => authCubit.stream).thenAnswer((_) =>
          Stream<DerivAuthState>.fromIterable(<DerivAuthState>[mockAuthState]));

      when(() => socialAuthCubit.stream).thenAnswer((_) =>
          Stream<SocialAuthState>.fromIterable(
              <SocialAuthState>[SocialAuthErrorState()]));

      when(() => socialAuthCubit.state)
          .thenAnswer((_) => SocialAuthErrorState());

      await $.pumpApp(MultiBlocProvider(
        providers: <SingleChildWidget>[
          BlocProvider<DerivAuthCubit>.value(value: authCubit),
          BlocProvider<SocialAuthCubit>.value(value: socialAuthCubit),
        ],
        child: DerivLoginLayout(
          socialAuthStateHandler: (SocialAuthState state) {
            onSocialAuthHandlerCalled = true;
          },
          redirectURL: 'deriv://example',
          onWebViewError: (String error) {},
          welcomeLabel: welcomeLabel,
          greetingLabel: greetingLabel,
          onResetPassTapped: () {},
          onSignupTapped: () {},
          onLoggedIn: (_) {},
          onSocialAuthButtonPressed: (_) {},
          onLoginError: (_) {},
        ),
      ));

      expect(onSocialAuthHandlerCalled, isTrue);
    });
  });
}
