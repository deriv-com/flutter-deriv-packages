import 'package:flutter/services.dart';

class DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String formattedText = _formatInput(newValue.text);
    return newValue.copyWith(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }

  String _formatInput(String input) {
    input =
        input.replaceAll(RegExp('[^0-9]'), ''); // remove non-numeric characters
    if (input.length > 2) {
      input = '${input.substring(0, 2)}-${input.substring(2)}';
    }
    if (input.length > 5) {
      input = '${input.substring(0, 5)}-${input.substring(5)}';
    }
    return input;
  }
}
