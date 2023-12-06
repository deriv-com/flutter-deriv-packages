import 'package:deriv_auth_ui/deriv_auth_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol_finders/patrol_finders.dart';
import '../../../pump_app.dart';

void main() {
  group('DerivVerificationDoneLayout', () {
    patrolWidgetTest('renders correctly', (PatrolTester $) async {
      await $.pumpApp(DerivVerificationDoneLayout(
        verificationCode: '123456',
        onContinuePressed: () {},
      ));

      expect($(DerivVerificationDoneLayout), findsOneWidget);
      expect($(Text).$('Thanks for verifying your email'), findsOneWidget);
      expect($(ElevatedButton).$('Continue'), findsOneWidget);
    });

    patrolWidgetTest('onContinuePressed is called', (PatrolTester $) async {
      bool isContinuePressed = false;

      await $.pumpApp(DerivVerificationDoneLayout(
        verificationCode: '123456',
        onContinuePressed: () => isContinuePressed = true,
      ));

      await $.tap($(ElevatedButton).$('Continue'));

      expect(isContinuePressed, true);
    });
  });
}
