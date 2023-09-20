import 'package:deriv_auth_ui/deriv_auth_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../../../pump_app.dart';

void main() {
  group('DerivEmailNotReceivedLayout', () {
    patrolTest('renders correctly', (PatrolTester $) async {
      await $.pumpApp(DerivEmailNotReceivedLayout(
        onReEnterEmailPressed: () {},
      ));

      expect($(DerivEmailNotReceivedLayout), findsOneWidget);
      expect($(ElevatedButton).$('Re-enter your email and try again'),
          findsOneWidget);
    });

    patrolTest('onReEnterEmailPressed is called when tapped on the button',
        (PatrolTester $) async {
      bool isReEnterEmailPressed = false;

      await $.pumpApp(DerivEmailNotReceivedLayout(
        onReEnterEmailPressed: () => isReEnterEmailPressed = true,
      ));

      await $.tap($(ElevatedButton).$('Re-enter your email and try again'));

      expect(isReEnterEmailPressed, true);
    });
  });
}
