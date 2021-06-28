import 'package:deriv_technical_analysis/src/helpers/functions.dart';
import 'package:deriv_technical_analysis/src/indicators/calculations/helper_indicators/close_value_inidicator.dart';
import 'package:deriv_technical_analysis/src/indicators/calculations/rsi_indicator.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mock_models.dart';

void main() {
  late List<MockTick> ticks;

  setUpAll(() {
    ticks = const <MockTick>[
      MockOHLC(00, 79.537, 79.532, 79.540, 79.529),
      MockOHLC(01, 79.532, 79.524, 79.536, 79.522),
      MockOHLC(02, 79.523, 79.526, 79.536, 79.522),
      MockOHLC(03, 79.525, 79.529, 79.534, 79.522),
      MockOHLC(04, 79.528, 79.532, 79.532, 79.518),
      MockOHLC(05, 79.533, 79.525, 79.539, 79.518),
      MockOHLC(06, 79.525, 79.514, 79.528, 79.505),
      MockOHLC(07, 79.515, 79.510, 79.516, 79.507),
      MockOHLC(08, 79.509, 79.507, 79.512, 79.503),
      MockOHLC(09, 79.507, 79.518, 79.520, 79.504),
      MockOHLC(10, 79.517, 79.507, 79.523, 79.507),
      MockOHLC(11, 79.510, 79.509, 79.515, 79.505),
      MockOHLC(12, 79.508, 79.513, 79.518, 79.508),
      MockOHLC(13, 79.513, 79.526, 79.526, 79.513),
      MockOHLC(14, 79.526, 79.526, 79.527, 79.521),
      MockOHLC(15, 79.526, 79.544, 79.547, 79.525),
      MockOHLC(16, 79.546, 79.545, 79.547, 79.533),
      MockOHLC(17, 79.545, 79.556, 79.559, 79.538),
      MockOHLC(18, 79.557, 79.554, 79.562, 79.544),
      MockOHLC(19, 79.555, 79.549, 79.559, 79.548),
      MockOHLC(20, 79.550, 79.548, 79.554, 79.545),
    ];
  });

  group('Relative Strength Index Indicator test.', () {
    test(
        'Relative Strength Index should calculate the correct results from the given closed value indicator ticks.',
        () {
      final CloseValueIndicator<MockResult> closeValueIndicator =
          CloseValueIndicator<MockResult>(MockInput(ticks));
      final RSIIndicator<MockResult> rsiIndicator =
          RSIIndicator<MockResult>.fromIndicator(closeValueIndicator, 14);

      expect(rsiIndicator.getValue(0).quote, 0);
      expect(roundDouble(rsiIndicator.getValue(14).quote, 2), 52.88);
      expect(roundDouble(rsiIndicator.getValue(15).quote, 2), 65.42);
      expect(roundDouble(rsiIndicator.getValue(16).quote, 2), 65.96);
      expect(roundDouble(rsiIndicator.getValue(17).quote, 2), 71.28);
    });
    test('RSI Indicator copyValuesFrom and refreshValueFor should works fine',
        () {
      // defining 1st indicator
      final RSIIndicator<MockResult> rsiIndicator1 =
          RSIIndicator<MockResult>.fromIndicator(
              CloseValueIndicator<MockResult>(MockInput(ticks)), 14);

      // Checking the values of first indicator
      expect(roundDouble(rsiIndicator1.getValue(14).quote, 2), 52.88);
      expect(roundDouble(rsiIndicator1.getValue(15).quote, 2), 65.42);

      // define a new input Changing the last data
      final List<MockTick> ticks2 = ticks.toList()
        ..removeLast()
        ..add(const MockOHLC(20, 89.550, 89.548, 89.554, 89.545));

      // Defining 2nd indicator with the new updated data
      // Copying values of indicator1 into 2
      // Refreshing last value because its candle is changed
      final RSIIndicator<MockResult> rsiIndicator2 =
          RSIIndicator<MockResult>.fromIndicator(
              CloseValueIndicator<MockResult>(MockInput(ticks2)), 14)
            ..copyValuesFrom(rsiIndicator1)
            ..refreshValueFor(20);

      // Their result in index 19 should be the same since we've copied the result.
      expect(
          rsiIndicator2.getValue(19).quote, rsiIndicator1.getValue(19).quote);

      // Calculated result for index 20 is different because the last data is changed.
      expect(roundDouble(rsiIndicator2.getValue(20).quote, 2), 99.78);
      expect(roundDouble(rsiIndicator1.getValue(20).quote, 2), 63.03);
    });
  });
}
