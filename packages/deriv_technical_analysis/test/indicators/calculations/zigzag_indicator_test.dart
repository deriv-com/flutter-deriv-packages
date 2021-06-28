import 'package:deriv_technical_analysis/src/indicators/calculations/zigzag_indicator.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mock_models.dart';

void main() {
  group('ZigZag Indicator', () {
    late List<MockTick> ticks;

    setUpAll(() {
      ticks = const <MockOHLC>[
        MockOHLC.withNames(
            epoch: 1, open: 64, close: 64.75, low: 63.6, high: 65),
        MockOHLC.withNames(
            epoch: 2, open: 64, close: 65.79, low: 63.6, high: 68),
        MockOHLC.withNames(
            epoch: 3, open: 64, close: 64.73, low: 63.2, high: 65),
        MockOHLC.withNames(
            epoch: 4, open: 64, close: 64.73, low: 63.6, high: 67.1),
        MockOHLC.withNames(
            epoch: 5, open: 64.5, close: 65.55, low: 64.2, high: 66.3),
        MockOHLC.withNames(
            epoch: 6, open: 64, close: 66.59, low: 63.6, high: 65),
        MockOHLC.withNames(
            epoch: 7, open: 64, close: 63.61, low: 62.5, high: 65),
        MockOHLC.withNames(
            epoch: 8, open: 64, close: 63.65, low: 62.6, high: 65),
        MockOHLC.withNames(epoch: 9, open: 64, close: 62.15, low: 61, high: 65),
        MockOHLC.withNames(
            epoch: 10, open: 60, close: 63.37, low: 60.6, high: 65),
        MockOHLC.withNames(
            epoch: 11, open: 60, close: 61.33, low: 60, high: 65),
        MockOHLC.withNames(
            epoch: 12, open: 60, close: 62.51, low: 61.8, high: 65.9),
      ];
    });

    test('ZigZagIndicator calculates the correct results', () {
      final ZigZagIndicator<MockResult> indicator =
          ZigZagIndicator<MockResult>(MockInput(ticks), 1);

      expect(indicator.getValue(0).quote.isNaN, true);
      expect(indicator.getValue(1).quote, 68);
      expect(indicator.getValue(5).quote.isNaN, true);
      expect(indicator.getValue(10).quote, 60);
      expect(indicator.getValue(11).quote, 62.51);
    });
  });
}
