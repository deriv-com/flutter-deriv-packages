// ignore_for_file: always_specify_types

import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:patrol_finders/patrol_finders.dart';

import '../../../../mocks.dart';
import '../../../../pump_app.dart';

void main() {
  group('DerivResetPassLayout', () {
    late MockDerivResetPassCubit mockResetPassCubit;

    setUpAll(() {
      mockResetPassCubit = MockDerivResetPassCubit();
    });

    patrolWidgetTest('should render DerivResetPassLayout',
        (PatrolTester $) async {
      const resetPassState = DerivResetPassInitialState();

      when(() => mockResetPassCubit.state).thenAnswer((_) => resetPassState);
      when(() => mockResetPassCubit.stream)
          .thenAnswer((_) => Stream.fromIterable([resetPassState]));

      await $.pumpApp(
        BlocProvider<DerivResetPassCubit>.value(
          value: mockResetPassCubit,
          child: DerivResetPassLayout(
            onResetPassError: ({
              required bool isLinkExpired,
              String? error,
            }) {},
          ),
        ),
      );

      expect($(DerivResetPassLayout), findsOneWidget);
    });

    patrolWidgetTest(
        'should show emailSentPage when state is DerivResetPassEmailSentState',
        (PatrolTester $) async {
      const resetPassState = DerivResetPassEmailSentState();

      when(() => mockResetPassCubit.state).thenAnswer((_) => resetPassState);
      when(() => mockResetPassCubit.stream)
          .thenAnswer((_) => Stream.fromIterable([resetPassState]));

      await $.pumpApp(
        BlocProvider<DerivResetPassCubit>.value(
          value: mockResetPassCubit,
          child: DerivResetPassLayout(
            onResetPassError: ({
              required bool isLinkExpired,
              String? error,
            }) {},
          ),
        ),
      );

      expect(
          $(PageView)
              .which<PageView>((pageView) => pageView.controller?.page == 1),
          findsOneWidget);
    });

    patrolWidgetTest(
        'should show submitEmailForm when state is DerivResetPassInitialState',
        (PatrolTester $) async {
      const resetPassState = DerivResetPassInitialState();

      when(() => mockResetPassCubit.state).thenAnswer((_) => resetPassState);
      when(() => mockResetPassCubit.stream)
          .thenAnswer((_) => Stream.fromIterable([resetPassState]));

      await $.pumpApp(
        BlocProvider<DerivResetPassCubit>.value(
          value: mockResetPassCubit,
          child: DerivResetPassLayout(
            onResetPassError: ({
              required bool isLinkExpired,
              String? error,
            }) {},
          ),
        ),
      );

      expect(
          $(PageView)
              .which<PageView>((pageView) => pageView.controller?.page == 0),
          findsOneWidget);
    });

    patrolWidgetTest(
        'should not call sendVerificationEmail when email is invalid',
        (PatrolTester $) async {
      const resetPassState = DerivResetPassInitialState();
      const email = 'wrongEmail@format';

      when(() => mockResetPassCubit.state).thenAnswer((_) => resetPassState);
      when(() => mockResetPassCubit.stream)
          .thenAnswer((_) => Stream.fromIterable([resetPassState]));

      await $.pumpApp(
        BlocProvider<DerivResetPassCubit>.value(
          value: mockResetPassCubit,
          child: DerivResetPassLayout(
            onResetPassError: ({
              required bool isLinkExpired,
              String? error,
            }) {},
          ),
        ),
      );

      final emailTextField = $(BaseTextField).which<BaseTextField>(
          (baseTextField) => baseTextField.labelText == 'Email');

      await $.enterText(emailTextField, email);

      await $(ElevatedButton).tap();

      verifyNever(() => mockResetPassCubit.sendVerificationEmail(email));
    });

    patrolWidgetTest('should call sendVerificationEmail when email is valid',
        (PatrolTester $) async {
      const resetPassState = DerivResetPassInitialState();
      const email = 'correctEmail@format.com';

      when(() => mockResetPassCubit.state).thenAnswer((_) => resetPassState);
      when(() => mockResetPassCubit.stream)
          .thenAnswer((_) => Stream.fromIterable([resetPassState]));
      when(() => mockResetPassCubit.sendVerificationEmail(email))
          .thenAnswer((_) async {});

      await $.pumpApp(
        BlocProvider<DerivResetPassCubit>.value(
          value: mockResetPassCubit,
          child: DerivResetPassLayout(
            onResetPassError: ({
              required bool isLinkExpired,
              String? error,
            }) {},
          ),
        ),
      );

      final emailTextField = $(BaseTextField).which<BaseTextField>(
          (baseTextField) => baseTextField.labelText == 'Email');

      await $.enterText(emailTextField, email);

      await $(ElevatedButton).tap();

      verify(() => mockResetPassCubit.sendVerificationEmail(email)).called(1);
    });

    patrolWidgetTest(
        'should call OnResetPassError when state is DerivResetPassErrorState',
        (PatrolTester $) async {
      const errorState = DerivResetPassErrorState(errorMessage: 'test error');

      when(() => mockResetPassCubit.state).thenAnswer((_) => errorState);
      when(() => mockResetPassCubit.stream)
          .thenAnswer((_) => Stream.fromIterable([errorState]));

      var onResetPassErrorCalled = false;

      await $.pumpApp(
        BlocProvider<DerivResetPassCubit>.value(
          value: mockResetPassCubit,
          child: DerivResetPassLayout(
            onResetPassError: ({
              required bool isLinkExpired,
              String? error,
            }) {
              onResetPassErrorCalled = true;
            },
          ),
        ),
      );

      expect(onResetPassErrorCalled, isTrue);
    });
  });
}
