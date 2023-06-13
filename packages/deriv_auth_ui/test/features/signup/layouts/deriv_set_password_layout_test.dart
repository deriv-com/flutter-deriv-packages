import 'package:deriv_auth_ui/deriv_auth_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../../../mocks.dart';
import '../../../pump_app.dart';

void main() {
  late MockAuthCubit mockAuthCubit;
  late MockSignupCubit mockSignupCubit;

  setUpAll(() {
    mockAuthCubit = MockAuthCubit();
    mockSignupCubit = MockSignupCubit();
  });

  group('DerivSetPasswordLayout', () {
    patrolTest('renders correctly', ($) async {
      await $.pumpApp(DerivSetPasswordLayout(
        authCubit: mockAuthCubit,
        signupCubit: mockSignupCubit,
        onDerivAuthState: (_, __) {},
        onDerivSignupState: (_, __) {},
        onPreviousPressed: () {},
        verificationCode: '123456',
        residence: 'id',
      ));

      expect($(DerivSetPasswordLayout), findsOneWidget);
    });
  });
}
