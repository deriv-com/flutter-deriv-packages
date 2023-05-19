import 'package:flutter/services.dart';

/// Creates a [TextInputFormatter] that formats text as a hyphened date.
class DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final String formattedText = _getHyphenedDate(newValue.text);
    return newValue.copyWith(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }

  /// Converts the input to hyphened date format.
  /// Example: 01012021 -> 01-01-2021
  String _getHyphenedDate(String input) {
    String numericInput = _removeNonNumericChar(input);

    if (numericInput.length > 2) {
      numericInput =
          '${numericInput.substring(0, 2)}-${numericInput.substring(2)}';
    }
    if (numericInput.length > 5) {
      numericInput =
          '${numericInput.substring(0, 5)}-${numericInput.substring(5)}';
    }

    return numericInput;
  }

  /// Removes all non-numeric characters from the input.
  String _removeNonNumericChar(String input) =>
      input.replaceAll(RegExp('[^0-9]'), '');
}
