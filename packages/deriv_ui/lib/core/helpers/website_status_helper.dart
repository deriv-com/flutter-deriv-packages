/// Map currency names for some currency exceptions in [value] parameter.
String getStringWithMappedCurrencyName(String value) =>
    value.contains(RegExp('ust', caseSensitive: false))
        ? value.replaceAll(RegExp(r'ust', caseSensitive: false), 'USDT')
        : value;
