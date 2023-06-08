import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_auth_ui/deriv_auth_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:patrol/patrol.dart';

import '../pump_app.dart';

class MockAuthCubit extends Mock implements DerivAuthCubit {}

void main() {
  group('DerivLoginLayout', () {
    late MockAuthCubit authCubit;

    setUpAll(() {
      authCubit = MockAuthCubit();
    });
    patrolTest('onLoggedIn is called when login is successful', ($) async {
      mockOnLoggedIn(_) {}

      final mockLoggedInState = DerivAuthLoggedInState(const AuthorizeEntity());

      when(() => authCubit.state).thenAnswer((_) => mockLoggedInState);

      when(() => authCubit.stream)
          .thenAnswer((_) => Stream.fromIterable([mockLoggedInState]));

      $.pumpApp(DerivLoginLayout(
        authCubit: authCubit,
        onResetPassTapped: () {},
        onSignupTapped: () {},
        onLoginError: (p0) {},
        onLoggedIn: mockOnLoggedIn,
        onSocialAuthButtonPressed: (p0) {},
      ));

      verify(() => mockOnLoggedIn).called(1);
    });
  });
}
