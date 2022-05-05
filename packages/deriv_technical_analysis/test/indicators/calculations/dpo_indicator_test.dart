import 'package:deriv_technical_analysis/deriv_technical_analysis.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mock_models.dart';

void main() {
  group('Detrended Price Oscillator', () {
    late List<MockTick> ticks;
    late CloseValueIndicator<MockResult> closeValueIndicator;
    setUpAll(() {
      ticks = const <MockTick>[
        MockTick(epoch: 0, quote: 22.27),
        MockTick(epoch: 1, quote: 22.19),
        MockTick(epoch: 2, quote: 22.08),
        MockTick(epoch: 3, quote: 22.17),
        MockTick(epoch: 4, quote: 22.18),
        MockTick(epoch: 5, quote: 22.13),
        MockTick(epoch: 6, quote: 22.23),
        MockTick(epoch: 7, quote: 22.43),
        MockTick(epoch: 8, quote: 22.24),
        MockTick(epoch: 9, quote: 22.29),
        MockTick(epoch: 10, quote: 22.15),
        MockTick(epoch: 11, quote: 22.39),
        MockTick(epoch: 12, quote: 22.38),
        MockTick(epoch: 13, quote: 22.61),
        MockTick(epoch: 14, quote: 23.36),
        MockTick(epoch: 15, quote: 24.05),
        MockTick(epoch: 16, quote: 23.75),
        MockTick(epoch: 17, quote: 23.83),
        MockTick(epoch: 18, quote: 23.95),
        MockTick(epoch: 19, quote: 23.63),
        MockTick(epoch: 20, quote: 23.82),
        MockTick(epoch: 21, quote: 23.87),
        MockTick(epoch: 22, quote: 23.65),
        MockTick(epoch: 23, quote: 23.19),
        MockTick(epoch: 24, quote: 23.10),
        MockTick(epoch: 25, quote: 23.33),
        MockTick(epoch: 26, quote: 22.68),
        MockTick(epoch: 27, quote: 23.10),
        MockTick(epoch: 28, quote: 22.40),
        MockTick(epoch: 29, quote: 22.17),
        MockTick(epoch: 30, quote: 22.27),
        MockTick(epoch: 31, quote: 22.19),
        MockTick(epoch: 32, quote: 22.08),
        MockTick(epoch: 33, quote: 22.17),
        MockTick(epoch: 34, quote: 22.18),
        MockTick(epoch: 35, quote: 22.13),
        MockTick(epoch: 36, quote: 22.23),
        MockTick(epoch: 37, quote: 22.43),
        MockTick(epoch: 38, quote: 22.24),
        MockTick(epoch: 39, quote: 22.29),
        MockTick(epoch: 40, quote: 22.15),
        MockTick(epoch: 41, quote: 22.39),
        MockTick(epoch: 42, quote: 22.38),
        MockTick(epoch: 43, quote: 22.61),
        MockTick(epoch: 44, quote: 23.36),
        MockTick(epoch: 45, quote: 24.05),
        MockTick(epoch: 46, quote: 23.75),
        MockTick(epoch: 47, quote: 23.83),
        MockTick(epoch: 48, quote: 23.95),
        MockTick(epoch: 49, quote: 23.63),
        MockTick(epoch: 50, quote: 23.82),
        MockTick(epoch: 51, quote: 23.87),
        MockTick(epoch: 52, quote: 23.65),
        MockTick(epoch: 53, quote: 23.19),
        MockTick(epoch: 54, quote: 23.10),
        MockTick(epoch: 55, quote: 23.33),
        MockTick(epoch: 56, quote: 22.68),
        MockTick(epoch: 57, quote: 23.10),
        MockTick(epoch: 58, quote: 22.40),
        MockTick(epoch: 59, quote: 22.17),
        MockTick(epoch: 60, quote: 22.27),
        MockTick(epoch: 61, quote: 22.19),
        MockTick(epoch: 62, quote: 22.08),
        MockTick(epoch: 63, quote: 22.17),
        MockTick(epoch: 64, quote: 22.18),
        MockTick(epoch: 65, quote: 22.13),
        MockTick(epoch: 66, quote: 22.23),
        MockTick(epoch: 67, quote: 22.43),
        MockTick(epoch: 68, quote: 22.24),
        MockTick(epoch: 69, quote: 22.29),
        MockTick(epoch: 70, quote: 22.15),
        MockTick(epoch: 71, quote: 22.39),
        MockTick(epoch: 72, quote: 22.38),
        MockTick(epoch: 73, quote: 22.61),
        MockTick(epoch: 74, quote: 23.36),
        MockTick(epoch: 75, quote: 24.05),
        MockTick(epoch: 76, quote: 23.75),
        MockTick(epoch: 77, quote: 23.83),
        MockTick(epoch: 78, quote: 23.95),
        MockTick(epoch: 79, quote: 23.63),
        MockTick(epoch: 80, quote: 23.82),
        MockTick(epoch: 81, quote: 23.87),
        MockTick(epoch: 82, quote: 23.65),
        MockTick(epoch: 83, quote: 23.19),
        MockTick(epoch: 84, quote: 23.10),
        MockTick(epoch: 85, quote: 23.33),
        MockTick(epoch: 86, quote: 22.68),
        MockTick(epoch: 87, quote: 23.10),
        MockTick(epoch: 88, quote: 22.40),
        MockTick(epoch: 89, quote: 22.17),
      ];
      closeValueIndicator = CloseValueIndicator<MockResult>(MockInput(ticks));
    });
    test(
        'Detrended Price Oscillator should calculates the correct results when isCentered is true',
        () {
      final DPOIndicator<MockResult> dpoIndicator = DPOIndicator<MockResult>(
        closeValueIndicator,
        (Indicator<MockResult> closeValueIndicator) =>
            SMAIndicator<MockResult>(closeValueIndicator, 9),
        period: 9,
      );

      expect(roundDouble(dpoIndicator.getValue(9).quote, 4), 0.0356);
      expect(roundDouble(dpoIndicator.getValue(10).quote, 4), 0.0811);
      expect(roundDouble(dpoIndicator.getValue(11).quote, 4), 0.0156);
      expect(roundDouble(dpoIndicator.getValue(12).quote, 4), -0.1611);
    });

    test(
        'Detrended Price Oscillator should calculates the correct results when isCentered is False',
        () {
      final DPOIndicator<MockResult> dpoIndicator = DPOIndicator<MockResult>(
        closeValueIndicator,
        (Indicator<MockResult> closeValueIndicator) =>
            SMAIndicator<MockResult>(closeValueIndicator, 9),
        isCentered: false,
        period: 9,
      );

      expect(roundDouble(dpoIndicator.getValue(9).quote, 4), -0.112);
      expect(roundDouble(dpoIndicator.getValue(10).quote, 4), 0.02);
      expect(roundDouble(dpoIndicator.getValue(11).quote, 4), -0.2114);
      expect(roundDouble(dpoIndicator.getValue(12).quote, 4), -0.17);
    });

    test(
        'Detrended Price Oscillator copyValuesFrom and refreshValueFor should works fine',
        () {
      // defining 1st indicator
      final DPOIndicator<MockResult> indicator1 = DPOIndicator<MockResult>(
        closeValueIndicator,
        (Indicator<MockResult> closeValueIndicator) =>
            SMAIndicator<MockResult>(closeValueIndicator, 14),
        isCentered: false,
      );

      // define a new input Changing the last data
      final List<MockTick> ticks2 = ticks.toList()
        ..removeLast()
        ..add(const MockTick(epoch: 89, quote: 21.37));

      // Defining 2nd indicator with the new updated data
      // Copying values of indicator1 into 2
      // Refreshing last value because its candle is changed
      final DPOIndicator<MockResult> indicator2 = DPOIndicator<MockResult>(
        CloseValueIndicator<MockResult>(
          MockInput(ticks2),
        ),
        (Indicator<MockResult> closeValueIndicator) =>
            SMAIndicator<MockResult>(closeValueIndicator, 14),
        isCentered: false,
      )
        ..copyValuesFrom(indicator1)
        ..refreshValueFor(89);

      // Their result in index 88 should be the same since we've copied the result.
      expect(indicator1.getValue(88).quote, indicator2.getValue(88).quote);

      // Calculated result for index 89 is different because the last data is changed.
      expect(roundDouble(indicator2.getValue(89).quote, 2), 1.8);
      expect(roundDouble(indicator1.getValue(89).quote, 2), 1.0);
    });
  });
}
