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
      residences = ([
        DerivResidenceModel(code: 'IR', name: 'Iran', isDisabled: false),
        DerivResidenceModel(code: 'UK', name: 'England', isDisabled: true),
      ]);
    });

    patrolTest('renders correctly', ($) async {
      await $.pumpApp(
          CountrySelectionListWidget(countries: residences, onChanged: (_) {}));

      expect($(CountrySelectionListWidget), findsOneWidget);
      expect($(Icons.search), findsOneWidget);
      expect($(Text).$('Iran'), findsOneWidget);
      expect($(Text).$('England'), findsOneWidget);
    });

    patrolTest('onChanged is called', ($) async {
      bool isOnChangedCalled = false;

      await $.pumpApp(CountrySelectionListWidget(
          countries: residences,
          onChanged: (country) => isOnChangedCalled = true));

      await $.tap($(Text).$('Iran'));

      expect(isOnChangedCalled, true);
    });

    patrolTest('search field appears on tapping search', ($) async {
      await $.pumpApp(CountrySelectionListWidget(
          countries: residences, onChanged: (country) => null));

      await $.tap($(Icons.search));

      expect($(TextField).$('Search country'), findsOneWidget);
    });
  });
}
