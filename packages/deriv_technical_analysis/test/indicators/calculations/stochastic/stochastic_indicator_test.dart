import 'package:deriv_technical_analysis/src/helpers/functions.dart';
import 'package:deriv_technical_analysis/src/indicators/calculations/stochastic/fast_stochastic_indicator.dart';
import 'package:deriv_technical_analysis/src/indicators/calculations/stochastic/slow_stochastic_indicator.dart';
import 'package:deriv_technical_analysis/src/indicators/calculations/stochastic/smoothed_fast_stochastic_indicator.dart';
import 'package:deriv_technical_analysis/src/indicators/calculations/stochastic/smoothed_slow_stochastic_indicator.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mock_models.dart';

void main() {
  late List<MockTick> ticks;

  setUpAll(() {
    ticks = const <MockTick>[
      MockOHLC(01, 127.01, 127.01, 127.01, 125.36),
      MockOHLC(02, 127.62, 127.62, 127.62, 126.16),
      MockOHLC(03, 126.59, 126.59, 126.59, 124.93),
      MockOHLC(04, 127.35, 127.35, 127.35, 126.09),
      MockOHLC(05, 128.17, 128.17, 128.17, 126.82),
      MockOHLC(06, 128.43, 128.43, 128.43, 126.48),
      MockOHLC(07, 127.37, 127.37, 127.37, 126.03),
      MockOHLC(08, 126.42, 126.42, 126.42, 124.83),
      MockOHLC(09, 126.90, 126.90, 126.90, 126.39),
      MockOHLC(10, 126.85, 126.85, 126.85, 125.72),
      MockOHLC(11, 125.65, 125.65, 125.65, 124.56),
      MockOHLC(12, 125.72, 125.72, 125.72, 124.57),
      MockOHLC(13, 127.16, 127.16, 127.16, 125.07),
      MockOHLC(14, 127.29, 127.29, 127.72, 126.86),
      MockOHLC(15, 127.18, 127.18, 127.69, 126.63),
      MockOHLC(16, 128.01, 128.01, 128.22, 126.80),
      MockOHLC(17, 127.11, 127.11, 128.27, 126.71),
      MockOHLC(18, 127.73, 127.73, 128.09, 126.80),
      MockOHLC(19, 127.06, 127.06, 128.27, 126.13),
      MockOHLC(20, 127.33, 127.33, 127.74, 125.92),
      MockOHLC(21, 128.71, 128.71, 128.77, 126.99),
      MockOHLC(22, 127.87, 127.87, 129.29, 127.81),
      MockOHLC(23, 128.58, 128.58, 130.06, 128.47),
      MockOHLC(24, 128.60, 128.60, 129.12, 128.06),
      MockOHLC(25, 127.93, 127.93, 129.29, 127.61),
      MockOHLC(26, 128.11, 128.11, 128.47, 127.60),
      MockOHLC(27, 127.60, 127.60, 128.09, 127),
      MockOHLC(28, 127.60, 127.60, 128.65, 126.90),
      MockOHLC(29, 128.69, 128.69, 129.14, 127.49),
    ];
  });

  group('Stochastic Indicator test.', () {
    test(
        'Fast Stochastic Indicator should calculate the correct results from the given ticks.',
        () {
      final FastStochasticIndicator<MockResult> fastStochasticIndicator =
          FastStochasticIndicator<MockResult>(MockInput(ticks));

      expect(roundDouble(fastStochasticIndicator.getValue(21).quote, 2), 69.98);
      expect(roundDouble(fastStochasticIndicator.getValue(22).quote, 2), 73.09);
      expect(roundDouble(fastStochasticIndicator.getValue(23).quote, 2), 73.45);
      expect(roundDouble(fastStochasticIndicator.getValue(24).quote, 2), 61.2);
      expect(roundDouble(fastStochasticIndicator.getValue(25).quote, 2), 60.92);
      expect(roundDouble(fastStochasticIndicator.getValue(26).quote, 2), 40.58);
      expect(roundDouble(fastStochasticIndicator.getValue(27).quote, 2), 40.58);
      expect(roundDouble(fastStochasticIndicator.getValue(28).quote, 2), 66.91);
    });

    test(
        'Smoothed Fast Stochastic Indicator should calculate the correct results from the given fast stochastic indicator.',
        () {
      final FastStochasticIndicator<MockResult> fastStochasticIndicator =
          FastStochasticIndicator<MockResult>(MockInput(ticks));
      final SmoothedFastStochasticIndicator<MockResult>
          smoothedFastStochasticIndicator =
          SmoothedFastStochasticIndicator<MockResult>(fastStochasticIndicator);

      expect(roundDouble(smoothedFastStochasticIndicator.getValue(21).quote, 2),
          81.07);
      expect(roundDouble(smoothedFastStochasticIndicator.getValue(22).quote, 2),
          80.55);
      expect(roundDouble(smoothedFastStochasticIndicator.getValue(23).quote, 2),
          72.17);
      expect(roundDouble(smoothedFastStochasticIndicator.getValue(24).quote, 2),
          69.25);
      expect(roundDouble(smoothedFastStochasticIndicator.getValue(25).quote, 2),
          65.19);
      expect(roundDouble(smoothedFastStochasticIndicator.getValue(26).quote, 2),
          54.23);
      expect(roundDouble(smoothedFastStochasticIndicator.getValue(27).quote, 2),
          47.36);
      expect(roundDouble(smoothedFastStochasticIndicator.getValue(28).quote, 2),
          49.36);
    });

    test(
        'Slow Stochastic Indicator should calculate the correct results from the given ticks.',
        () {
      final SlowStochasticIndicator<MockResult> slowStochasticIndicator =
          SlowStochasticIndicator<MockResult>(
        MockInput(ticks),
      );

      expect(roundDouble(slowStochasticIndicator.getValue(24).quote, 2), 69.25);
      expect(roundDouble(slowStochasticIndicator.getValue(25).quote, 2), 65.19);
      expect(roundDouble(slowStochasticIndicator.getValue(26).quote, 2), 54.23);
      expect(roundDouble(slowStochasticIndicator.getValue(27).quote, 2), 47.36);
      expect(roundDouble(slowStochasticIndicator.getValue(28).quote, 2), 49.36);
    });
    test(
        'Smoothed Slow Stochastic Indicator should calculate the correct results from the given slow stochastic indicator.',
        () {
      final SlowStochasticIndicator<MockResult> slowStochasticIndicator =
          SlowStochasticIndicator<MockResult>(
        MockInput(ticks),
      );
      final SmoothedSlowStochasticIndicator<MockResult>
          smoothedSlowStochasticIndicator =
          SmoothedSlowStochasticIndicator<MockResult>(
        slowStochasticIndicator,
      );

      expect(roundDouble(smoothedSlowStochasticIndicator.getValue(24).quote, 2),
          73.99);
      expect(roundDouble(smoothedSlowStochasticIndicator.getValue(25).quote, 2),
          68.87);
      expect(roundDouble(smoothedSlowStochasticIndicator.getValue(26).quote, 2),
          62.89);
      expect(roundDouble(smoothedSlowStochasticIndicator.getValue(27).quote, 2),
          55.6);
      expect(roundDouble(smoothedSlowStochasticIndicator.getValue(28).quote, 2),
          50.32);
    });

    test(
        'Fast Stochastic Indicator copyValuesFrom and refreshValueFor should work fine.',
        () {
      // defining 1st indicator
      final FastStochasticIndicator<MockResult> indicator1 =
          FastStochasticIndicator<MockResult>(MockInput(ticks));

      // Checking the values of first indicator
      expect(roundDouble(indicator1.getValue(28).quote, 2), 66.91);

      // define a new input Changing the last data
      final List<MockTick> ticks2 = ticks.toList()
        ..removeLast()
        ..add(const MockOHLC(30, 125.69, 126.69, 127.14, 125.49));

      // Defining 2nd indicator with the new updated data
      // Copying values of indicator1 into 2
      // Refreshing last value because its candle is changed
      final FastStochasticIndicator<MockResult> indicator2 =
          FastStochasticIndicator<MockResult>(MockInput(ticks2))
            ..copyValuesFrom(indicator1)
            ..refreshValueFor(28);

      // Their result in index 27 should be the same since we've copied the result.
      expect(indicator2.getValue(27).quote, indicator1.getValue(27).quote);

      // Calculated result for index 28 is different because the last data is changed.
      expect(roundDouble(indicator2.getValue(28).quote, 2), 26.26);
      expect(roundDouble(indicator1.getValue(28).quote, 2), 66.91);
    });

    test(
        'Smoothed Fast Stochastic Indicator copyValuesFrom and refreshValueFor should work fine.',
        () {
      // defining 1st indicator
      final FastStochasticIndicator<MockResult> fastStochasticIndicator =
          FastStochasticIndicator<MockResult>(MockInput(ticks));

      final SmoothedFastStochasticIndicator<MockResult> indicator1 =
          SmoothedFastStochasticIndicator<MockResult>(fastStochasticIndicator);

      // Checking the values of first indicator
      expect(roundDouble(indicator1.getValue(28).quote, 2), 49.36);

      // Defining 2nd indicator with the new updated data
      // Copying values of indicator1 into 2
      final SmoothedFastStochasticIndicator<MockResult> indicator2 =
          SmoothedFastStochasticIndicator<MockResult>(fastStochasticIndicator)
            ..copyValuesFrom(indicator1);

      // Their result in index 27 should be the same since we've copied the result.
      expect(indicator2.getValue(27).quote, indicator1.getValue(27).quote);
    });

    test(
        'Slow Stochastic Indicator copyValuesFrom and refreshValueFor should works fine.',
        () {
      // defining 1st indicator
      final SlowStochasticIndicator<MockResult> indicator1 =
          SlowStochasticIndicator<MockResult>(MockInput(ticks));

      // Checking the values of first indicator
      expect(roundDouble(indicator1.getValue(28).quote, 2), 49.36);

      // define a new input Changing the last data
      final List<MockTick> ticks2 = ticks.toList()
        ..removeLast()
        ..add(const MockOHLC(30, 125.69, 126.69, 127.14, 125.49));

      // Defining 2nd indicator with the new updated data
      // Copying values of indicator1 into 2
      // Refreshing last value because its candle is changed
      final SlowStochasticIndicator<MockResult> indicator2 =
          SlowStochasticIndicator<MockResult>(MockInput(ticks2))
            ..copyValuesFrom(indicator1)
            ..refreshValueFor(28);

      // Their result in index 27 should be the same since we've copied the result.
      expect(indicator2.getValue(27).quote, indicator1.getValue(27).quote);

      // Calculated result for index 28 is different because the last data is changed.
      expect(roundDouble(indicator2.getValue(28).quote, 2), 35.81);
      expect(roundDouble(indicator1.getValue(28).quote, 2), 49.36);
    });
  });
  test(
      'Smoothed Slow Stochastic Indicator copyValuesFrom and refreshValueFor should works fine.',
      () {
    // defining 1st indicator
    final SlowStochasticIndicator<MockResult> slowStochasticIndicator =
        SlowStochasticIndicator<MockResult>(MockInput(ticks));
    final SmoothedSlowStochasticIndicator<MockResult> indicator1 =
        SmoothedSlowStochasticIndicator<MockResult>(slowStochasticIndicator);

    // Checking the values of first indicator
    expect(roundDouble(indicator1.getValue(28).quote, 2), 50.32);

    // Defining 2nd indicator with the new updated data
    // Copying values of indicator1 into 2
    final SmoothedSlowStochasticIndicator<MockResult> indicator2 =
        SmoothedSlowStochasticIndicator<MockResult>(slowStochasticIndicator)
          ..copyValuesFrom(indicator1);

    // Their result in index 27 should be the same since we've copied the result.
    expect(indicator2.getValue(27).quote, indicator1.getValue(27).quote);
  });
}
