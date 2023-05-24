import 'package:decimal/decimal.dart';

/// Checks if the string value is an actual number value.
///
/// Returns a bool value as the result.
bool isNumber(String? value) {
  final String? replacedValue = value?.replaceAll(RegExp(r','), '');

  return replacedValue != null && double.tryParse(replacedValue) != null;
}

/// Checks if the value is in the range of two limits.
bool isBetweenLimits({
  required String value,
  required double upperLimit,
  required double lowerLimit,
}) {
  final double? parsedValue = double.tryParse(value);

  return parsedValue != null &&
      (parsedValue <= upperLimit) &&
      (parsedValue >= lowerLimit);
}

/// Checks if the [value] is equal or less than the [upperLimit] value.
bool isLessOrEqualLimit({required String value, required double upperLimit}) {
  final double? parsedValue = double.tryParse(value);

  return parsedValue != null && parsedValue <= upperLimit;
}

/// Checks if the [value] is equal or less than the [lowerLimit] value.
bool isMoreOrEqualLimit({required String value, required double lowerLimit}) {
  final double? parsedValue = double.tryParse(value);

  return parsedValue != null && parsedValue >= lowerLimit;
}

/// Checks if the [value] is bigger than `0` or not.
bool isPositive(String value) {
  final double? num = double.tryParse(value);

  return num != null && num > 0;
}

/// Checks if the number has correct number of [validDecimalNumber].
bool hasValidPrecision({
  required String value,
  required int validDecimalNumber,
}) {
  final List<String> splitValue = value.split('.');

  if (splitValue.length == 2) {
    return splitValue[1].length <= validDecimalNumber;
  }

  return splitValue.length == 1;
}

/// Returns the number value as a string without its currency symbol.
String? getAmountWithoutSymbol(String amount) {
  try {
    late int firstNumberIndex;
    for (int i = 0; i < amount.length; i++) {
      final String character = amount[i];
      if (isNumber(character)) {
        firstNumberIndex = i;
        break;
      }
    }

    return amount.substring(firstNumberIndex);
  } on NoSuchMethodError {
    return null;
  }
}

/// Checks the text value to be `empty` or `-`.
bool hasNoValue(String? text) => text == null || text.isEmpty || text == '-';

/// Parses string to number, returns `null` for invalid input.
double? getNumberFromString(String? value) => double.tryParse(value ?? '');

/// Adds `-` or `+` prefix to number.
String addSignPrefix({required double value, int fixedPoint = 0}) =>
    '${value > 0 ? '+' : ''}${value.toStringAsFixed(fixedPoint)}';

/// Gets the length of fractional digits of a passed [number].
int getFractionalDigitsLength(num number) {
  final String value = '${Decimal.parse('$number')}';

  return value.contains('.') ? value.split('.').last.length : 0;
}

/// Checks the double value whether it have Zeros as decimal number.
bool hasZeroAsDecimal(double number) => number % 1 == 0;

/// Returns `2` as currency fractional digit if the fractional digit is null or zero.
int getCurrencyFractionalDigits(int? fractionalDigits) =>
    (fractionalDigits == null || fractionalDigits == 0) ? 2 : fractionalDigits;
