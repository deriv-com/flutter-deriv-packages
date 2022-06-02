import 'package:deriv_technical_analysis/deriv_technical_analysis.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mock_models.dart';

void main() {
  group('Triangular Moving Average (TRIMA)', () {
    late List<MockTick> ticks;

    setUpAll(() {
      // Data from app.deriv.com:
      ticks = const <MockTick>[
        MockTick(epoch: 0, quote: 900.010),
        MockTick(epoch: 1, quote: 899.098),
        MockTick(epoch: 2, quote: 898.868),
        MockTick(epoch: 3, quote: 899.378),
        MockTick(epoch: 4, quote: 898.668),
        MockTick(epoch: 5, quote: 898.904),
        MockTick(epoch: 6, quote: 900.208),
        MockTick(epoch: 7, quote: 900.035),
        MockTick(epoch: 8, quote: 899.615),
        MockTick(epoch: 9, quote: 900.221),
        MockTick(epoch: 10, quote: 900.412),
      ];
    });

    test('TRIMAIndicator calculates the correct results', () {
      final TRIMAIndicator<MockResult> trimaIndicator =
          TRIMAIndicator<MockResult>(
              CloseValueIndicator<MockResult>(MockInput(ticks)), 3);

      // Comparing Results with app.deriv.com
      expect(trimaIndicator.getValue(4).quote, closeTo(899.073, 0.001));
      expect(trimaIndicator.getValue(5).quote, closeTo(898.905, 0.001));
      expect(trimaIndicator.getValue(6).quote, closeTo(899.171, 0.001));
      expect(trimaIndicator.getValue(7).quote, closeTo(899.839, 0.001));
      expect(trimaIndicator.getValue(8).quote, closeTo(899.973, 0.001));
      expect(trimaIndicator.getValue(9).quote, closeTo(899.872, 0.001));
      expect(trimaIndicator.getValue(10).quote, closeTo(900.117, 0.001));
    });
  });
}
