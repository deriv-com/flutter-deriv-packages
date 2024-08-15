import 'package:analytics/sdk/rudderstack/sdk/deriv_rudderstack_sdk.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:deriv_auth/core/analytics/data/auth_tracking_repository.dart';
import 'package:deriv_auth/core/models/landig_comany_model.dart';
import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_passkeys/deriv_passkeys.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nested/nested.dart';
import 'package:patrol_finders/patrol_finders.dart';

import '../../../../mocks.dart';
import '../../../../pump_app.dart';
import '../../../social_auth/mocks/mock_social_provider_model.dart';

class MockDerivPasskeysBloc
    extends MockBloc<DerivPasskeysEvent, DerivPasskeysState>
    implements DerivPasskeysBloc {}

class MockDerivRudderStackService extends Mock implements DerivRudderstack {}

void main() {
  group('DerivLoginLayout', () {
    late MockDerivRudderStackService mockDerivRudderstack;
    late MockAuthCubit authCubit;
    late MockSocialAuthCubit socialAuthCubit;
    late MockDerivPasskeysBloc derivPasskeysBloc;

    const String welcomeLabel = 'Welcome Back';

    setUpAll(() {
      mockDerivRudderstack = MockDerivRudderStackService();
      authCubit = MockAuthCubit();
      socialAuthCubit = MockSocialAuthCubit();
      derivPasskeysBloc = MockDerivPasskeysBloc();

      AuthTrackingRepository.init(
        'test',
        derivRudderstack: mockDerivRudderstack,
      );

      when(() => mockDerivRudderstack.track(
            eventName: any(named: 'eventName'),
            properties: any(named: 'properties'),
          )).thenAnswer(
        (_) => Future<bool>.value(true),
      );

      when(() => derivPasskeysBloc.state).thenReturn(
        DerivPasskeysInitializedState(),
      );

      registerFallbackValue(SocialAuthProvider.google);

      when(() => socialAuthCubit.stream).thenAnswer(
          (_) => Stream<SocialAuthState>.fromIterable(<SocialAuthState>[
                SocialAuthLoadedState(
                    socialAuthProviders: <SocialAuthProviderModel>[
                      mockSocialAuthProvider
                    ])
              ]));

      when(() => socialAuthCubit.state).thenAnswer((_) => SocialAuthLoadedState(
              socialAuthProviders: <SocialAuthProviderModel>[
                mockSocialAuthProvider
              ]));

      when(() => socialAuthCubit.getSocialAuthProviders()).thenAnswer(
          (_) async => <SocialAuthProviderModel>[mockSocialAuthProvider]);
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
            BlocProvider<DerivPasskeysBloc>.value(value: derivPasskeysBloc),
          ],
          child: DerivLoginLayout(
            socialAuthStateHandler:
                (BuildContext context, SocialAuthState state) {},
            redirectURL: 'deriv://example',
            onWebViewError: (String error) {},
            welcomeLabel: welcomeLabel,
            onResetPassTapped: () {},
            onSignupTapped: () {},
            onLoggedIn: (context, _) {},
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
      const String password = '123456';

      when(() => authCubit.state).thenAnswer((_) => mockAuthState);

      when(() => authCubit.stream).thenAnswer((_) =>
          Stream<DerivAuthState>.fromIterable(<DerivAuthState>[mockAuthState]));

      await $.pumpApp(
        MultiBlocProvider(
          providers: <SingleChildWidget>[
            BlocProvider<DerivAuthCubit>.value(value: authCubit),
            BlocProvider<SocialAuthCubit>.value(value: socialAuthCubit),
            BlocProvider<DerivPasskeysBloc>.value(value: derivPasskeysBloc),
          ],
          child: DerivLoginLayout(
            socialAuthStateHandler:
                (BuildContext context, SocialAuthState state) {},
            redirectURL: 'deriv://example',
            onWebViewError: (String error) {},
            welcomeLabel: welcomeLabel,
            onResetPassTapped: () {},
            onSignupTapped: () {},
            onLoggedIn: (context, _) {},
            onSocialAuthButtonPressed: (_) {},
            onLoginError: (_) {},
          ),
        ),
      );

      final PatrolFinder emailField = $(BaseTextField).first;
      // final emailField = $(BaseTextField).$('Email'); --> this doesn't work

      final PatrolFinder passwordField = $(BaseTextField).last;

      await $.enterText(emailField, invalidEmail);

      await $.pumpAndSettle();

      await $.enterText(passwordField, password);

      // Allow time for validation to trigger
      await $.pumpAndSettle(duration: const Duration(seconds: 1));

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
              BlocProvider<DerivPasskeysBloc>.value(value: derivPasskeysBloc),
            ],
            child: DerivLoginLayout(
              socialAuthStateHandler:
                  (BuildContext context, SocialAuthState state) {},
              redirectURL: 'deriv://example',
              onWebViewError: (String error) {},
              welcomeLabel: welcomeLabel,
              onResetPassTapped: () {},
              onSignupTapped: () {},
              onLoggedIn: (context, _) {},
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
          BlocProvider<DerivPasskeysBloc>.value(value: derivPasskeysBloc),
        ],
        child: DerivLoginLayout(
          socialAuthStateHandler:
              (BuildContext context, SocialAuthState state) {},
          redirectURL: 'deriv://example',
          onWebViewError: (String error) {},
          welcomeLabel: welcomeLabel,
          onResetPassTapped: () {},
          onSignupTapped: () {
            onSignupTappedCalled = true;
          },
          onLoggedIn: (context, _) {},
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
          BlocProvider<DerivPasskeysBloc>.value(value: derivPasskeysBloc),
        ],
        child: DerivLoginLayout(
          socialAuthStateHandler:
              (BuildContext context, SocialAuthState state) {},
          redirectURL: 'deriv://example',
          onWebViewError: (String error) {},
          welcomeLabel: welcomeLabel,
          onResetPassTapped: () {},
          onSignupTapped: () {},
          onLoggedIn: (context, _) {
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
          BlocProvider<DerivPasskeysBloc>.value(value: derivPasskeysBloc),
        ],
        child: DerivLoginLayout(
          socialAuthStateHandler:
              (BuildContext context, SocialAuthState state) {},
          redirectURL: 'deriv://example',
          onWebViewError: (String error) {},
          welcomeLabel: welcomeLabel,
          onResetPassTapped: () {},
          onSignupTapped: () {},
          onLoginError: (_) {
            onLoginErrorCalled = true;
          },
          onLoggedIn: (context, _) {},
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
          BlocProvider<DerivPasskeysBloc>.value(value: derivPasskeysBloc),
        ],
        child: DerivLoginLayout(
          socialAuthStateHandler:
              (BuildContext context, SocialAuthState state) {},
          redirectURL: 'deriv://example',
          onWebViewError: (String error) {},
          welcomeLabel: welcomeLabel,
          onResetPassTapped: () {},
          onSignupTapped: () {},
          onLoginError: (_) {},
          onLoggedIn: (context, _) {},
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
          BlocProvider<DerivPasskeysBloc>.value(value: derivPasskeysBloc),
        ],
        child: DerivLoginLayout(
          socialAuthStateHandler:
              (BuildContext context, SocialAuthState state) {},
          redirectURL: 'deriv://example',
          onWebViewError: (String error) {},
          welcomeLabel: welcomeLabel,
          onResetPassTapped: () {
            onResetPassTappedCalled = true;
          },
          onSignupTapped: () {},
          onLoggedIn: (context, _) {},
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
          BlocProvider<DerivPasskeysBloc>.value(value: derivPasskeysBloc),
        ],
        child: DerivLoginLayout(
          socialAuthStateHandler:
              (BuildContext context, SocialAuthState state) {},
          redirectURL: 'deriv://example',
          onWebViewError: (String error) {},
          welcomeLabel: welcomeLabel,
          onResetPassTapped: () {},
          onSignupTapped: () {},
          onLoggedIn: (context, _) {},
          onSocialAuthButtonPressed: (_) {
            onSocialAuthButtonPressedCalled = true;
          },
          onLoginError: (_) {},
        ),
      ));

      await $(InkWell).$(SocialAuthProvider.google.name.capitalize).tap();

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
          BlocProvider<DerivPasskeysBloc>.value(value: derivPasskeysBloc),
        ],
        child: DerivLoginLayout(
          socialAuthStateHandler:
              (BuildContext context, SocialAuthState state) {
            onSocialAuthHandlerCalled = true;
          },
          redirectURL: 'deriv://example',
          onWebViewError: (String error) {},
          welcomeLabel: welcomeLabel,
          onResetPassTapped: () {},
          onSignupTapped: () {},
          onLoggedIn: (context, _) {},
          onSocialAuthButtonPressed: (_) {},
          onLoginError: (_) {},
        ),
      ));

      expect(onSocialAuthHandlerCalled, isTrue);
    });
  });
}
