import 'package:deriv_technical_analysis/src/helpers/functions.dart';
import 'package:deriv_technical_analysis/src/indicators/cached_indicator.dart';
import 'package:deriv_technical_analysis/src/indicators/calculations/bollinger/bollinger_bands_upper_indicator.dart';
import 'package:deriv_technical_analysis/src/indicators/calculations/bollinger/percent_b_indicator.dart';
import 'package:deriv_technical_analysis/src/indicators/calculations/helper_indicators/close_value_inidicator.dart';
import 'package:deriv_technical_analysis/src/indicators/calculations/sma_indicator.dart';
import 'package:deriv_technical_analysis/src/indicators/calculations/statistics/standard_deviation_indicator.dart';
import 'package:deriv_technical_analysis/src/indicators/indicator.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mock_models.dart';

void main() {
  group('BollingerBands Indicator', () {
    late List<MockTick> ticks;
    setUpAll(() {
      ticks = const <MockTick>[
        MockTick(epoch: 1, quote: 10),
        MockTick(epoch: 2, quote: 12),
        MockTick(epoch: 3, quote: 15),
        MockTick(epoch: 4, quote: 14),
        MockTick(epoch: 5, quote: 17),
        MockTick(epoch: 6, quote: 20),
        MockTick(epoch: 7, quote: 21),
        MockTick(epoch: 8, quote: 20),
        MockTick(epoch: 9, quote: 20),
        MockTick(epoch: 10, quote: 19),
        MockTick(epoch: 11, quote: 20),
        MockTick(epoch: 12, quote: 17),
        MockTick(epoch: 13, quote: 12),
        MockTick(epoch: 14, quote: 12),
        MockTick(epoch: 15, quote: 9),
        MockTick(epoch: 16, quote: 8),
        MockTick(epoch: 17, quote: 9),
        MockTick(epoch: 18, quote: 10),
        MockTick(epoch: 19, quote: 9),
        MockTick(epoch: 20, quote: 10),
      ];
    });
    test('BollingerBandsUpperIndicator calculates the correct result', () {
      const List<MockTick> ticks = <MockTick>[
        MockTick(epoch: 1, quote: 1),
        MockTick(epoch: 2, quote: 2),
        MockTick(epoch: 3, quote: 3),
        MockTick(epoch: 4, quote: 4),
        MockTick(epoch: 5, quote: 3),
        MockTick(epoch: 6, quote: 4),
        MockTick(epoch: 7, quote: 5),
        MockTick(epoch: 8, quote: 4),
        MockTick(epoch: 9, quote: 3),
        MockTick(epoch: 10, quote: 3),
        MockTick(epoch: 11, quote: 4),
        MockTick(epoch: 12, quote: 3),
        MockTick(epoch: 13, quote: 2),
      ];

      const int period = 3;

      final CloseValueIndicator<MockResult> closePrice =
          CloseValueIndicator<MockResult>(MockInput(ticks));

      final CachedIndicator<MockResult> bbmSMA =
          SMAIndicator<MockResult>(closePrice, period);
      final StandardDeviationIndicator<MockResult> standardDeviation =
          StandardDeviationIndicator<MockResult>(closePrice, period);
      final BollingerBandsUpperIndicator<MockResult> bbuSMA =
          BollingerBandsUpperIndicator<MockResult>(bbmSMA, standardDeviation);

      expect(bbuSMA.k, 2);

      expect(bbuSMA.getValue(0).quote, 1);
      expect(bbuSMA.getValue(1).quote, 2.5);
      expect(roundDouble(bbuSMA.getValue(2).quote, 3), 3.633);
      expect(roundDouble(bbuSMA.getValue(3).quote, 3), 4.633);
      expect(roundDouble(bbuSMA.getValue(4).quote, 4), 4.2761);
      expect(roundDouble(bbuSMA.getValue(5).quote, 4), 4.6095);
      expect(roundDouble(bbuSMA.getValue(6).quote, 3), 5.633);
      expect(roundDouble(bbuSMA.getValue(7).quote, 4), 5.2761);
      expect(roundDouble(bbuSMA.getValue(8).quote, 3), 5.633);
      expect(roundDouble(bbuSMA.getValue(9).quote, 4), 4.2761);

      final BollingerBandsUpperIndicator<MockResult> bbuSMAwithK =
          BollingerBandsUpperIndicator<MockResult>(bbmSMA, standardDeviation,
              k: 1.5);

      expect(bbuSMAwithK.k, 1.5);

      expect(bbuSMAwithK.getValue(0).quote, 1);
      expect(bbuSMAwithK.getValue(1).quote, 2.25);
      expect(roundDouble(bbuSMAwithK.getValue(2).quote, 4), 3.2247);
      expect(roundDouble(bbuSMAwithK.getValue(3).quote, 4), 4.2247);
      expect(roundDouble(bbuSMAwithK.getValue(4).quote, 4), 4.0404);
      expect(roundDouble(bbuSMAwithK.getValue(5).quote, 4), 4.3738);
      expect(roundDouble(bbuSMAwithK.getValue(6).quote, 4), 5.2247);
      expect(roundDouble(bbuSMAwithK.getValue(7).quote, 4), 5.0404);
      expect(roundDouble(bbuSMAwithK.getValue(8).quote, 4), 5.2247);
      expect(roundDouble(bbuSMAwithK.getValue(9).quote, 4), 4.0404);
    });

    test('Bollinger Percent B calculates the correct result', () {
      final Indicator<MockResult> closePrice =
          CloseValueIndicator<MockResult>(MockInput(ticks));

      final PercentBIndicator<MockResult> pcb =
          PercentBIndicator<MockResult>(closePrice, 5);

      expect(pcb.getValue(0).quote.isNaN, isTrue);
      expect(roundDouble(pcb.getValue(1).quote, 2), 0.75);
      expect(roundDouble(pcb.getValue(2).quote, 4), 0.8244);
      expect(roundDouble(pcb.getValue(3).quote, 4), 0.6627);
      expect(roundDouble(pcb.getValue(4).quote, 4), 0.8517);
      expect(roundDouble(pcb.getValue(5).quote, 5), 0.90328);
      expect(roundDouble(pcb.getValue(6).quote, 2), 0.83);
      expect(roundDouble(pcb.getValue(7).quote, 4), 0.6552);
      expect(roundDouble(pcb.getValue(8).quote, 4), 0.5737);
      expect(roundDouble(pcb.getValue(9).quote, 4), 0.1047);
      expect(pcb.getValue(10).quote, 0.5);
      expect(roundDouble(pcb.getValue(11).quote, 4), 0.0284);
      expect(roundDouble(pcb.getValue(12).quote, 4), 0.0344);
      expect(roundDouble(pcb.getValue(13).quote, 4), 0.2064);
      expect(roundDouble(pcb.getValue(14).quote, 4), 0.1835);
      expect(roundDouble(pcb.getValue(15).quote, 4), 0.2131);
      expect(roundDouble(pcb.getValue(16).quote, 4), 0.3506);
      expect(roundDouble(pcb.getValue(17).quote, 4), 0.5737);
      expect(pcb.getValue(18).quote, 0.5);
      expect(roundDouble(pcb.getValue(19).quote, 4), 0.7673);
    });

    test(
        'Bollinger Percent B copyValuesFrom and refreshValueFor should works fine',
        () {
      final List<MockTick> ticks2 = ticks.toList();
      final CloseValueIndicator<MockResult> closeValueIndicator =
          CloseValueIndicator<MockResult>(MockInput(ticks2));

      // defining 1st indicator
      final PercentBIndicator<MockResult> pcb =
          PercentBIndicator<MockResult>(closeValueIndicator, 5);

      // defining 2nd indicator
      final PercentBIndicator<MockResult> pcb2 =
          PercentBIndicator<MockResult>(closeValueIndicator, 5);

      // Their result should be the same since input data is the same.
      expect(pcb2.getValue(19).quote, pcb.getValue(19).quote);
      expect(pcb2.getValue(18).quote, pcb.getValue(18).quote);

      // add new data to this list
      ticks2.add(const MockTick(epoch: 21, quote: 5));

      // Refreshing last value because we add new data
      pcb2.refreshValueFor(20);

      expect(roundDouble(pcb2.getValue(20).quote, 4), 0.0148);

      pcb.copyValuesFrom(pcb2);
      // Their result in index 19 should be the same since we've copied the result.
      expect(pcb.getValue(19).quote, pcb2.getValue(19).quote);
    });

    test(
        'Bollinger Percent B Indicator copyValuesFrom calculates correct result',
        () {
      // defining 1st indicator
      final PercentBIndicator<MockResult> indicator1 =
          PercentBIndicator<MockResult>(
              CloseValueIndicator<MockResult>(MockInput(ticks)), 5);

      // Checking the values of first indicator
      expect(indicator1.getValue(18).quote, 0.5);
      expect(roundDouble(indicator1.getValue(19).quote, 4), 0.7673);

      // define a new input Changing the last data
      final List<MockTick> ticks2 = ticks.toList()
        ..removeLast()
        ..add(const MockOHLC(19, 170.75, 160, 172.56, 160));

      // Defining 2nd indicator with the new updated data
      // Copying values of indicator1 into 2
      // Refreshing last value because its candle is changed
      final PercentBIndicator<MockResult> indicator2 =
          PercentBIndicator<MockResult>(
              CloseValueIndicator<MockResult>(MockInput(ticks2)), 5)
            ..copyValuesFrom(indicator1)
            ..refreshValueFor(19);

      // Their result in index 18 should be the same since we've copied the result.
      expect(indicator2.getValue(18).quote, indicator1.getValue(18).quote);

      // Calculated result for index 19 is different because the last data is changed.
      expect(roundDouble(indicator2.getValue(19).quote, 4), 1.0);
    });
  });
}
