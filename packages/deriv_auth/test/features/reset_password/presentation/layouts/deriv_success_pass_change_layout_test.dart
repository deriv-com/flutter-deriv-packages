import 'package:deriv_auth/features/reset_password/presentation/layouts/deriv_success_pass_change_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol_finders/patrol_finders.dart';

import '../../../../pump_app.dart';

void main() {
  group('DerivSuccessPassChangeLayout', () {
    patrolWidgetTest('renders correctly', (PatrolTester $) async {
      await $.pumpApp(settle: false, const DerivSuccessPassChangeLayout());

      expect($(Text).$('Reset password'), findsOneWidget);
      expect($(Text).$('Your password has been reset'), findsOneWidget);
    });
  });
}
