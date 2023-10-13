import '../models/data_input.dart';
import '../models/models.dart';

/// Base class of all indicators.
///
/// Holds common functionalities of indicators like getting epoch for an index or handling indicator's offset.
abstract class Indicator<T extends IndicatorResult> {
  /// Initializes
  Indicator(this.input);

  /// [IndicatorDataInput] to calculate indicator values on.
  final IndicatorDataInput input;

  /// The entries of the [input]
  List<IndicatorOHLC> get entries => input.entries;

  /// Value of the indicator for the given [index].
  T getValue(int index);

  /// Creates a [IndicatorResult] entry.
  ///
  /// Uses [IndicatorDataInput.createResult].
  /// An implementation of [IndicatorDataInput] should be passed to this class to create
  /// the desired [T] result.
  T createResult({
    required double quote,
    required int index,
  }) =>
      input.createResult(index, quote) as T;
}
