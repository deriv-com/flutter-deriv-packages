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


/// Checks the text value to be empty or equal (-)
bool hasNoValue(String? text) => text == '-' || text == null || text.isEmpty;



/// Returns `2` as currency fractional digit if the fractional digit is null or zero.
int getCurrencyFractionalDigits(int? fractionalDigits) =>
    (fractionalDigits == null || fractionalDigits == 0) ? 2 : fractionalDigits;
