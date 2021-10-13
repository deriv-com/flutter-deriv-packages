import 'package:deriv_technical_analysis/src/indicators/calculations/bearish_inidicator.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mock_models.dart';

void main() {
  group('Bearish indicator test', () {
    late List<MockOHLC> candles;

    setUpAll(() {
      candles = const <MockOHLC>[
        MockOHLC.withNames(
            epoch: 0, open: 168.28, close: 169.64, high: 169.87, low: 167.15),
        MockOHLC.withNames(
            epoch: 1, open: 168.84, close: 168.71, high: 169.36, low: 168.2),
        MockOHLC.withNames(
            epoch: 2, open: 168.88, close: 167.74, high: 169.29, low: 166.01),
        MockOHLC.withNames(
            epoch: 3, open: 168, close: 166.32, high: 168.38, low: 166.18),
        MockOHLC.withNames(
            epoch: 4, open: 166.89, close: 167.24, high: 167.7, low: 166.33),
        MockOHLC.withNames(
            epoch: 5, open: 165.25, close: 168.05, high: 178.43, low: 165),
        MockOHLC.withNames(
            epoch: 6, open: 168.17, close: 169.92, high: 170.18, low: 167.63),
        MockOHLC.withNames(
            epoch: 7, open: 170.42, close: 171.97, high: 172.15, low: 170.06),
        MockOHLC.withNames(
            epoch: 8, open: 172.41, close: 172.02, high: 172.92, low: 171.31),
        MockOHLC.withNames(
            epoch: 9, open: 171.2, close: 170.72, high: 172.39, low: 169.55),
        MockOHLC.withNames(
            epoch: 10, open: 170.91, close: 172.09, high: 172.48, low: 169.57),
      ];
    });

    test('BearishIndicator calculates the correct results', () {
      final BearishIndicator<MockResult> indicator =
          BearishIndicator<MockResult>(MockInput(candles));

      expect(indicator.getValue(2).quote.isNaN, true);
      expect(indicator.getValue(5).quote, 178.43);
      expect(indicator.getValue(8).quote, 172.92);
    });
  });
}
