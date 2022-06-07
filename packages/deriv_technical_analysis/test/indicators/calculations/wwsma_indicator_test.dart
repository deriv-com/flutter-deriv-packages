import 'package:deriv_technical_analysis/deriv_technical_analysis.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mock_models.dart';

void main() {
  group('Welles Wilder’s Smoothing Average (WWS)', () {
    late List<MockTick> ticks;

    setUpAll(() {
      // Data from app.deriv.com:
      ticks = const <MockTick>[
        MockTick(epoch: 0, quote: 83.174),
        MockTick(epoch: 1, quote: 83.195),
        MockTick(epoch: 2, quote: 83.185),
        MockTick(epoch: 3, quote: 83.216),
        MockTick(epoch: 4, quote: 83.169),
        MockTick(epoch: 5, quote: 83.016),
        MockTick(epoch: 6, quote: 82.990),
        MockTick(epoch: 7, quote: 82.952),
        MockTick(epoch: 8, quote: 82.976),
        MockTick(epoch: 9, quote: 83.049),
        MockTick(epoch: 10, quote: 82.921),
        MockTick(epoch: 11, quote: 82.973),
        MockTick(epoch: 12, quote: 82.987),
        MockTick(epoch: 13, quote: 83.033),
        MockTick(epoch: 14, quote: 83.052),
        MockTick(epoch: 15, quote: 82.989),
        MockTick(epoch: 16, quote: 82.956),
        MockTick(epoch: 17, quote: 82.983),
        MockTick(epoch: 18, quote: 83.008),
        MockTick(epoch: 19, quote: 82.948),
        MockTick(epoch: 20, quote: 82.908),
      ];
    });

    test('WWSMAIndicator calculates the correct results', () {
      final WWSMAIndicator<MockResult> wws = WWSMAIndicator<MockResult>(
          CloseValueIndicator<MockResult>(MockInput(ticks)), 4);

      // Comparing Results with app.deriv.com
      expect(wws.getValue(14).quote, closeTo(83.019, 0.001));
      expect(wws.getValue(15).quote, closeTo(83.011, 0.001));
      expect(wws.getValue(16).quote, closeTo(82.997, 0.001));
      expect(wws.getValue(17).quote, closeTo(82.994, 0.001));
      expect(wws.getValue(18).quote, closeTo(82.997, 0.001));
      expect(wws.getValue(19).quote, closeTo(82.985, 0.001));
      expect(wws.getValue(20).quote, closeTo(82.966, 0.001));
    });
  });
}
