import 'package:deriv_technical_analysis/src/helpers/functions.dart';
import 'package:deriv_technical_analysis/src/indicators/calculations/atr_indicator.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mock_models.dart';

void main() {
  late List<MockTick> ticks;

  setUpAll(() {
    ticks = const <MockTick>[
      MockOHLC(0, 0, 48.16, 48.70, 47.79),
      MockOHLC(1, 0, 48.61, 48.72, 48.14),
      MockOHLC(2, 0, 48.75, 48.90, 48.39),
      MockOHLC(3, 0, 48.63, 48.87, 48.37),
      MockOHLC(4, 0, 48.74, 48.82, 48.24),
      MockOHLC(5, 0, 49.03, 49.05, 48.64),
      MockOHLC(6, 0, 49.07, 49.20, 48.94),
      MockOHLC(7, 0, 49.32, 49.35, 48.86),
      MockOHLC(8, 0, 49.91, 49.92, 49.50),
      MockOHLC(9, 0, 50.13, 50.19, 49.87),
      MockOHLC(10, 0, 49.53, 50.12, 49.20),
      MockOHLC(11, 0, 49.50, 49.66, 48.90),
      MockOHLC(12, 0, 49.75, 49.88, 49.43),
      MockOHLC(13, 0, 503, 50.19, 49.73),
      MockOHLC(14, 0, 50.31, 50.36, 49.26),
      MockOHLC(15, 0, 50.52, 50.57, 509),
      MockOHLC(16, 0, 50.41, 50.65, 50.30),
      MockOHLC(17, 0, 49.34, 50.43, 49.21),
      MockOHLC(18, 0, 49.37, 49.63, 48.98),
      MockOHLC(19, 0, 50.23, 50.33, 49.61),
      MockOHLC(20, 0, 49.24, 50.29, 49.20),
      MockOHLC(21, 0, 49.93, 50.17, 49.43),
      MockOHLC(22, 0, 48.43, 49.32, 48.08),
      MockOHLC(23, 0, 48.18, 48.50, 47.64),
      MockOHLC(24, 0, 46.57, 48.32, 41.55),
      MockOHLC(25, 0, 45.41, 46.80, 44.28),
      MockOHLC(26, 0, 47.77, 47.80, 47.31),
      MockOHLC(27, 0, 47.72, 48.39, 47.20),
      MockOHLC(28, 0, 48.62, 48.66, 47.90),
      MockOHLC(29, 0, 47.85, 48.79, 47.73),
    ];
  });

  group('ATR Indicator test', () {
    test(
        'ATR Indicator should calculate the correct result from the given ticks and period.',
        () {
      final ATRIndicator<MockResult> atrIndicator =
          ATRIndicator<MockResult>(MockInput(ticks));

      expect(roundDouble(atrIndicator.getValue(28).quote, 2), 25.32);
      expect(roundDouble(atrIndicator.getValue(29).quote, 2), 23.59);
    });
  });
}
