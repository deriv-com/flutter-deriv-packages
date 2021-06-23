import 'package:deriv_technical_analysis/deriv_technical_analysis.dart';
import 'package:deriv_technical_analysis/src/indicators/calculations/cmo_indicator.dart';

/// Vidya Moving Average Indicator.
class VIDYAIndicator<T extends IndicatorResult> extends CachedIndicator<T> {
  /// Initializes
  VIDYAIndicator(this.indicator, this.period)
      : _cmo = CMOIndicator<T>(indicator, 2),
        _f = 2 / (period + 1),
        super.fromIndicator(indicator);

  final CMOIndicator<T> _cmo;

  /// Input indicator to calculate Vidya on.
  final Indicator<T> indicator;

  final double _f;

  /// The period
  final int period;

  // Pricei x F x ABS(CMOi) + VIDYAi-1 x (1 - F x ABS(CMOi))
  @override
  T calculate(int index) {
    double result;
    if (index <= 0) {
      result = 0;
    } else {
      final double cmo = _cmo.getValue(index).quote.abs();
      final double alpha = 2 / (period + 1);
      final double prev = getValue(index - 1).quote;
      final double src = indicator.getValue(index).quote;

      result = src * alpha * cmo + prev * (1 - alpha * cmo);
    }
    return createResult(index: index, quote: result);
  }
}

// /// Vidya Moving Average Indicator.
// class VIDYAIndicator<T extends IndicatorResult> extends CachedIndicator<T> {
//   /// Initializes
//   VIDYAIndicator(this.indicator, this.period)
//       : _sd9 = StandardDeviationIndicator<T>(indicator, 9),
//         _sd30 = StandardDeviationIndicator<T>(indicator, period),
//         super.fromIndicator(indicator);
//
//   final StandardDeviationIndicator<T> _sd9;
//   final StandardDeviationIndicator<T> _sd30;
//
//   /// Input indicator to calculate Vidya on.
//   final Indicator<T> indicator;
//
//   /// The period
//   final int period;
//
//   // Pricei x F x ABS(CMOi) + VIDYAi-1 x (1 - F x ABS(CMOi))
//   @override
//   T calculate(int index) {
//     double result;
//     if (index <= 0) {
//       result = indicator.getValue(index).quote;
//     } else {
//       final double alpha =
//           0.2 * (_sd9.getValue(index).quote / _sd30.getValue(index).quote);
//       result = alpha * indicator.getValue(index).quote +
//           (1 - alpha) * getValue(index - 1).quote;
//     }
//     return createResult(index: index, quote: result);
//   }
// }
