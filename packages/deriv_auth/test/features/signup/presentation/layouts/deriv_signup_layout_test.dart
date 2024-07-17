import 'package:analytics/sdk/rudderstack/sdk/deriv_rudderstack_sdk.dart';
import 'package:deriv_auth/core/analytics/data/auth_tracking_repository.dart';
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
import '../../../social_auth/mocks/mock_social_provider_model.dart';

class MockDerivRudderStack extends Mock implements DerivRudderstack {}

void main() {
  group('DerivSignupLayout', () {
    late final MockDerivRudderStack mockDerivRudderstack;
    late MockSignupCubit signupCubit;
    late MockAuthCubit authCubit;
    late MockSocialAuthCubit socialAuthCubit;

    const String signupPageLabel = 'Create a free account';
    const String signupPageDescription = 'Start trading within minutes.';

    setUpAll(() {
      signupCubit = MockSignupCubit();
      authCubit = MockAuthCubit();
      socialAuthCubit = MockSocialAuthCubit();

      mockDerivRudderstack = MockDerivRudderStack();

      AuthTrackingRepository.init(
        'test',
        derivRudderstack: mockDerivRudderstack,
      );

      when(() => mockDerivRudderstack.track(
          eventName: any(named: 'eventName'),
          properties: any(named: 'properties'))).thenAnswer(
        (_) => Future<bool>.value(true),
      );

      registerFallbackValue(SocialAuthProvider.google);

      when(() => signupCubit.state)
          .thenAnswer((_) => const DerivSignupInitialState());

      when(() => signupCubit.stream).thenAnswer((_) =>
          Stream<DerivSignupState>.fromIterable(
              <DerivSignupState>[const DerivSignupInitialState()]));

      when(() => authCubit.state).thenAnswer((_) => DerivAuthLoadingState());

      when(() => authCubit.stream).thenAnswer((_) =>
          Stream<DerivAuthState>.fromIterable(
              <DerivAuthState>[DerivAuthLoadingState()]));

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

    patrolWidgetTest('renders correctly', (PatrolTester $) async {
      await $.pumpApp(
          settle: false,
          MultiBlocProvider(
            providers: <SingleChildWidget>[
              BlocProvider<DerivAuthCubit>.value(value: authCubit),
              BlocProvider<DerivSignupCubit>.value(value: signupCubit),
              BlocProvider<SocialAuthCubit>.value(value: socialAuthCubit),
            ],
            child: DerivSignupLayout(
              socialAuthStateHandler:
                  (BuildContext context, SocialAuthState state) {},
              redirectURL: 'deriv://example',
              onWebViewError: (String error) {},
              signupPageLabel: signupPageLabel,
              signupPageDescription: signupPageDescription,
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

    patrolWidgetTest(
        'onSocialAuthButtonPressed is called upon tapping social auth option',
        (PatrolTester $) async {
      bool isOnSocialAuthButtonPressedCalled = false;

      /// Should be called when social auth button is pressed.
      when(() => socialAuthCubit.selectSocialLoginProvider(
          selectedSocialAuthProvider: any(named: 'selectedSocialAuthProvider'),
          redirectUrl: 'deriv://example',
          onWebViewError: any(named: 'onWebViewError'),
          onRedirectUrlReceived:
              any(named: 'onRedirectUrlReceived'))).thenAnswer((_) async {
        isOnSocialAuthButtonPressedCalled = true;
      });

      await $.pumpApp(
        MultiBlocProvider(
          providers: <SingleChildWidget>[
            BlocProvider<DerivAuthCubit>.value(value: authCubit),
            BlocProvider<DerivSignupCubit>.value(value: signupCubit),
            BlocProvider<SocialAuthCubit>.value(value: socialAuthCubit),
          ],
          child: DerivSignupLayout(
            socialAuthStateHandler:
                (BuildContext context, SocialAuthState state) {},
            redirectURL: 'deriv://example',
            onWebViewError: (String error) {},
            signupPageLabel: signupPageLabel,
            signupPageDescription: signupPageDescription,
            onSocialAuthButtonPressed: (_) {
              isOnSocialAuthButtonPressedCalled = true;
            },
            onSingupError: (_) {},
            onSingupEmailSent: (_) {},
            onSignupPressed: () {},
            onLoginTapped: () {},
          ),
        ),
      );

      await $.tap($(DerivSocialAuthPanel));

      expect(isOnSocialAuthButtonPressedCalled, true);
    });

    patrolWidgetTest('onSignupEmailSent is called upon sign up email sent',
        (PatrolTester $) async {
      bool isOnSignupEmailSentCalled = false;

      when(() => signupCubit.state)
          .thenAnswer((_) => const DerivSignupEmailSentState());

      when(() => signupCubit.stream).thenAnswer((_) =>
          Stream<DerivSignupState>.fromIterable(
              <DerivSignupState>[const DerivSignupEmailSentState()]));

      await $.pumpApp(
        MultiBlocProvider(
          providers: <SingleChildWidget>[
            BlocProvider<DerivAuthCubit>.value(value: authCubit),
            BlocProvider<DerivSignupCubit>.value(value: signupCubit),
            BlocProvider<SocialAuthCubit>.value(value: socialAuthCubit),
          ],
          child: DerivSignupLayout(
              socialAuthStateHandler:
                  (BuildContext context, SocialAuthState state) {},
              redirectURL: 'deriv://example',
              onWebViewError: (String error) {},
              signupPageLabel: signupPageLabel,
              signupPageDescription: signupPageDescription,
              onSocialAuthButtonPressed: (_) {},
              onSingupError: (_) {},
              onSingupEmailSent: (_) => isOnSignupEmailSentCalled = true,
              onSignupPressed: () {},
              onLoginTapped: () {}),
        ),
      );

      expect(isOnSignupEmailSentCalled, true);
    });

    patrolWidgetTest('onSignupPressed is called upon tapping signup button',
        (PatrolTester $) async {
      bool isOnSignupPressedCalled = false;

      when(() => signupCubit.sendVerificationEmail('test@gmail.com'))
          .thenAnswer((_) async => const DerivSignupEmailSentState());

      await $.pumpApp(
        MultiBlocProvider(
          providers: <SingleChildWidget>[
            BlocProvider<DerivAuthCubit>.value(value: authCubit),
            BlocProvider<DerivSignupCubit>.value(value: signupCubit),
            BlocProvider<SocialAuthCubit>.value(value: socialAuthCubit),
          ],
          child: DerivSignupLayout(
              socialAuthStateHandler:
                  (BuildContext context, SocialAuthState state) {},
              redirectURL: 'deriv://example',
              onWebViewError: (String error) {},
              signupPageLabel: signupPageLabel,
              signupPageDescription: signupPageDescription,
              onSocialAuthButtonPressed: (_) {},
              onSingupError: (_) {},
              onSingupEmailSent: (_) {},
              onSignupPressed: () => isOnSignupPressedCalled = true,
              onLoginTapped: () {}),
        ),
      );

      final PatrolFinder signUpButton =
          $(ElevatedButton).$('Create free demo account');

      await $.enterText($(BaseTextField), 'test@gmail.com');
      await $.tap(signUpButton);

      expect(isOnSignupPressedCalled, true);

      verify(() => signupCubit.sendVerificationEmail('test@gmail.com'))
          .called(1);
    });

    patrolWidgetTest('onLoginTapped is called upon tapping login button',
        (PatrolTester $) async {
      bool isOnLoginTappedCalled = false;

      await $.pumpApp(
        MultiBlocProvider(
          providers: <SingleChildWidget>[
            BlocProvider<DerivAuthCubit>.value(value: authCubit),
            BlocProvider<DerivSignupCubit>.value(value: signupCubit),
            BlocProvider<SocialAuthCubit>.value(value: socialAuthCubit),
          ],
          child: DerivSignupLayout(
              socialAuthStateHandler:
                  (BuildContext context, SocialAuthState state) {},
              redirectURL: 'deriv://example',
              onWebViewError: (String error) {},
              signupPageLabel: signupPageLabel,
              signupPageDescription: signupPageDescription,
              onSocialAuthButtonPressed: (_) {},
              onSingupError: (_) {},
              onSingupEmailSent: (_) {},
              onSignupPressed: () {},
              onLoginTapped: () {
                isOnLoginTappedCalled = true;
              }),
        ),
      );

      final PatrolFinder loginButton = $(InkWell).$('Log in');

      await $.scrollUntilVisible(finder: loginButton);
      await $.tap(loginButton);

      expect(isOnLoginTappedCalled, true);
    });

    patrolWidgetTest('onSignupError is called upon signup error state',
        (PatrolTester $) async {
      bool isOnSignupErrorCalled = false;

      when(() => signupCubit.state).thenAnswer(
          (_) => const DerivSignupErrorState('This is a test error message'));

      when(() => signupCubit.stream).thenAnswer((_) =>
          Stream<DerivSignupState>.fromIterable(
              <DerivSignupState>[const DerivSignupErrorState('')]));

      await $.pumpApp(
        MultiBlocProvider(
          providers: <SingleChildWidget>[
            BlocProvider<DerivAuthCubit>.value(value: authCubit),
            BlocProvider<DerivSignupCubit>.value(value: signupCubit),
            BlocProvider<SocialAuthCubit>.value(value: socialAuthCubit),
          ],
          child: DerivSignupLayout(
              socialAuthStateHandler:
                  (BuildContext context, SocialAuthState state) {},
              redirectURL: 'deriv://example',
              onWebViewError: (String error) {},
              signupPageLabel: signupPageLabel,
              signupPageDescription: signupPageDescription,
              onSocialAuthButtonPressed: (_) {},
              onSingupError: (_) => isOnSignupErrorCalled = true,
              onSingupEmailSent: (_) {},
              onSignupPressed: () {},
              onLoginTapped: () {}),
        ),
      );

      expect(isOnSignupErrorCalled, true);
    });
    patrolWidgetTest('onAuthError is called upon auth error state',
        (PatrolTester $) async {
      bool isOnAuthErrorCalled = false;

      final DerivAuthErrorState mockAuthState = DerivAuthErrorState(
        isSocialLogin: false,
        message: 'error',
        type: AuthErrorType.failedAuthorization,
      );

      when(() => authCubit.state).thenAnswer((_) => mockAuthState);

      when(() => authCubit.stream).thenAnswer((_) =>
          Stream<DerivAuthState>.fromIterable(<DerivAuthState>[mockAuthState]));

      await $.pumpApp(
        MultiBlocProvider(
          providers: <SingleChildWidget>[
            BlocProvider<DerivAuthCubit>.value(value: authCubit),
            BlocProvider<DerivSignupCubit>.value(value: signupCubit),
            BlocProvider<SocialAuthCubit>.value(value: socialAuthCubit),
          ],
          child: DerivSignupLayout(
              socialAuthStateHandler:
                  (BuildContext context, SocialAuthState state) {},
              redirectURL: 'deriv://example',
              onWebViewError: (String error) {},
              signupPageLabel: signupPageLabel,
              signupPageDescription: signupPageDescription,
              onSocialAuthButtonPressed: (_) {},
              onSingupError: (_) {},
              onSingupEmailSent: (_) {},
              onSignupPressed: () {},
              onAuthError: (_) => isOnAuthErrorCalled = true,
              onLoginTapped: () {}),
        ),
      );

      expect(isOnAuthErrorCalled, true);
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
          BlocProvider<DerivSignupCubit>.value(value: signupCubit),
          BlocProvider<SocialAuthCubit>.value(value: socialAuthCubit),
        ],
        child: DerivSignupLayout(
            socialAuthStateHandler:
                (BuildContext context, SocialAuthState state) {},
            redirectURL: 'deriv://example',
            onWebViewError: (String error) {},
            signupPageLabel: signupPageLabel,
            signupPageDescription: signupPageDescription,
            onSocialAuthButtonPressed: (_) {},
            onSingupError: (_) {},
            onSingupEmailSent: (_) {},
            onSignupPressed: () {},
            onLoginTapped: () {}),
      ));

      expect($(PopupAlertDialog).$('Authorization failed.'), findsOneWidget);
    });

    patrolWidgetTest('calls [socialAuthHandler] on [SocialAuthState]',
        (PatrolTester $) async {
      bool isSocialAuthHandlerCalled = false;

      final SocialAuthLoadingState socialAuthLoadingState =
          SocialAuthLoadingState();

      when(() => socialAuthCubit.state)
          .thenAnswer((_) => socialAuthLoadingState);

      when(() => socialAuthCubit.stream).thenAnswer((_) =>
          Stream<SocialAuthState>.fromIterable(
              <SocialAuthState>[socialAuthLoadingState]));

      await $.pumpApp(MultiBlocProvider(
        providers: <SingleChildWidget>[
          BlocProvider<DerivAuthCubit>.value(value: authCubit),
          BlocProvider<DerivSignupCubit>.value(value: signupCubit),
          BlocProvider<SocialAuthCubit>.value(value: socialAuthCubit),
        ],
        child: DerivSignupLayout(
            socialAuthStateHandler:
                (BuildContext context, SocialAuthState state) {
              isSocialAuthHandlerCalled = true;
            },
            redirectURL: 'deriv://example',
            onWebViewError: (String error) {},
            signupPageLabel: signupPageLabel,
            signupPageDescription: signupPageDescription,
            onSocialAuthButtonPressed: (_) {},
            onSingupError: (_) {},
            onSingupEmailSent: (_) {},
            onSignupPressed: () {},
            onLoginTapped: () {}),
      ));

      expect(isSocialAuthHandlerCalled, true);
    });
  });
}
