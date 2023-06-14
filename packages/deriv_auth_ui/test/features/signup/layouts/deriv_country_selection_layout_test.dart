import 'package:deriv_auth_ui/deriv_auth_ui.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../../../pump_app.dart';

void main() {
  group('DerivCountrySelectionLayout', () {
    late Future<List<DerivResidenceModel>> residences;

    setUp(() {
      residences = Future.value([
        DerivResidenceModel(code: 'IR', name: 'Iran', isDisabled: false),
        DerivResidenceModel(code: 'UK', name: 'England', isDisabled: true),
      ]);
    });

    patrolTest('renders correctly', ($) async {
      await $.pumpApp(
          settle: false,
          DerivCountrySelectionLayout(
            onNextPressed: () {},
            verificationCode: '123456',
            residences: residences,
          ));

      expect($(DerivCountrySelectionLayout), findsOneWidget);
      expect($(BaseTextField).$('Choose country'), findsOneWidget);
      expect($(ElevatedButton).$('Next'), findsOneWidget);
      expect($(Icons.keyboard_arrow_down), findsOneWidget);
    });
  });
}
