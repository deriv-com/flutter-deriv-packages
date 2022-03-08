import 'package:intl/intl.dart';

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

/// Map currency names for some currency exceptions in [value] parameter.
String getStringWithMappedCurrencyName(String value) =>
    value.contains(RegExp('ust', caseSensitive: false))
        ? value.replaceAll(RegExp(r'ust', caseSensitive: false), 'USDT')
        : value;

