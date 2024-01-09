import 'package:deriv_auth/features/signup/models/deriv_residence_model.dart';
import 'package:deriv_auth/features/signup/presentation/layouts/deriv_country_selection_layout.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol_finders/patrol_finders.dart';

import '../../../../pump_app.dart';

void main() {
  group('DerivCountrySelectionLayout', () {
    late Future<List<DerivResidenceModel>> residences;

    setUp(() {
      residences =
          Future<List<DerivResidenceModel>>.value(<DerivResidenceModel>[
        const DerivResidenceModel(
            code: 'ID', name: 'Indonesia', isDisabled: false),
        const DerivResidenceModel(
            code: 'UK', name: 'England', isDisabled: true),
      ]);
    });

    patrolWidgetTest('renders correctly', (PatrolTester $) async {
      await $.pumpApp(DerivCountrySelectionLayout(
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
