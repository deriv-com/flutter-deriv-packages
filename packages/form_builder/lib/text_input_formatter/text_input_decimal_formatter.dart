part of './text_input_formatter.dart';

/// This class will format the text field value and only allow the user to input
/// a decimal number with the give number of decimal places.
class TextInputDecimalFormatter extends TextInputFormatter {
  /// Constructs a new TextInputDecimalFormatter with the give fraction digits.
  TextInputDecimalFormatter({
    this.fractionDigits = 2,
    this.withSign = false,
  });

  /// The number of allowed fraction digits.
  final int fractionDigits;

  /// Whether to allow the user to input a sign before the number.
  final bool withSign;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final bool isEmpty = newValue.text.isEmpty;

    // The field has been cleared, So we return the new value.
    if (isEmpty) {
      return newValue;
    }

    final String text = withSign
        ? newValue.text
        : newValue.text.replaceAll(RegExp(r'[+-]'), '');
    final List<String> inputs = text.split('.');

    // The field contains more than one dot, So we return the old value as only
    // one dot is allowed.
    if (inputs.length > 2) {
      return oldValue;
    }

    String left = inputs.first;
    final String? right = inputs.length > 1 ? inputs[1] : null;
    final bool hasRight = right != null && right.isNotEmpty;

    // The field value is positive or negative sign, So we return the new value
    // without any calculations.
    if ((left == '-' || left == '+') && !hasRight) {
      return newValue;
    }

    // The field value is 0, So we return the new value without any
    // calculations.
    if (left == '0' && !hasRight) {
      return newValue;
    }

    final bool isNumber = num.tryParse(newValue.text) != null;

    // The input value is not a valid number, So we return the old
    // value.
    if (!isNumber) {
      return oldValue;
    }

    left = left.replaceAll(RegExp(r'[+-]'), '');
    final bool hasDecimal = newValue.text.contains('.');

    // The field starts with 0 but doesn't have decimal point, So we
    // return the old value as the only valid input at this step is
    // decimal point.
    if (left.startsWith('0') && left.length != 1 && !hasDecimal) {
      return oldValue;
    }

    // The field have a decimal point and decimal places are already
    // as allowed fraction digits, So we return the old value.
    if (hasRight && right.length > fractionDigits) {
      return oldValue;
    }

    return newValue;
  }
}
