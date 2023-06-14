import 'package:deriv_auth_ui/deriv_auth_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../../../pump_app.dart';

void main() {
  group('DerivVerifyEmailLayout', () {
    late String testEmail;

    setUpAll(() {
      testEmail = 'test@gmail.com';
    });

    patrolTest('renders correctly', (PatrolTester $) async {
      await $.pumpApp(DerivVerifyEmailLayout(
        email: testEmail,
        onEmailNotReceivedPressed: () {},
      ));

      expect($(DerivVerifyEmailLayout), findsOneWidget);
      expect(
          $(ElevatedButton).$('Didn\'t receive your email?'), findsOneWidget);
      expect($(Text).$('Check your email'), findsOneWidget);
    });

    patrolTest('onEmailNotReceivedPressed is called when tapped on the button',
        (PatrolTester $) async {
      bool isEmailNotReceivedPressed = false;

      await $.pumpApp(DerivVerifyEmailLayout(
        email: testEmail,
        onEmailNotReceivedPressed: () => isEmailNotReceivedPressed = true,
      ));

      await $.tap($(ElevatedButton).$('Didn\'t receive your email?'));

      expect(isEmailNotReceivedPressed, true);
    });
  });
}
