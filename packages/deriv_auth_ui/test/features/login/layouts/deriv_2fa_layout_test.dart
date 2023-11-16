// ignore_for_file: always_specify_types

import 'package:deriv_auth/core/models/landig_comany_model.dart';
import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_auth_ui/deriv_auth_ui.dart';
import 'package:deriv_ui/presentation/widgets/base_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:patrol_finders/patrol_finders.dart';
import '../../../mocks.dart';
import '../../../pump_app.dart';

void main() {
  group('Deriv2FALayout', () {
    late MockAuthCubit authCubit;
    late String mockEmail;
    late String mockPassword;

    setUpAll(() {
      authCubit = MockAuthCubit();
      mockEmail = 'test@gmail.com';
      mockPassword = 'test1234';
    });

    patrolWidgetTest('renders correctly', (PatrolTester $) async {
      when(() => authCubit.state).thenAnswer((_) => DerivAuthLoggedOutState());

      when(() => authCubit.stream)
          .thenAnswer((_) => Stream.fromIterable([DerivAuthLoggedOutState()]));

      await $.pumpApp(
        settle: false,
        BlocProvider<DerivAuthCubit>.value(
          value: authCubit,
          child: Deriv2FALayout(email: mockEmail, password: mockPassword),
        ),
      );

      expect($(Deriv2FALayout), findsOneWidget);
      expect($(BaseTextField).$('2FA code'), findsOneWidget);
      expect($(ElevatedButton).$('Proceed'), findsOneWidget);
    });

    patrolWidgetTest('proceeds to login on correct code',
        (PatrolTester $) async {
      when(() => authCubit.state).thenAnswer((_) => DerivAuthLoggedOutState());

      when(() => authCubit.stream)
          .thenAnswer((_) => Stream.fromIterable([DerivAuthLoggedOutState()]));

      when(() => authCubit.systemLogin(
              email: any(named: 'email'),
              password: any(named: 'password'),
              otp: any(named: 'otp')))
          .thenAnswer((_) async => DerivAuthLoggedInState(const DerivAuthModel(
              authorizeEntity: AuthorizeEntity(),
              landingCompany: LandingCompanyEntity())));

      await $.pumpApp(
        BlocProvider<DerivAuthCubit>.value(
          value: authCubit,
          child: Deriv2FALayout(
            email: mockEmail,
            password: mockPassword,
          ),
        ),
      );

      await $.enterText($(BaseTextField), '123456');

      await $.tap($(ElevatedButton));

      verify(() => authCubit.systemLogin(
          email: any(named: 'email'),
          password: any(named: 'password'),
          otp: any(named: 'otp'))).called(1);
    });
  });
}
