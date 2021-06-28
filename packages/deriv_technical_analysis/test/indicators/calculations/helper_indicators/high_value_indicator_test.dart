import 'package:deriv_technical_analysis/deriv_technical_analysis.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mock_models.dart';

void main() {
  group('Testing high value indicators', () {
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

    test('HighValueIndicator calculates the correct results', () {
      final HighValueIndicator<MockResult> indicator =
          HighValueIndicator<MockResult>(MockInput(ticks));

      expect(indicator.getValue(0).quote, 67.5);
      expect(indicator.getValue(1).quote, 75.65);
      expect(indicator.getValue(2).quote, 76.3);
    });
  });
}
