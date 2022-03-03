import 'package:intl/intl.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/helpers/number_helper.dart';


/// Creates NumberFormat.
NumberFormat getValueFormatter({
  required int decimalDigits,
  String locale = 'en_US',
  String? currency = 'USD',
  bool showSymbol = true,
}) {
  final NumberFormat formatter = NumberFormat.currency(
    decimalDigits: decimalDigits,
    locale: locale,
    name: currency,
    symbol: (showSymbol && currency != null)
        ? NumberFormat().simpleCurrencySymbol(currency)
        : '',
  );

  return formatter;
}

/// Returns formatted value based on [currency] and [decimalDigits].
///
/// [showSymbol]: if true, displays currency symbol.
/// [showCurrency] if true, displays currency name.
String? getFormattedValue({
  double? value,
  int? decimalDigits,
  String? currency,
  bool showSymbol = true,
  bool showCurrency = false,
}) =>
    value == null
        ? null
        : '${getValueFormatter(
            decimalDigits: decimalDigits ?? getDecimalDigits('$value'),
            currency: currency,
            showSymbol: showSymbol,
          ).format(value)} ${showCurrency ? currency : ''}';


/// Map currency names for some currency exceptions in [value] parameter.
String getStringWithMappedCurrencyName(String value) =>
    value.contains(RegExp('ust', caseSensitive: false))
        ? value.replaceAll(RegExp(r'ust', caseSensitive: false), 'USDT')
        : value;

