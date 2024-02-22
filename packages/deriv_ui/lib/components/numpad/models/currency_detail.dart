import '../core/helpers/custom_website_status_helper.dart';

/// This is a data class for storing the currency data like amount, currencyType.
class CurrencyDetail {
  /// Data class for currency.Here,
  ///
  /// [amount] - amount in this currency.
  ///
  /// [currencyType] - type of currency like: 'USD','AUD',BTC,'ETH' and so on.
  CurrencyDetail(this.amount, this.currencyType);

  /// Available fiat currency that Deriv supports.
  static List<String> fiatCurrencies = <String>['USD', 'AUD', 'EUR', 'GBP'];

  /// Amount passed for exchance.
  final double amount;

  /// Type of the currency whether be it crypto or fiat. Eg: USD,BTC,ETH,AUD and so on.
  final String currencyType;

  /// This will check if this instance is a fiat type currency or not.
  bool get isFiat => fiatCurrencies.contains(currencyType);

  /// Amount that is used to display for user.
  String get displayAmount {
    if (amount == 0.0) {
      return '';
    }

    return isFiat ? amount.toStringAsFixed(2) : amount.toStringAsFixed(8);
  }

  /// This method is used to display currency for user.
  String get displayCurrency => getStringWithMappedCurrencyName(currencyType);
}
