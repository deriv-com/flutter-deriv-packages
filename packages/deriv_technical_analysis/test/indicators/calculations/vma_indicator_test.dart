import 'package:flutter_test/flutter_test.dart';

import 'package:deriv_technical_analysis/deriv_technical_analysis.dart';
import '../mock_models.dart';

void main() {
  group('Variable Moving Average', () {
    late List<MockTick> ticks;

    setUpAll(() {
      // Data from app.deriv.com:
      ticks = const <MockTick>[
        MockTick(epoch: 0, quote: 83.511),
        MockTick(epoch: 1, quote: 83.500),
        MockTick(epoch: 2, quote: 83.499),
        MockTick(epoch: 3, quote: 83.480),
        MockTick(epoch: 4, quote: 83.440),
        MockTick(epoch: 5, quote: 83.449),
        MockTick(epoch: 6, quote: 83.457),
        MockTick(epoch: 7, quote: 83.460),
        MockTick(epoch: 8, quote: 83.475),
        MockTick(epoch: 9, quote: 83.495),
        MockTick(epoch: 10, quote: 83.492),
        MockTick(epoch: 11, quote: 83.485),
        MockTick(epoch: 12, quote: 83.499),
        MockTick(epoch: 13, quote: 83.499),
        MockTick(epoch: 14, quote: 83.474),
        MockTick(epoch: 15, quote: 83.493),
        MockTick(epoch: 16, quote: 83.486),
        MockTick(epoch: 17, quote: 83.531),
        MockTick(epoch: 18, quote: 83.518),
        MockTick(epoch: 19, quote: 83.472),
        MockTick(epoch: 20, quote: 83.488),
      ];
    });

    test('VMAIndicator calculates the correct results', () {
      final VMAIndicator<MockResult> v = VMAIndicator<MockResult>(
          CloseValueIndicator<MockResult>(MockInput(ticks)), 5);

      // Comparing Results with app.deriv.com
      expect(v.getValue(3).quote, closeTo(83.5, 0.01));
      expect(v.getValue(14).quote, closeTo(83.482, 0.01));
      expect(v.getValue(16).quote, closeTo(83.489, 0.01));
      expect(v.getValue(18).quote, closeTo(83.491, 0.01));
      expect(v.getValue(19).quote, closeTo(83.490, 0.01));
      expect(v.getValue(20).quote, closeTo(83.490, 0.01));
    });
  });
}
