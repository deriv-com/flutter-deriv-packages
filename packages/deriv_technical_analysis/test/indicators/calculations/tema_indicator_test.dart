import 'package:deriv_technical_analysis/deriv_technical_analysis.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mock_models.dart';

void main() {
  group('Triple EMA indicator', () {
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

      final TEMAIndicator<MockResult> tripleEma = TEMAIndicator<MockResult>(
        CloseValueIndicator<MockResult>(MockInput(ticks)),
        5,
      );

      expect(tripleEma.getValue(0).quote, closeTo(0.73, 0.0001));
      expect(tripleEma.getValue(1).quote, closeTo(0.7229, 0.0001));
      expect(tripleEma.getValue(2).quote, closeTo(0.8185, 0.0001));
      expect(tripleEma.getValue(6).quote, closeTo(0.8027, 0.0001));
      expect(tripleEma.getValue(7).quote, closeTo(0.7328, 0.0001));
      expect(tripleEma.getValue(8).quote, closeTo(0.6725, 0.0001));
      expect(tripleEma.getValue(12).quote, closeTo(0.7386, 0.0001));
      expect(tripleEma.getValue(13).quote, closeTo(0.6994, 0.0001));
      expect(tripleEma.getValue(14).quote, closeTo(0.6876, 0.0001));
    });
  });
}
