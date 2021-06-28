import 'package:deriv_technical_analysis/src/indicators/calculations/commodity_channel_index_indicator.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mock_models.dart';

void main() {
  group('Commodity Channel Index indicator', () {
    group('CommodityChannelIndex indicator on tick data', () {
      late List<MockTick> ticks;
      setUp(() {
        ticks = const <MockTick>[
          MockTick(quote: 23.98),
          MockTick(quote: 23.92),
          MockTick(quote: 23.79),
          MockTick(quote: 23.67),
          MockTick(quote: 23.54),
          MockTick(quote: 23.36),
          MockTick(quote: 23.65),
          MockTick(quote: 23.72),
          MockTick(quote: 24.16),
          MockTick(quote: 23.91),
          MockTick(quote: 23.81),
          MockTick(quote: 23.92),
          MockTick(quote: 23.74),
          MockTick(quote: 24.68),
          MockTick(quote: 24.94),
          MockTick(quote: 24.93),
          MockTick(quote: 25.10),
          MockTick(quote: 25.12),
          MockTick(quote: 25.20),
          MockTick(quote: 25.06),
          MockTick(quote: 24.50),
          MockTick(quote: 24.31),
          MockTick(quote: 24.57),
          MockTick(quote: 24.62),
          MockTick(quote: 24.49),
          MockTick(quote: 24.37),
          MockTick(quote: 24.41),
          MockTick(quote: 24.35),
          MockTick(quote: 23.75),
          MockTick(quote: 24.09),
        ];
      });

      test('Commodity Channel Index calculates the correct result', () {
        final CommodityChannelIndexIndicator<MockResult> cci =
            CommodityChannelIndexIndicator<MockResult>(MockInput(ticks), 20);

        // Incomplete time frame
        expect(cci.getValue(0).quote, 0);
        expect(cci.getValue(1).quote, -66.66666666667062);
        expect(cci.getValue(2).quote, -100.000000000005);
        expect(cci.getValue(10).quote, 14.365001632386067);
        expect(cci.getValue(11).quote, 54.25442291491223);

        // Complete time frame
        expect(cci.getValue(19).quote, 101.91846522781749);
        expect(cci.getValue(20).quote, 31.19461183977306);
        expect(cci.getValue(21).quote, 6.557771560929368);
        expect(cci.getValue(22).quote, 33.607807258310565);
        expect(cci.getValue(23).quote, 34.9685534591193);
        expect(cci.getValue(24).quote, 13.602679930971021);
        expect(cci.getValue(25).quote, -10.678871090770443);
        expect(cci.getValue(26).quote, -11.470985155195915);
        expect(cci.getValue(27).quote, -29.256660705277692);
        expect(cci.getValue(28).quote, -128.60001740189702);
        expect(cci.getValue(29).quote, -72.72727272727296);
      });
    });

    group('Commodity Channel Index Indicator on OHLC data', () {
      late List<MockTick> ticks;

      setUpAll(() {
        ticks = const <MockOHLC>[
          MockOHLC.withNames(
              epoch: 1, open: 0, close: 64.75, low: 63.6, high: 65),
          MockOHLC.withNames(
              epoch: 2, open: 0, close: 65.79, low: 63.6, high: 68),
          MockOHLC.withNames(
              epoch: 3, open: 0, close: 64.73, low: 63.2, high: 65),
          MockOHLC.withNames(
              epoch: 4, open: 0, close: 64.73, low: 63.6, high: 67.1),
          MockOHLC.withNames(
              epoch: 5, open: 0, close: 65.55, low: 64.2, high: 66.3),
          MockOHLC.withNames(
              epoch: 6, open: 0, close: 66.59, low: 63.6, high: 65),
          MockOHLC.withNames(
              epoch: 7, open: 0, close: 63.61, low: 62.5, high: 65),
          MockOHLC.withNames(
              epoch: 8, open: 0, close: 63.65, low: 62.6, high: 65),
          MockOHLC.withNames(
              epoch: 9, open: 0, close: 62.15, low: 61, high: 65),
          MockOHLC.withNames(
              epoch: 10, open: 0, close: 63.37, low: 60.6, high: 65),
          MockOHLC.withNames(
              epoch: 11, open: 0, close: 61.33, low: 60, high: 65),
          MockOHLC.withNames(
              epoch: 12, open: 0, close: 62.51, low: 61.8, high: 65.9),
        ];
      });

      test('CommodityChannelIndexIndicator calculates the correct results', () {
        final CommodityChannelIndexIndicator<MockResult> cci =
            CommodityChannelIndexIndicator<MockResult>(MockInput(ticks), 5);

        // Incomplete time frame
        expect(cci.getValue(0).quote, 0);
        expect(cci.getValue(1).quote, 66.66666666666666);
        expect(cci.getValue(2).quote, -57.411764705882405);
        expect(cci.getValue(3).quote, 26.707441386340605);

        // Complete time frame
        expect(cci.getValue(4).quote, 44.9735449735455);
        expect(cci.getValue(5).quote, -12.954658694568865);
        expect(cci.getValue(6).quote, -119.07005969211349);
        expect(cci.getValue(7).quote, -81.1119573495816);
        expect(cci.getValue(8).quote, -107.03363914373116);
        expect(cci.getValue(9).quote, -68.94130862117436);
        expect(cci.getValue(10).quote, -116.94747274529358);
      });
    });
  });
}
