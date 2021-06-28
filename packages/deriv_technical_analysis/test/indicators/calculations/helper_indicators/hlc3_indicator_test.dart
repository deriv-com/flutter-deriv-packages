import 'package:deriv_technical_analysis/src/helpers/functions.dart';
import 'package:deriv_technical_analysis/src/indicators/calculations/helper_indicators/hlc3_indicator.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mock_models.dart';

void main() {
  group('Testing HLC/3 indicators', () {
    late List<MockOHLC> ticks;

    setUpAll(() {
      ticks = const <MockOHLC>[
        MockOHLC.withNames(
            epoch: 1, open: 64.75, close: 64.12, high: 67.5, low: 63),
        MockOHLC.withNames(
            epoch: 2, open: 73.5, close: 74.62, high: 75.65, low: 73.12),
        MockOHLC.withNames(
            epoch: 3, open: 74.2, close: 73.42, high: 76.3, low: 73.33),
      ];
    });

    test('HLC3Indicator calculates the correct results', () {
      final HLC3Indicator<MockResult> indicator =
          HLC3Indicator<MockResult>(MockInput(ticks));

      expect(roundDouble(indicator.getValue(0).quote, 4), 64.8733);
      expect(roundDouble(indicator.getValue(1).quote, 4), 74.4633);
      expect(roundDouble(indicator.getValue(2).quote, 4), 74.3500);
    });
  });
}
