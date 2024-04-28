import 'package:intl/intl.dart';

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
  static List<String> fiatCurrencies = <String>[
    'USD',
    'AUD',
    'EUR',
    'GBP',
  ];

  /// Available stable coin currency that Deriv supports.
  static List<String> stableCryptoCurrencies = <String>[
    'USDC',
    'USDT',
    'TUSDT',
    'EUSDT'
  ];

  /// Amount passed for exchance.
  final double amount;

  /// Type of the currency whether be it crypto or fiat. Eg: USD,BTC,ETH,AUD and so on.
  final String currencyType;

  /// This will check if this instance is a fiat type currency or not.
  bool get isFiat => fiatCurrencies.contains(currencyType);

  /// This will check if the currency is stable coin currency(USDC,tUSDT,eUSDT) or not.
  bool get isStableCryptoCurrency =>
      stableCryptoCurrencies.contains(currencyType.toUpperCase());

  /// This will give the formatted amount to do processing based on type of currency it is like fiat or crypto currency.
  double get formattedAmount => double.parse(formatter.format(amount));

  /// Amount that is used to display for user.
  String get displayAmount {
    if (amount == 0.0) {
      return '';
    }

    return isFiat || isStableCryptoCurrency
        ? amount.toStringAsFixed(2)
        : amount.toStringAsFixed(8);
  }

  /// This will give a specific currency formatter based on what type of currency it is like fiat or crypto currency.
  NumberFormat get formatter {
    if (isFiat || isStableCryptoCurrency) {
      return NumberFormat('#0.##', 'en_US');
    } else {
      return NumberFormat('#0.########', 'en_US');
    }
  }

  /// This method is used to display currency for user.
  String get displayCurrency => getStringWithMappedCurrencyName(currencyType);
}
