import 'package:deriv_technical_analysis/src/helpers/functions.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:deriv_technical_analysis/src/indicators/calculations/awesome_oscillator_indicator.dart';

import '../mock_models.dart';

void main() {
  group('Awesome Oscillator Indicator', () {
    late List<MockOHLC> ticks;

    setUpAll(() {
      ticks = const <MockOHLC>[
        MockOHLC.withNames(epoch: 1, open: 0, close: 0, high: 16, low: 8),
        MockOHLC.withNames(epoch: 2, open: 0, close: 0, high: 12, low: 6),
        MockOHLC.withNames(epoch: 3, open: 0, close: 0, high: 18, low: 14),
        MockOHLC.withNames(epoch: 4, open: 0, close: 0, high: 10, low: 6),
        MockOHLC.withNames(epoch: 5, open: 0, close: 0, high: 8, low: 4)
      ];
    });

    test('AwesomeOscillator calculates the correct result from HL2Indicator.',
        () {
      final AwesomeOscillatorIndicator<MockResult> _aoIndicator =
          AwesomeOscillatorIndicator<MockResult>(MockInput(ticks));

      expect(_aoIndicator.getValue(0).quote, 0.0);
      expect(_aoIndicator.getValue(1).quote, 0.0);
      expect(_aoIndicator.getValue(2).quote, 0.0);
      expect(_aoIndicator.getValue(3).quote, 0.0);
      expect(_aoIndicator.getValue(4).quote, 0.0);
    });

    test('Calculating using custom Period for SMA', () {
      final AwesomeOscillatorIndicator<MockResult> _aoIndicator =
          AwesomeOscillatorIndicator<MockResult>(MockInput(ticks),
              smaPeriodOne: 2, smaPeriodTwo: 3);

      expect(_aoIndicator.getValue(0).quote, 0.0);
      expect(_aoIndicator.getValue(1).quote, 0.0);
      expect(_aoIndicator.getValue(2).quote, 0.16666666666666607);
      expect(_aoIndicator.getValue(3).quote, 1);
      expect(_aoIndicator.getValue(4).quote, -3);
    });

    test(
        'AwesomeOscillator copyValuesFrom and refreshValueFor should works fine.',
        () {
      // defining 1st indicator
      final AwesomeOscillatorIndicator<MockResult> _aoIndicator1 =
          AwesomeOscillatorIndicator<MockResult>(MockInput(ticks),
              smaPeriodOne: 2, smaPeriodTwo: 3);

      // define a new input Changing the last data
      final List<MockOHLC> ticks2 = ticks.toList()
        ..removeLast()
        ..add(const MockOHLC.withNames(
            epoch: 5, open: 0, close: 0, high: 12, low: 2));

      // Defining 2nd indicator with the new updated data
      // Copying values of indicator1 into 2
      // Refreshing last value because its candle is changed
      final AwesomeOscillatorIndicator<MockResult> _aoIndicator2 =
          AwesomeOscillatorIndicator<MockResult>(MockInput(ticks2),
              smaPeriodOne: 2, smaPeriodTwo: 3)
            ..copyValuesFrom(_aoIndicator1)
            ..refreshValueFor(4);

      // Their result in index 3 should be the same since we've copied the result.
      expect(_aoIndicator1.getValue(3).quote, _aoIndicator2.getValue(3).quote);

      // Calculated result for index 4 is different because the last data is changed.
      expect(roundDouble(_aoIndicator1.getValue(4).quote, 2), -3.0);
      expect(roundDouble(_aoIndicator2.getValue(4).quote, 2), -2.83);
    });
  });
}
