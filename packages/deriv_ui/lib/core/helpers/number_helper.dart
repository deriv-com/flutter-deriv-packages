import 'package:decimal/decimal.dart';

/// Checks if the string value is an actual number value.
///
/// Returns a bool value as the result.
bool isNumber(String? stringValue) {
  final String? replacedValue = stringValue?.replaceAll(RegExp(r','), '');

  return replacedValue != null && double.tryParse(replacedValue) != null;
}

/// Checks if the value is in the range of two limits.
bool isBetweenLimits({
  required String stringValue,
  required double upperLimit,
  required double lowerLimit,
}) {
  final double? numberValue = double.tryParse(stringValue);

  return numberValue != null &&
      (numberValue <= upperLimit) &&
      (numberValue >= lowerLimit);
}

/// Checks if the [stringValue] is equal or less than the [upperLimit] value.
bool isLessOrEqualLimit({
  required String stringValue,
  required double upperLimit,
}) {
  final double? numberValue = double.tryParse(stringValue);

  return numberValue != null && numberValue <= upperLimit;
}

/// Checks if the [stringValue] is equal or less than the [lowerLimit] value.
bool isMoreOrEqualLimit({
  required String stringValue,
  required double lowerLimit,
}) {
  final double? numberValue = double.tryParse(stringValue);

  return numberValue != null && numberValue >= lowerLimit;
}

/// Checks if the [stringValue] is bigger than 0 or not
bool isPositive(String stringValue) {
  final double? num = double.tryParse(stringValue);

  return num != null && num > 0;
}

/// Checks if the number has correct number of [validDecimalNumber].
bool hasValidPrecision({
  required String stringValue,
  required int validDecimalNumber,
}) {
  final List<String> splitValue = stringValue.split('.');
  if (splitValue.length == 2) {
    return splitValue[1].length <= validDecimalNumber;
  }
  return splitValue.length == 1;
}

/// Returns the number value as a string without its currency symbol
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

/// Checks the text value to be empty or equal (-)
bool hasNoValue(String? text) => text == '-' || text == null || text.isEmpty;

/// Parses string to number, returns `null` for invalid input.
double? getNumberFromString(String? value) => double.tryParse(value ?? '');

/// Adds `-` or `+` prefix to number.
String addSignPrefix({
  required double value,
  int fixedPoint = 0,
}) =>
    '${value > 0 ? '+' : ''}${value.toStringAsFixed(fixedPoint)}';

/// Gets the length of fractional digits of a passed [number].
int getFractionalDigitsLength(num number) {
  final String stringValue = '${Decimal.parse('$number')}';

  return stringValue.contains('.') ? stringValue.split('.').last.length : 0;
}

/// Checks the double value whether it have Zeros as decimal number.
bool hasZeroAsDecimal(double number) => number % 1 == 0;

/// Returns `2` as currency fractional digit if the fractional digit is null or zero.
int getCurrencyFractionalDigits(int? fractionalDigits) =>
    (fractionalDigits == null || fractionalDigits == 0) ? 2 : fractionalDigits;
