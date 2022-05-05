import 'package:deriv_technical_analysis/deriv_technical_analysis.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mock_models.dart';

void main() {
  late List<MockTick> ticks;
  late CloseValueIndicator<MockResult> closeValueIndicator;

  late MACDIndicator<MockResult> macdIndicator;

  late SignalMACDIndicator<MockResult> signalMACDIndicator;

  setUpAll(() {
    ticks = const <MockTick>[
      MockTick(epoch: 00, quote: 82.201),
      MockTick(epoch: 02, quote: 82.200),
      MockTick(epoch: 03, quote: 82.200),
      MockTick(epoch: 04, quote: 82.200),
      MockTick(epoch: 05, quote: 82.200),
      MockTick(epoch: 06, quote: 82.201),
      MockTick(epoch: 07, quote: 82.198),
      MockTick(epoch: 08, quote: 82.198),
      MockTick(epoch: 09, quote: 82.199),
      MockTick(epoch: 10, quote: 82.199),
      MockTick(epoch: 11, quote: 82.199),
      MockTick(epoch: 12, quote: 82.198),
      MockTick(epoch: 13, quote: 82.196),
      MockTick(epoch: 14, quote: 82.197),
      MockTick(epoch: 15, quote: 82.194),
      MockTick(epoch: 16, quote: 82.195),
      MockTick(epoch: 17, quote: 82.194),
      MockTick(epoch: 18, quote: 82.194),
      MockTick(epoch: 19, quote: 82.194),
      MockTick(epoch: 20, quote: 82.195),
      MockTick(epoch: 21, quote: 82.195),
      MockTick(epoch: 22, quote: 82.195),
      MockTick(epoch: 23, quote: 82.194),
      MockTick(epoch: 24, quote: 82.194),
      MockTick(epoch: 25, quote: 82.192),
      MockTick(epoch: 26, quote: 82.192),
      MockTick(epoch: 27, quote: 82.192),
      MockTick(epoch: 28, quote: 82.191),
      MockTick(epoch: 29, quote: 82.188),
      MockTick(epoch: 30, quote: 82.189),
      MockTick(epoch: 31, quote: 82.192),
      MockTick(epoch: 32, quote: 82.192),
      MockTick(epoch: 33, quote: 82.193),
      MockTick(epoch: 34, quote: 82.193),
      MockTick(epoch: 35, quote: 82.192),
      MockTick(epoch: 36, quote: 82.193),
      MockTick(epoch: 37, quote: 82.193),
      MockTick(epoch: 38, quote: 82.192),
      MockTick(epoch: 39, quote: 82.192),
    ];

    closeValueIndicator = CloseValueIndicator<MockResult>(MockInput(ticks));

    macdIndicator =
        MACDIndicator<MockResult>.fromIndicator(closeValueIndicator);

    signalMACDIndicator =
        SignalMACDIndicator<MockResult>.fromIndicator(macdIndicator);
  });

  group(' Moving Average Convergance Divergence Indicator tests', () {
    test(
        ' Moving Average Convergance Divergence Indicator should calculate the correct result from the given closed value indicator ticks.',
        () {
      expect(roundDouble(macdIndicator.getValue(36).quote, 4), -0.0012);
      expect(roundDouble(macdIndicator.getValue(37).quote, 4), -0.0011);
      expect(roundDouble(macdIndicator.getValue(38).quote, 4), -0.0011);
    });

    test(
        'Signal Moving Average Convergance Divergence Indicator should calculate the correct result from the given closed value indicator ticks.',
        () {
      expect(roundDouble(signalMACDIndicator.getValue(36).quote, 4), -0.0016);
      expect(roundDouble(signalMACDIndicator.getValue(37).quote, 4), -0.0015);
      expect(roundDouble(signalMACDIndicator.getValue(38).quote, 4), -0.0014);
    });
    test(
        ' Moving Average Convergance Divergence Indicator copyValuesFrom and refreshValueFor should works fine',
        () {
      final MACDIndicator<MockResult> macdIndicator1 =
          MACDIndicator<MockResult>.fromIndicator(closeValueIndicator);

      expect(roundDouble(macdIndicator1.getValue(36).quote, 4), -0.0012);

      // define a new input by Changing the last data
      final List<MockTick> ticks2 = ticks.toList()
        ..removeLast()
        ..add(const MockTick(epoch: 38, quote: 82.152));

      // Defining 2nd indicator with the new updated data
      // Copying values of indicator 1 into 2
      // Refreshing last value because its candle is changed
      final MACDIndicator<MockResult> macdIndicator2 =
          MACDIndicator<MockResult>.fromIndicator(
        CloseValueIndicator<MockResult>(
          MockInput(ticks2),
        ),
      )
            ..copyValuesFrom(macdIndicator1)
            ..refreshValueFor(38);

      // Their result in index 36 should be the same since we've copied the result.
      expect(
          macdIndicator1.getValue(36).quote, macdIndicator2.getValue(36).quote);

      // Calculated result for index 38 is different because the last data is changed.
      expect(roundDouble(macdIndicator1.getValue(38).quote, 3), -0.001);
      expect(roundDouble(macdIndicator2.getValue(38).quote, 3), -0.004);
    });

    test(
        'Signal Moving Average Convergance Divergence Indicator copyValuesFrom and refreshValueFor should work fine.',
        () {
      final SignalMACDIndicator<MockResult> indicator1 =
          SignalMACDIndicator<MockResult>.fromIndicator(macdIndicator);

      expect(roundDouble(indicator1.getValue(38).quote, 4), -0.0014);

      // define a new input by Changing the last data
      final List<MockTick> ticks2 = ticks.toList()
        ..removeLast()
        ..add(const MockTick(epoch: 40, quote: 82.152));

      // Defining 2nd indicator with the new updated data
      // Copying values of indicator 1 into 2
      // Refreshing last value because its candle is changed
      final SignalMACDIndicator<MockResult> indicator2 =
          SignalMACDIndicator<MockResult>.fromIndicator(
              MACDIndicator<MockResult>.fromIndicator(
                  CloseValueIndicator<MockResult>(MockInput(ticks2))))
            ..copyValuesFrom(indicator1)
            ..refreshValueFor(38);

      // Their result in index 37 should be the same since we've copied the result.
      expect(indicator1.getValue(37).quote, indicator2.getValue(37).quote);

      // Calculated result for index 38 is different because the last data is changed.
      expect(roundDouble(indicator1.getValue(38).quote, 3), -0.001);
      expect(roundDouble(indicator2.getValue(38).quote, 3), -0.002);
    });

    test(
        'Signal Moving Average Convergance Divergence Histogram Indicator shoud calculate the correct result from the given closed value indicator ticks.',
        () {
      final MACDHistogramIndicator<MockResult> macdHistogramIndicator =
          MACDHistogramIndicator<MockResult>.fromIndicator(
              macdIndicator, signalMACDIndicator);

      expect(roundDouble(macdHistogramIndicator.getValue(36).quote, 4), 0.0004);
      expect(roundDouble(macdHistogramIndicator.getValue(37).quote, 4), 0.0004);
      expect(roundDouble(macdHistogramIndicator.getValue(38).quote, 4), 0.0003);
    });
  });
}
