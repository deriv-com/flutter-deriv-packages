import 'package:deriv_technical_analysis/deriv_technical_analysis.dart';
import 'package:deriv_technical_analysis/src/indicators/calculations/helper_indicators/mean_indicator.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mock_models.dart';

void main() {
  group('Mean indicator', () {
    test('Calculates the results correctly', () {
      const List<MockOHLC> ticks = <MockOHLC>[
        MockOHLC(0, 168.28, 169.64, 169.87, 167.15),
        MockOHLC(1, 168.84, 168.71, 169.36, 168.2),
        MockOHLC(2, 168.88, 167.74, 169.29, 166.41),
        MockOHLC(3, 168, 166.32, 168.38, 166.18),
        MockOHLC(4, 166.89, 167.24, 167.7, 166.33),
        MockOHLC(5, 165.25, 168.05, 168.43, 165),
        MockOHLC(6, 168.17, 169.92, 170.18, 167.63),
        MockOHLC(7, 170.42, 171.97, 172.15, 170.06),
      ];

      final IndicatorDataInput input = MockInput(ticks);
      final MeanIndicator<MockResult> mi = MeanIndicator<MockResult>(
        CloseValueIndicator<MockResult>(input),
        OpenValueIndicator<MockResult>(input),
      );

      expect(mi.getValue(1).quote, 168.775);
      expect(mi.getValue(2).quote, 168.31);
      expect(mi.getValue(3).quote, 167.16);
      expect(mi.getValue(4).quote, 167.065);
      expect(mi.getValue(5).quote, 166.65);
      expect(mi.getValue(6).quote, 169.045);
      expect(mi.getValue(7).quote, 171.195);
    });
  });
}
