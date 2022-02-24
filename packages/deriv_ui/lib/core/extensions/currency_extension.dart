import 'package:intl/intl.dart';

import 'package:flutter_multipliers/core/helpers/helpers.dart';

/// Extension methods for currency num values.
extension CurrencyExtension on num? {
  /// Formats the number value based on the [currency] using [websiteStatus]
  String formatAccountCurrency({
    String? currency,
    bool showSymbol = true,
  }) =>
      this == null || websiteStatus == null || currency == null
          ? ''
          : getAccountCurrencyFormat(
              currency: currency,
              showSymbol: showSymbol,
            ).format(this);
}

/// Extension for receiving the mapped currency names from [NumberFormat]
extension NumberFormatExtension on NumberFormat {
  /// [NumberFormat] mapped currency to makes it compatible with some currency
  /// exceptions
  String get mappedCurrencyName =>
      getStringWithMappedCurrencyName(currencyName!);
}
