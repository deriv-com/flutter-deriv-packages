/// A data class for exchange rate.
class ExchangeRateModel {
  /// A data class for exchange rate.
  ExchangeRateModel({
    required this.baseCurrency,
    required this.targetCurrency,
    required this.exchangeRate,
  });

  /// This currency denotes the main currency we are exchanging from.
  final String baseCurrency;

  /// This currency denotes the targetted currency we are exchanging to.
  final String targetCurrency;

  /// This is the current exchange rate. The unit of this amount is [targetCurrency].
  final double exchangeRate;
}
