import 'package:deriv_technical_analysis/deriv_technical_analysis.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mock_models.dart';

void main() {
  group('Gator Oscillator', () {
    late List<MockTick> ticks;
    setUpAll(() {
      ticks = const <MockTick>[
        MockOHLC(1, 79.537, 79.532, 213.35, 211.52),
        MockOHLC(2, 79.532, 79.524, 214.22, 213.15),
        MockOHLC(3, 79.523, 79.526, 214.06, 213.02),
        MockOHLC(4, 79.525, 79.529, 215.17, 213.42),
        MockOHLC(5, 79.528, 79.532, 214.53, 213.91),
        MockOHLC(6, 79.533, 79.525, 214.89, 213.52),
        MockOHLC(7, 79.537, 79.532, 214.55, 213.13),
        MockOHLC(8, 79.532, 79.524, 214.22, 212.53),
        MockOHLC(9, 79.523, 79.526, 214.84, 214.17),
        MockOHLC(10, 79.525, 79.529, 214.25, 213.33),
        MockOHLC(11, 79.528, 79.532, 214.27, 213.42),
        MockOHLC(12, 79.533, 79.525, 214.46, 212.96),
        MockOHLC(13, 79.533, 79.525, 214.75, 213.49),
        MockOHLC(14, 79.533, 79.525, 214.28, 212.83),
        MockOHLC(15, 79.533, 79.525, 215.48, 213.77),
        MockOHLC(16, 79.533, 79.525, 216.89, 215.89),
        MockOHLC(17, 79.533, 79.525, 217.02, 216.36),
        MockOHLC(18, 79.533, 79.525, 216.91, 216.12),
        MockOHLC(19, 79.533, 79.525, 215.59, 213.90),
        MockOHLC(20, 79.533, 79.525, 215.03, 213.82),
        MockOHLC(21, 79.533, 79.525, 215.96, 214.40),
        MockOHLC(22, 79.533, 79.525, 215.50, 214.29),
      ];
    });

    test('Gator Oscillator Top bar Indicator calculates the correct result',
        () {
      final Indicator<MockResult> medianPrice =
          HL2Indicator<MockResult>(MockInput(ticks));

      final GatorOscillatorIndicatorTopBar<MockResult>
          gatorOscillatorIndicatorTopBar =
          GatorOscillatorIndicatorTopBar<MockResult>(medianPrice);

      expect(roundDouble(gatorOscillatorIndicatorTopBar.getValue(20).quote, 4),
          0.5883);
      expect(roundDouble(gatorOscillatorIndicatorTopBar.getValue(21).quote, 4),
          0.5634);
    });

    test('Gator Oscillator Bottom bar Indicator calculates the correct result',
        () {
      final Indicator<MockResult> medianPrice =
          HL2Indicator<MockResult>(MockInput(ticks));

      final GatorOscillatorIndicatorBottomBar<MockResult>
          gatorOscillatorIndicatorBottomBar =
          GatorOscillatorIndicatorBottomBar<MockResult>(medianPrice);

      expect(
          roundDouble(gatorOscillatorIndicatorBottomBar.getValue(20).quote, 4),
          -0.3424);
      expect(
          roundDouble(gatorOscillatorIndicatorBottomBar.getValue(21).quote, 4),
          -0.349);
    });
  });
}
