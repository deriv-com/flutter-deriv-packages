import 'package:deriv_technical_analysis/deriv_technical_analysis.dart';
import 'package:deriv_technical_analysis/src/indicators/calculations/statistics/mean_deviation_indicator.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mock_models.dart';

void main() {
  group('Mean Deviation indicator', () {
    late List<MockTick> ticks;

    setUp(() {
      ticks = const <MockTick>[
        MockTick(quote: 1),
        MockTick(quote: 2),
        MockTick(quote: 7),
        MockTick(quote: 6),
        MockTick(quote: 3),
        MockTick(quote: 4),
        MockTick(quote: 5),
        MockTick(quote: 11),
        MockTick(quote: 3),
        MockTick(quote: 0),
        MockTick(quote: 9),
      ];
    });

    test('MeanDevaition with period = 5', () {
      final MeanDeviationIndicator<MockResult> meanDeviation =
          MeanDeviationIndicator<MockResult>(
              CloseValueIndicator<MockResult>(MockInput(ticks)), 5);

      expect(meanDeviation.getValue(2).quote, 2.4444444444444446);
      expect(meanDeviation.getValue(3).quote, 2.5);
      expect(meanDeviation.getValue(7).quote, 2.16);
      expect(meanDeviation.getValue(8).quote, 2.3200000000000003);
      expect(meanDeviation.getValue(9).quote, 2.7199999999999998);
    });
  });
}
