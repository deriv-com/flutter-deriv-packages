import 'package:deriv_technical_analysis/deriv_technical_analysis.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mock_models.dart';

void main() {
  group('Ichimoku Cloud Test', () {
    late List<MockTick> ticks;
    late IchimokuConversionLineIndicator<MockResult> conversionLineIndicator;
    late IchimokuBaseLineIndicator<MockResult> baseLineIndicator;

    setUpAll(() {
      ticks = const <MockOHLC>[
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
        MockOHLC(21, 79.547, 79.547, 79.547, 79.538),
        MockOHLC(22, 79.545, 79.544, 79.548, 79.543),
        MockOHLC(23, 79.543, 79.545, 79.546, 79.541),
        MockOHLC(24, 79.545, 79.564, 79.565, 79.543),
        MockOHLC(25, 79.565, 79.562, 79.567, 79.560),
        MockOHLC(26, 79.563, 79.559, 79.566, 79.559),
        MockOHLC(27, 79.558, 79.560, 79.568, 79.554),
        MockOHLC(28, 79.565, 79.573, 79.577, 79.562),
        MockOHLC(29, 79.578, 79.583, 79.584, 79.568),
        MockOHLC(30, 79.582, 79.589, 79.592, 79.582),
        MockOHLC(31, 79.591, 79.590, 79.596, 79.588),
        MockOHLC(32, 79.589, 79.586, 79.590, 79.582),
        MockOHLC(33, 79.586, 79.557, 79.586, 79.552),
        MockOHLC(34, 79.556, 79.555, 79.565, 79.555),
        MockOHLC(35, 79.554, 79.555, 79.562, 79.549),
        MockOHLC(36, 79.556, 79.544, 79.556, 79.540),
        MockOHLC(37, 79.543, 79.536, 79.545, 79.523),
        MockOHLC(38, 79.535, 79.532, 79.557, 79.531),
        MockOHLC(39, 79.532, 79.515, 79.537, 79.510),
        MockOHLC(40, 79.516, 79.492, 79.521, 79.490),
        MockOHLC(41, 79.494, 79.420, 79.497, 79.416),
        MockOHLC(42, 79.426, 79.437, 79.438, 79.416),
        MockOHLC(43, 79.436, 79.459, 79.466, 79.435),
        MockOHLC(44, 79.459, 79.457, 79.464, 79.449),
        MockOHLC(45, 79.457, 79.469, 79.477, 79.454),
        MockOHLC(46, 79.466, 79.471, 79.480, 79.463),
        MockOHLC(47, 79.473, 79.481, 79.487, 79.470),
        MockOHLC(48, 79.480, 79.462, 79.483, 79.457),
        MockOHLC(49, 79.462, 79.455, 79.462, 79.451),
        MockOHLC(50, 79.453, 79.456, 79.457, 79.448),
        MockOHLC(51, 79.456, 79.446, 79.459, 79.434),
        MockOHLC(52, 79.448, 79.439, 79.449, 79.429),
        MockOHLC(53, 79.442, 79.425, 79.442, 79.420),
        MockOHLC(54, 79.424, 79.416, 79.424, 79.412),
        MockOHLC(55, 79.418, 79.405, 79.420, 79.401),
        MockOHLC(56, 79.405, 79.386, 79.405, 79.385),
        MockOHLC(57, 79.386, 79.413, 79.413, 79.385),
      ];

      conversionLineIndicator =
          IchimokuConversionLineIndicator<MockResult>(MockInput(ticks));
      baseLineIndicator =
          IchimokuBaseLineIndicator<MockResult>(MockInput(ticks));
    });

    test(
        "Ichimoku Lagging Span calculates the previous [period] of the given candle's closing value for the selected candle.",
        () {
      final IchimokuLaggingSpanIndicator<MockResult> laggingSpanIndicator =
          IchimokuLaggingSpanIndicator<MockResult>(MockInput(ticks));

      expect(laggingSpanIndicator.getValue(3).quote, 79.529);
      expect(laggingSpanIndicator.getValue(4).quote, 79.532);
      expect(laggingSpanIndicator.getValue(5).quote, 79.525);
      expect(laggingSpanIndicator.getValue(6).quote, 79.514);
    });

    test(
        "Ichimoku Conversion Line calculates the previous [period]s(9 by default) average of the given candle's highest high and lowest low.",
        () {
      expect(conversionLineIndicator.getValue(26).quote, 79.5525);
      expect(conversionLineIndicator.getValue(27).quote, 79.553);
      expect(conversionLineIndicator.getValue(28).quote, 79.5575);
      expect(conversionLineIndicator.getValue(29).quote, 79.561);
      expect(
          roundDouble(conversionLineIndicator.getValue(30).quote, 4), 79.5665);
    });

    test(
        "Ichimoku Base Line calculates the previous [period]s(26 by default) average of the given candle's highest high and lowest low.",
        () {
      expect(baseLineIndicator.getValue(26).quote, 79.535);
      expect(baseLineIndicator.getValue(27).quote, 79.5355);
      expect(roundDouble(baseLineIndicator.getValue(28).quote, 2), 79.54);
      expect(baseLineIndicator.getValue(29).quote, 79.5435);
      expect(baseLineIndicator.getValue(30).quote, 79.5475);
    });

    test(
        "Ichimoku Span A calculates the average of the given candle's Conversion Line and Base Line.",
        () {
      final IchimokuSpanAIndicator<MockResult> spanAIndicator =
          IchimokuSpanAIndicator<MockResult>(MockInput(ticks),
              conversionLineIndicator: conversionLineIndicator,
              baseLineIndicator: baseLineIndicator);
      expect(roundDouble(spanAIndicator.getValue(26).quote, 4), 79.5437);
      expect(roundDouble(spanAIndicator.getValue(27).quote, 4), 79.5443);
      expect(roundDouble(spanAIndicator.getValue(28).quote, 4), 79.5487);
      expect(roundDouble(spanAIndicator.getValue(29).quote, 4), 79.5523);
      expect(roundDouble(spanAIndicator.getValue(30).quote, 3), 79.557);
    });

    test(
        'Ichimoku Span A copyValuesFrom and refreshValueFor should works fine.',
        () {
      final IchimokuSpanAIndicator<MockResult> spanAIndicator1 =
          IchimokuSpanAIndicator<MockResult>(MockInput(ticks),
              conversionLineIndicator: conversionLineIndicator,
              baseLineIndicator: baseLineIndicator);

      // define a new input Changing the last data
      final List<MockTick> ticks2 = ticks.toList()
        ..removeLast()
        ..add(const MockOHLC(57, 78.386, 77.3, 78.2, 78.285));

      final IchimokuConversionLineIndicator<MockResult>
          conversionLineIndicator2 =
          IchimokuConversionLineIndicator<MockResult>(MockInput(ticks2));
      final IchimokuBaseLineIndicator<MockResult> baseLineIndicator2 =
          IchimokuBaseLineIndicator<MockResult>(MockInput(ticks2));

      // Defining 2nd indicator with the new updated data
      // Copying values of indicator 1 into 2
      // Refreshing last value because its candle is changed
      final IchimokuSpanAIndicator<MockResult> spanAIndicator2 =
          IchimokuSpanAIndicator<MockResult>(MockInput(ticks2),
              conversionLineIndicator: conversionLineIndicator2,
              baseLineIndicator: baseLineIndicator2)
            ..copyValuesFrom(spanAIndicator1)
            ..refreshValueFor(57);

      // Their result in index 56 should be the same since we've copied the result.
      expect(spanAIndicator2.getValue(56).quote,
          spanAIndicator1.getValue(56).quote);

      // Calculated result for index 57 is different because the last data is changed.
      expect(roundDouble(spanAIndicator2.getValue(57).quote, 3), 78.906);
      expect(roundDouble(spanAIndicator1.getValue(57).quote, 3), 79.456);
    });

    test(
        "Ichimoku Span B calculates the previous [period]s(52 by default) average of the given candle's highest high and lowest low.",
        () {
      final IchimokuSpanBIndicator<MockResult> spanAIndicator =
          IchimokuSpanBIndicator<MockResult>(MockInput(ticks));

      expect(spanAIndicator.getValue(52).quote, 79.506);
      expect(spanAIndicator.getValue(53).quote, 79.506);
      expect(spanAIndicator.getValue(54).quote, 79.504);
      expect(spanAIndicator.getValue(55).quote, 79.4985);
      expect(spanAIndicator.getValue(56).quote, 79.4905);
    });
  });
}
