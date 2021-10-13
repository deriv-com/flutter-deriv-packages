import 'package:deriv_technical_analysis/deriv_technical_analysis.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mock_models.dart';

void main() {
  group('Stochastic Momentum Index', () {
    test('Calculates the correct results', () {
      // Data from app.deriv.com:
      const List<MockOHLC> ticks = <MockOHLC>[
        MockOHLC(0, 908.677, 908.771, 908.808, 908.632),
        MockOHLC(1, 908.755, 908.736, 908.786, 908.678),
        MockOHLC(2, 908.714, 908.935, 908.935, 908.611),
        MockOHLC(3, 908.980, 909.213, 909.213, 908.946),
        MockOHLC(4, 909.256, 909.344, 909.366, 909.140),
        MockOHLC(5, 909.335, 909.327, 909.382, 909.258),
        MockOHLC(6, 909.319, 909.401, 909.502, 909.307),
        MockOHLC(7, 909.415, 909.348, 909.460, 909.294),
        MockOHLC(8, 909.347, 909.365, 909.422, 909.300),
        MockOHLC(9, 909.357, 909.250, 909.472, 909.211),
        MockOHLC(10, 909.256, 909.191, 909.292, 909.179),
        MockOHLC(11, 909.206, 909.205, 909.219, 909.061),
        MockOHLC(12, 909.198, 909.173, 909.200, 909.053),
        MockOHLC(13, 909.156, 909.120, 909.168, 909.009),
        MockOHLC(14, 909.127, 909.200, 909.224, 909.025),
        MockOHLC(15, 909.206, 909.321, 909.336, 909.163),
        MockOHLC(16, 909.305, 909.242, 909.350, 909.223),
        MockOHLC(17, 909.223, 908.869, 909.223, 908.837),
        MockOHLC(18, 908.864, 908.885, 909.001, 908.836),
        MockOHLC(19, 908.869, 908.923, 908.961, 908.820),
        MockOHLC(20, 908.927, 908.879, 908.946, 908.768),
        MockOHLC(21, 908.873, 909.059, 909.060, 908.873),
        MockOHLC(22, 909.056, 909.032, 909.131, 908.983),
        MockOHLC(23, 909.027, 908.756, 909.030, 908.756),
        MockOHLC(24, 908.746, 908.865, 908.872, 908.703),
        MockOHLC(25, 908.863, 908.948, 909.005, 908.863),
        MockOHLC(26, 908.944, 908.792, 908.951, 908.775),
        MockOHLC(27, 908.790, 908.632, 908.790, 908.595),
        MockOHLC(28, 908.631, 908.908, 908.947, 908.631),
        MockOHLC(29, 908.901, 908.944, 908.945, 908.762),
        MockOHLC(30, 908.941, 909.018, 909.143, 908.937),
        MockOHLC(31, 909.016, 909.001, 909.079, 908.875),
        MockOHLC(32, 908.990, 908.829, 908.995, 908.703),
        MockOHLC(33, 908.820, 908.829, 908.866, 908.655),
        MockOHLC(34, 908.823, 908.790, 908.823, 908.657),
        MockOHLC(35, 908.818, 908.910, 908.910, 908.803),
      ];

      final SMIIndicator<MockResult> smi = SMIIndicator<MockResult>(
        MockInput(ticks),
        period: 5,
      );

      // Comparing Results with app.deriv.com
      expect(smi.getValue(17).quote, closeTo(-12.020, 0.0009));
      expect(smi.getValue(18).quote, closeTo(-39.023, 0.0009));
      expect(smi.getValue(19).quote, closeTo(-50.981, 0.0009));
      expect(smi.getValue(20).quote, closeTo(-56.682, 0.0009));
      expect(smi.getValue(21).quote, closeTo(-38.789, 0.0009));
      expect(smi.getValue(22).quote, closeTo(-17.535, 0.0009));
      expect(smi.getValue(23).quote, closeTo(-29.213, 0.0009));
      expect(smi.getValue(24).quote, closeTo(-31.175, 0.0009));
      expect(smi.getValue(25).quote, closeTo(-20.135, 0.0009));
      expect(smi.getValue(26).quote, closeTo(-27.028, 0.0009));
      expect(smi.getValue(27).quote, closeTo(-42.989, 0.0009));
      expect(smi.getValue(28).quote, closeTo(-23.828, 0.0009));
      expect(smi.getValue(29).quote, closeTo(4.052, 0.0009));
      expect(smi.getValue(30).quote, closeTo(25.915, 0.0009));
      expect(smi.getValue(31).quote, closeTo(36.984, 0.0009));
      expect(smi.getValue(32).quote, closeTo(24.156, 0.0009));
      expect(smi.getValue(33).quote, closeTo(8.145, 0.0009));
    });
  });
}
