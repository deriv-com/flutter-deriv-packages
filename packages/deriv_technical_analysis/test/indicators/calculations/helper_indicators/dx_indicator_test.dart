import 'package:deriv_technical_analysis/src/helpers/functions.dart';
import 'package:deriv_technical_analysis/src/indicators/calculations/helper_indicators/dx_indicator.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mock_models.dart';

void main() {
  late List<MockTick> ticks;

  setUpAll(() {
    ticks = const <MockTick>[
      MockOHLC(00, 44.52, 44.52, 44.53, 43.98),
      MockOHLC(01, 44.65, 44.65, 44.93, 44.36),
      MockOHLC(02, 45.22, 45.22, 45.39, 44.70),
      MockOHLC(03, 45.45, 45.45, 45.70, 45.13),
      MockOHLC(04, 45.49, 45.49, 45.63, 44.89),
      MockOHLC(05, 44.24, 44.24, 45.52, 44.20),
      MockOHLC(06, 44.62, 44.62, 44.71, 44),
      MockOHLC(07, 45.15, 45.15, 45.15, 43.76),
      MockOHLC(08, 44.54, 44.54, 45.65, 44.46),
      MockOHLC(09, 45.66, 45.66, 45.87, 45.13),
      MockOHLC(10, 45.95, 45.95, 45.99, 45.27),
      MockOHLC(11, 46.33, 46.33, 46.35, 45.80),
      MockOHLC(12, 46.31, 46.31, 46.61, 46.10),
      MockOHLC(13, 45.94, 45.94, 46.47, 45.77),
      MockOHLC(14, 45.60, 45.60, 46.30, 45.14),
      MockOHLC(15, 45.70, 45.70, 45.98, 44.97),
      MockOHLC(16, 46.56, 46.56, 46.68, 46.10),
      MockOHLC(17, 46.36, 46.36, 46.59, 46.14),
      MockOHLC(18, 46.83, 46.83, 46.88, 46.39),
      MockOHLC(19, 46.72, 46.72, 46.81, 46.41),
      MockOHLC(20, 46.65, 46.65, 46.74, 45.94),
      MockOHLC(21, 46.97, 46.97, 47.08, 46.68),
      MockOHLC(22, 46.56, 46.56, 46.64, 46.17),
      MockOHLC(23, 45.29, 45.29, 45.81, 45.10),
      MockOHLC(24, 44.94, 44.94, 45.13, 44.35),
      MockOHLC(25, 44.62, 44.62, 44.96, 44.61),
      MockOHLC(26, 44.70, 44.70, 45.01, 44.20),
      MockOHLC(27, 45.27, 45.27, 45.67, 44.93),
      MockOHLC(28, 45.44, 45.44, 45.71, 45.01),
      MockOHLC(29, 44.76, 44.76, 45.35, 44.46),
    ];
  });

  group('DX Indicator test.', () {
    test(
        'DX Indicator should calculate the correct results from the given ticks',
        () {
      final DXIndicator<MockResult> dxIndicator =
          DXIndicator<MockResult>(MockInput(ticks));

      expect(roundDouble(dxIndicator.getValue(14).quote, 2), 8.99);
      expect(roundDouble(dxIndicator.getValue(29).quote, 2), 28.13);
    });
  });
}
