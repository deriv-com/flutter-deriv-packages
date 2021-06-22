import 'package:deriv_technical_analysis/deriv_technical_analysis.dart';
import 'package:deriv_technical_analysis/src/indicators/calculations/cmo_indicator.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mock_models.dart';

void main() {
  group('Vidya Moving Average', () {
    test('Caculates the result correctly', () {
      const List<MockTick> ticks = <MockTick>[
        MockTick(quote: 21.27),
        MockTick(quote: 22.19),
        MockTick(quote: 22.08),
        MockTick(quote: 22.47),
        MockTick(quote: 22.48),
        MockTick(quote: 22.53),
        MockTick(quote: 22.23),
        MockTick(quote: 21.43),
        MockTick(quote: 21.24),
        MockTick(quote: 21.29),
        MockTick(quote: 22.15),
        MockTick(quote: 22.39),
        MockTick(quote: 22.38),
        MockTick(quote: 22.61),
        MockTick(quote: 23.36),
        MockTick(quote: 24.05),
        MockTick(quote: 24.75),
        MockTick(quote: 24.83),
        MockTick(quote: 23.95),
        MockTick(quote: 23.63),
        MockTick(quote: 23.82),
        MockTick(quote: 23.87),
        MockTick(quote: 23.15),
        MockTick(quote: 23.19),
        MockTick(quote: 23.10),
        MockTick(quote: 22.65),
        MockTick(quote: 22.48),
        MockTick(quote: 22.87),
        MockTick(quote: 22.93),
        MockTick(quote: 22.91),
      ];

      final CMOIndicator<MockResult> cmo = CMOIndicator<MockResult>(
          CloseValueIndicator<MockResult>(MockInput(ticks)), 9);

      expect(cmo.getValue(5).quote, closeTo(85.135, 0.001));
      expect(cmo.getValue(6).quote, closeTo(53.932, 0.001));
      expect(cmo.getValue(7).quote, closeTo(6.2016, 0.001));
      expect(cmo.getValue(8).quote, closeTo(-1.083, 0.001));
      expect(cmo.getValue(9).quote, closeTo(0.7092, 0.001));
      expect(cmo.getValue(10).quote, closeTo(-1.449, 0.001));
      expect(cmo.getValue(11).quote, closeTo(10.726, 0.001));
      expect(cmo.getValue(12).quote, closeTo(-3.585, 0.001));
      expect(cmo.getValue(13).quote, closeTo(4.7619, 0.001));
      expect(cmo.getValue(14).quote, closeTo(24.198, 0.001));
      expect(cmo.getValue(15).quote, closeTo(47.644, 0.001));
    });
  });
}
