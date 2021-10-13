import 'package:deriv_technical_analysis/deriv_technical_analysis.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mock_models.dart';

void main() {
  group('Double EMA indicator', () {
    test('Calculates the result correctly', () {
      const List<MockTick> ticks = <MockTick>[
        MockTick(quote: 0.73),
        MockTick(quote: 0.72),
        MockTick(quote: 0.86),
        MockTick(quote: 0.72),
        MockTick(quote: 0.62),
        MockTick(quote: 0.76),
        MockTick(quote: 0.84),
        MockTick(quote: 0.69),
        MockTick(quote: 0.65),
        MockTick(quote: 0.71),
        MockTick(quote: 0.53),
        MockTick(quote: 0.73),
        MockTick(quote: 0.77),
        MockTick(quote: 0.67),
        MockTick(quote: 0.68),
      ];

      final DEMAIndicator<MockResult> doubleEma = DEMAIndicator<MockResult>(
        CloseValueIndicator<MockResult>(MockInput(ticks)),
        5,
      );

      expect(doubleEma.getValue(0).quote, 0.73);
      expect(doubleEma.getValue(1).quote, closeTo(0.7244, 0.0001));
      expect(doubleEma.getValue(2).quote, closeTo(0.7992, 0.0001));
      expect(doubleEma.getValue(6).quote, closeTo(0.7858, 0.0001));
      expect(doubleEma.getValue(7).quote, closeTo(0.7374, 0.0001));
      expect(doubleEma.getValue(8).quote, closeTo(0.6884, 0.0001));
      expect(doubleEma.getValue(12).quote, closeTo(0.7184, 0.0001));
      expect(doubleEma.getValue(13).quote, closeTo(0.6939, 0.0001));
      expect(doubleEma.getValue(14).quote, closeTo(0.6859, 0.0001));
    });
  });
}
