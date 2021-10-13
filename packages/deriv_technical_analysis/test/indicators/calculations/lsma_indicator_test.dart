import 'package:deriv_technical_analysis/src/indicators/calculations/helper_indicators/close_value_inidicator.dart';
import 'package:deriv_technical_analysis/src/indicators/calculations/lsma_indicator.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mock_models.dart';

void main() {
  group('Least Square Moving Average', () {
    late List<MockTick> ticks;

    setUpAll(() {
      // Data from app.deriv.com:
      ticks = const <MockTick>[
        MockTick(epoch: 0, quote: 911.901),
        MockTick(epoch: 1, quote: 913.465),
        MockTick(epoch: 2, quote: 912.795),
        MockTick(epoch: 3, quote: 909.237),
        MockTick(epoch: 4, quote: 911.303),
        MockTick(epoch: 5, quote: 914.108),
        MockTick(epoch: 6, quote: 912.358),
        MockTick(epoch: 7, quote: 906.814),
        MockTick(epoch: 8, quote: 913.370),
        MockTick(epoch: 9, quote: 914.155),
        MockTick(epoch: 10, quote: 913.230),
        MockTick(epoch: 11, quote: 912.989),
        MockTick(epoch: 12, quote: 913.796),
        MockTick(epoch: 13, quote: 911.820),
        MockTick(epoch: 14, quote: 912.954),
        MockTick(epoch: 15, quote: 910.848),
        MockTick(epoch: 16, quote: 908.110),
        MockTick(epoch: 17, quote: 903.339),
        MockTick(epoch: 18, quote: 898.325),
        MockTick(epoch: 19, quote: 901.346),
        MockTick(epoch: 20, quote: 902.614),
      ];
    });

    test('LSMAIndicator calculates the correct results', () {
      final LSMAIndicator<MockResult> lsmaIndicator = LSMAIndicator<MockResult>(
          CloseValueIndicator<MockResult>(MockInput(ticks)), 4);

      // Comparing Results with app.deriv.com
      expect(lsmaIndicator.getValue(15).quote, closeTo(911.198, 0.001));
      expect(lsmaIndicator.getValue(16).quote, closeTo(908.948, 0.001));
      expect(lsmaIndicator.getValue(17).quote, closeTo(904.075, 0.001));
      expect(lsmaIndicator.getValue(18).quote, closeTo(898.804, 0.001));
      expect(lsmaIndicator.getValue(19).quote, closeTo(898.984, 0.001));
      expect(lsmaIndicator.getValue(20).quote, closeTo(901.533, 0.001));
    });
  });
}
