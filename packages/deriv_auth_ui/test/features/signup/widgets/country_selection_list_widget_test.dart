import 'package:deriv_auth_ui/deriv_auth_ui.dart';
import 'package:deriv_auth_ui/src/features/signup/widgets/country_selection_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../../../pump_app.dart';

void main() {
  group('CountrySelectionListWidget', () {
    late List<DerivResidenceModel> residences;

    setUpAll(() {
      residences = <DerivResidenceModel>[
        const DerivResidenceModel(code: 'IR', name: 'Iran', isDisabled: false),
        const DerivResidenceModel(
            code: 'UK', name: 'England', isDisabled: true),
      ];
    });

    patrolTest('renders correctly', (PatrolTester $) async {
      await $.pumpApp(
          CountrySelectionListWidget(countries: residences, onChanged: (_) {}));

      expect($(CountrySelectionListWidget), findsOneWidget);
      expect($(Icons.search), findsOneWidget);
      expect($(Text).$('Iran'), findsOneWidget);
      expect($(Text).$('England'), findsOneWidget);
    });

    patrolTest('onChanged is called', (PatrolTester $) async {
      bool isOnChangedCalled = false;

      await $.pumpApp(CountrySelectionListWidget(
          countries: residences,
          onChanged: (int country) => isOnChangedCalled = true));

      await $.tap($(Text).$('Iran'));

      expect(isOnChangedCalled, true);
    });

    patrolTest('search field appears on tapping search',
        (PatrolTester $) async {
      await $.pumpApp(CountrySelectionListWidget(
          countries: residences, onChanged: (int country) => null));

      await $.tap($(Icons.search));

      expect($(TextField).$('Search country'), findsOneWidget);
    });
  });
}
