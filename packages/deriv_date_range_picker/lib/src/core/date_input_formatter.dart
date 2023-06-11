import 'dart:math';

import 'package:flutter/services.dart';

/// Creates a [TextInputFormatter] that formats text as a hyphened date.
class DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final String hyphenedDate = _getHyphenedDate(newValue.text, oldValue.text);

    return newValue.copyWith(
        text: hyphenedDate,
        selection: TextSelection.fromPosition(
          _getUpdatedCursorPosition(
            oldValue,
            hyphenedDate,
          ),
        ));
  }

  /// Converts the input to hyphened date format.
  /// Example: 01012021 -> 01-01-2021
  String _getHyphenedDate(String newValue, String oldValue) {
    const String _separator = '-';
    const int _maxChars = 10;

    final bool _isErasing = newValue.length < oldValue.length;
    final bool _isComplete = newValue.length > _maxChars;

    if (!_isErasing && _isComplete) {
      return oldValue;
    }

    final String numericValue = _removeNonNumericChar(newValue);
    final List<String> result = <String>[];

    for (int i = 0; i < numericValue.length; i++) {
      result.add(numericValue[i]);

      if ((i == 1 || i == 3) && i != numericValue.length - 1) {
        result.add(_separator);
      }
    }

    return result.join();
  }

  /// Removes all non-numeric characters from the input.
  String _removeNonNumericChar(String input) =>
      input.replaceAll(RegExp(r'[^0-9]+'), '');

  /// Calculates the updated cursor position based on the changes made during formatting.
  TextPosition _getUpdatedCursorPosition(
    TextEditingValue oldValue,
    String text,
  ) {
    final int endOffset = max(
      oldValue.text.length - oldValue.selection.end,
      0,
    );

    final int selectionEnd = text.length - endOffset;

    return TextPosition(offset: selectionEnd);
  }
}
