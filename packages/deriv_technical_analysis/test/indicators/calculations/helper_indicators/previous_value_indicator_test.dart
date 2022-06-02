import 'package:deriv_technical_analysis/deriv_technical_analysis.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mock_models.dart';

void main() {
  late List<MockTick> ticks;

  setUpAll(() {
    ticks = const <MockTick>[
      MockOHLC(00, 47.79, 48.16, 48.70, 47.79),
      MockOHLC(01, 48.14, 48.61, 48.72, 48.14),
      MockOHLC(02, 48.39, 48.75, 48.90, 48.39),
      MockOHLC(03, 48.37, 48.63, 48.87, 48.37),
      MockOHLC(04, 48.24, 48.74, 48.82, 48.24),
      MockOHLC(05, 48.64, 49.03, 49.05, 48.64),
      MockOHLC(06, 48.94, 49.07, 49.20, 48.94),
      MockOHLC(07, 48.86, 49.32, 49.35, 48.86),
      MockOHLC(08, 49.50, 49.91, 49.92, 49.50),
      MockOHLC(09, 49.87, 50.13, 50.19, 49.87),
      MockOHLC(10, 49.20, 49.53, 50.12, 49.20),
      MockOHLC(11, 48.90, 49.50, 49.66, 48.90),
      MockOHLC(12, 49.43, 49.75, 49.88, 49.43),
      MockOHLC(13, 49.73, 50.03, 50.19, 49.73),
      MockOHLC(14, 49.26, 50.31, 50.36, 49.26),
      MockOHLC(15, 50.09, 50.52, 50.57, 50.09),
      MockOHLC(16, 50.30, 50.41, 50.65, 50.30),
      MockOHLC(17, 49.21, 49.34, 50.43, 49.21),
      MockOHLC(18, 48.98, 49.37, 49.63, 48.98),
      MockOHLC(19, 49.61, 50.23, 50.33, 49.61),
      MockOHLC(20, 49.20, 49.24, 50.29, 49.20),
      MockOHLC(21, 49.43, 49.93, 50.17, 49.43),
      MockOHLC(22, 48.08, 48.43, 49.32, 48.08),
      MockOHLC(23, 47.64, 48.18, 48.50, 47.64),
      MockOHLC(24, 41.55, 46.57, 48.32, 41.55),
      MockOHLC(25, 44.28, 45.41, 46.80, 44.28),
      MockOHLC(26, 47.31, 47.77, 47.80, 47.31),
      MockOHLC(27, 47.20, 47.72, 48.39, 47.20),
      MockOHLC(28, 47.90, 48.62, 48.66, 47.90),
      MockOHLC(29, 47.73, 47.85, 48.79, 47.73),
    ];
  });

  group('Previous Value Indicator test', () {
    test(
        'Previous Value Indicator should calculate the correct result from the given ticks and period.',
        () {
      final CloseValueIndicator<MockResult> closeValueIndicator =
          CloseValueIndicator<MockResult>(MockInput(ticks));
      final PreviousValueIndicator<MockResult> previousValueIndicator =
          PreviousValueIndicator<MockResult>.fromIndicator(closeValueIndicator,
              period: 10);

      expect(previousValueIndicator.getValue(8).quote, 48.16);
      expect(previousValueIndicator.getValue(29).quote, 50.23);
      expect(previousValueIndicator.getValue(28).quote, 49.37);
      expect(previousValueIndicator.getValue(27).quote, 49.34);
      expect(previousValueIndicator.getValue(26).quote, 50.41);
    });
  });
}
