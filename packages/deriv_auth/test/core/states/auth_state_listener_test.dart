import 'package:deriv_auth/core/models/landig_comany_model.dart';
import 'package:deriv_auth/deriv_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:patrol_finders/patrol_finders.dart';

import '../../pump_app.dart';

class MockDerivAuthCubit extends Mock implements DerivAuthCubit {}

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  late DerivAuthCubit authCubit;

  setUpAll(() {
    authCubit = MockDerivAuthCubit();

    when(() => authCubit.close()).thenAnswer((_) async {});
  });

  group('AuthStateLister', () {
    patrolWidgetTest('onLoggedIn is called based on logged in state',
        (PatrolTester $) async {
      bool isOnLoggedInCalled = false;

      final DerivAuthLoggedInState mockAuthState =
          DerivAuthLoggedInState(const DerivAuthModel(
        authorizeEntity: AuthorizeEntity(),
        landingCompany: LandingCompanyEntity(),
      ));

      when(() => authCubit.state).thenAnswer((_) => mockAuthState);

      when(() => authCubit.stream).thenAnswer((_) =>
          Stream<DerivAuthState>.fromIterable(<DerivAuthState>[mockAuthState]));

      await $.pumpApp(
        BlocProvider<DerivAuthCubit>(
          create: (_) => authCubit,
          child: DerivAuthStateListener(
              onLoggedIn: (_) {
                isOnLoggedInCalled = true;
              },
              child: Container()),
        ),
      );

      expect(isOnLoggedInCalled, true);
    });

    patrolWidgetTest('onLoggedOut is called based on logged out state',
        (PatrolTester $) async {
      bool isOnLoggedOutCalled = false;

      final DerivAuthLoggedOutState mockAuthState = DerivAuthLoggedOutState();

      when(() => authCubit.state).thenAnswer((_) => mockAuthState);

      when(() => authCubit.stream).thenAnswer((_) =>
          Stream<DerivAuthState>.fromIterable(<DerivAuthState>[mockAuthState]));

      await $.pumpApp(
        BlocProvider<DerivAuthCubit>(
          create: (_) => authCubit,
          child: DerivAuthStateListener(
              onLoggedOut: () {
                isOnLoggedOutCalled = true;
              },
              child: Container()),
        ),
      );

      expect(isOnLoggedOutCalled, true);
    });

    patrolWidgetTest('onLoading is called based on loading state',
        (PatrolTester $) async {
      bool isOnLoadingCalled = false;

      final DerivAuthLoadingState mockAuthState = DerivAuthLoadingState();

      when(() => authCubit.state).thenAnswer((_) => mockAuthState);

      when(() => authCubit.stream).thenAnswer((_) =>
          Stream<DerivAuthState>.fromIterable(<DerivAuthState>[mockAuthState]));

      await $.pumpApp(
        BlocProvider<DerivAuthCubit>(
          create: (_) => authCubit,
          child: DerivAuthStateListener(
              onLoading: () {
                isOnLoadingCalled = true;
              },
              child: Container()),
        ),
      );

      expect(isOnLoadingCalled, true);
    });

    patrolWidgetTest('onError is called based on error state',
        (PatrolTester $) async {
      bool isOnErrorCalled = false;

      final DerivAuthErrorState mockAuthState = DerivAuthErrorState(
        type: AuthErrorType.accountUnavailable,
        message: 'error',
        isSocialLogin: false,
      );

      when(() => authCubit.state).thenAnswer((_) => mockAuthState);

      when(() => authCubit.stream).thenAnswer((_) =>
          Stream<DerivAuthState>.fromIterable(<DerivAuthState>[mockAuthState]));

      await $.pumpApp(
        BlocProvider<DerivAuthCubit>(
          create: (_) => authCubit,
          child: DerivAuthStateListener(
              onError: (_) {
                isOnErrorCalled = true;
              },
              child: Container()),
        ),
      );

      expect(isOnErrorCalled, true);
    });
  });
}
