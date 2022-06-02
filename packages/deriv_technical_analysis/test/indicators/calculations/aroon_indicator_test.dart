import 'package:deriv_technical_analysis/deriv_technical_analysis.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mock_models.dart';

void main() {
  group('Aroon Indicator', () {
    late List<MockOHLC> candles;

    setUpAll(() {
      candles = const <MockOHLC>[
        MockOHLC(0, 168.28, 169.64, 169.87, 167.15),
        MockOHLC(1, 168.84, 168.71, 169.36, 168.2),
        MockOHLC(2, 168.88, 167.74, 169.29, 166.41),
        MockOHLC(3, 168, 166.32, 168.38, 166.18),
        MockOHLC(4, 166.89, 167.24, 167.7, 166.33),
        MockOHLC(5, 165.25, 168.05, 168.43, 165),
        MockOHLC(6, 168.17, 169.92, 170.18, 167.63),
        MockOHLC(7, 170.42, 171.97, 172.15, 170.06),
        MockOHLC(8, 172.41, 172.02, 172.92, 171.31),
        MockOHLC(9, 171.2, 170.72, 172.39, 169.55),
        MockOHLC(10, 170.91, 172.09, 172.48, 169.57),
        MockOHLC(11, 171.8, 173.21, 173.31, 170.27),
        MockOHLC(12, 173.09, 170.95, 173.49, 170.8),
        MockOHLC(13, 172.41, 173.51, 173.89, 172.2),
        MockOHLC(14, 173.87, 172.96, 174.17, 175),
        MockOHLC(15, 173, 173.05, 173.17, 172.06),
        MockOHLC(16, 172.26, 170.96, 172.28, 170.5),
        MockOHLC(17, 170.88, 171.64, 172.34, 170.26),
        MockOHLC(18, 171.85, 170.01, 172.07, 169.34),
        MockOHLC(19, 170.75, 172.52, 172.56, 170.36),
      ];
    });

    test('Aroon Down Indicator calculates the correct result', () {
      final LowValueIndicator<MockResult> lowValueIndicator =
          LowValueIndicator<MockResult>(MockInput(candles));

      final AroonDownIndicator<MockResult> aroonDownIndicator =
          AroonDownIndicator<MockResult>.fromIndicator(lowValueIndicator,
              period: 5);

      expect(aroonDownIndicator.getValue(19).quote, 80);
      expect(aroonDownIndicator.getValue(18).quote, 100);
      expect(aroonDownIndicator.getValue(17).quote, 100);
      expect(aroonDownIndicator.getValue(16).quote, 0);
      expect(aroonDownIndicator.getValue(15).quote, 0);
      expect(aroonDownIndicator.getValue(14).quote, 0);
      expect(aroonDownIndicator.getValue(13).quote, 20);
      expect(aroonDownIndicator.getValue(12).quote, 40);
      expect(aroonDownIndicator.getValue(11).quote, 0);
      expect(aroonDownIndicator.getValue(10).quote, 0);
      expect(aroonDownIndicator.getValue(9).quote, 20);
      expect(aroonDownIndicator.getValue(8).quote, 40);
      expect(aroonDownIndicator.getValue(7).quote, 60);
      expect(aroonDownIndicator.getValue(6).quote, 80);
      expect(aroonDownIndicator.getValue(5).quote, 100);
    });
    test('Aroon Down Indicator copyValuesFrom calculates correct result', () {
      final AroonDownIndicator<MockResult> indicator1 =
          AroonDownIndicator<MockResult>.fromIndicator(
        CloseValueIndicator<MockResult>(MockInput(candles)),
        period: 5,
      );

      expect(indicator1.getValue(18).quote, 100);
      expect(indicator1.getValue(19).quote, 80);

      final List<MockOHLC> candles2 = candles.toList()
        ..removeLast()
        ..add(const MockOHLC(19, 170.75, 160, 172.56, 160));

      // Defining 2nd indicator with the new updated data
      // Copying values of indicator1 into 2
      // Refreshing last value because its candle is changed
      final AroonDownIndicator<MockResult> indicator2 =
          AroonDownIndicator<MockResult>.fromIndicator(
        CloseValueIndicator<MockResult>(MockInput(candles2)),
        period: 5,
      )
            ..copyValuesFrom(indicator1)
            ..refreshValueFor(19);

      // Their result in index 18 should be the same since we've copied the result.
      expect(indicator2.getValue(18).quote, indicator1.getValue(18).quote);

      // Calculated result for index 19 is different because the last data is changed.
      expect(indicator2.getValue(19).quote, 100);
      expect(indicator1.getValue(19).quote, 80);
    });

    test('Aroon Up Indicator calculates the correct result', () {
      final HighValueIndicator<MockResult> highValueIndicator =
          HighValueIndicator<MockResult>(MockInput(candles));

      final AroonUpIndicator<MockResult> aroonUpIndicator =
          AroonUpIndicator<MockResult>.fromIndicator(highValueIndicator,
              period: 5);

      expect(aroonUpIndicator.getValue(19).quote, 0);
      expect(aroonUpIndicator.getValue(18).quote, 20);
      expect(aroonUpIndicator.getValue(17).quote, 40);
      expect(aroonUpIndicator.getValue(16).quote, 60);
      expect(aroonUpIndicator.getValue(15).quote, 80);
      expect(aroonUpIndicator.getValue(14).quote, 100);
      expect(aroonUpIndicator.getValue(13).quote, 100);
      expect(aroonUpIndicator.getValue(12).quote, 100);
      expect(aroonUpIndicator.getValue(11).quote, 100);
      expect(aroonUpIndicator.getValue(10).quote, 60);
      expect(aroonUpIndicator.getValue(9).quote, 80);
      expect(aroonUpIndicator.getValue(8).quote, 100);
      expect(aroonUpIndicator.getValue(7).quote, 100);
      expect(aroonUpIndicator.getValue(6).quote, 100);
      expect(aroonUpIndicator.getValue(5).quote, 0);
    });
    test(
        'Aroon Up Indicator copyValuesFrom  and refreshValueFor should works fine',
        () {
      final AroonUpIndicator<MockResult> indicator1 =
          AroonUpIndicator<MockResult>.fromIndicator(
        HighValueIndicator<MockResult>(MockInput(candles)),
        period: 5,
      );

      expect(indicator1.getValue(19).quote, 0.0);

      final List<MockOHLC> candles2 = candles.toList()
        ..removeLast()
        ..add(const MockOHLC(19, 161.75, 152.52, 165.56, 155.36));

      // Defining 2nd indicator with the new updated data
      // Copying values of indicator1 into 2
      // Refreshing last value because its candle is changed
      final AroonUpIndicator<MockResult> indicator2 =
          AroonUpIndicator<MockResult>.fromIndicator(
        HighValueIndicator<MockResult>(MockInput(candles2)),
        period: 5,
      )
            ..copyValuesFrom(indicator1)
            ..refreshValueFor(19);

      // Their result in index 18 should be the same since we've copied the result.
      expect(indicator2.getValue(18).quote, indicator1.getValue(18).quote);

      // Calculated result for index 19 is different because the last candle is changed.
      expect(indicator2.getValue(19).quote, 0.0);
    });
    test('Aroon Oscillator Indicator calculates the correct result', () {
      final AroonOscillatorIndicator<MockResult> aroonOscillatorIndicator =
          AroonOscillatorIndicator<MockResult>.fromIndicator(MockInput(candles),
              period: 5);

      expect(aroonOscillatorIndicator.getValue(19).quote, -80);
      expect(aroonOscillatorIndicator.getValue(18).quote, -80);
      expect(aroonOscillatorIndicator.getValue(17).quote, -40);
      expect(aroonOscillatorIndicator.getValue(16).quote, -40);
    });
    test(
        'Aroon Oscillator Indicator copyValuesFrom and refreshValueFor should works fine',
        () {
      final List<MockOHLC> candles2 = candles.toList();
      final AroonOscillatorIndicator<MockResult> aroonOscillatorIndicator1 =
          AroonOscillatorIndicator<MockResult>.fromIndicator(
              MockInput(candles2),
              period: 5);
      final AroonOscillatorIndicator<MockResult> aroonOscillatorIndicator2 =
          AroonOscillatorIndicator<MockResult>.fromIndicator(
              MockInput(candles2),
              period: 5);

      // Their result in index 19 should be the same.
      expect(aroonOscillatorIndicator2.getValue(19).quote, -80);
      expect(aroonOscillatorIndicator1.getValue(19).quote, -80);

      // add a data to input list
      candles2.add(const MockOHLC(20, 171.75, 162.52, 175.56, 165.36));

      // Refreshing to calculate the last value
      aroonOscillatorIndicator2.refreshValueFor(20);

      //check the new value
      expect(aroonOscillatorIndicator2.getValue(20).quote, -60);

      // Copying values of indicator2 into 1
      aroonOscillatorIndicator1.copyValuesFrom(aroonOscillatorIndicator2);

      // Calculated result for index 20 should be same because we copied
      // indicator2 into 1
      expect(aroonOscillatorIndicator1.getValue(20).quote, -60);
    });
  });
}
