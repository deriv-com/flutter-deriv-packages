import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DateInputFormatter', () {
    late DateInputFormatter formatter;

    setUp(() {
      formatter = DateInputFormatter();
    });

    test('should format text as a hyphened date', () {
      const TextEditingValue oldValue = TextEditingValue(text: '01012021');
      const TextEditingValue newValue = TextEditingValue(text: '01012021');
      final TextEditingValue updatedValue =
          formatter.formatEditUpdate(oldValue, newValue);

      expect(updatedValue.text, '01-01-2021');
    });

    test('should remove non-numeric characters', () {
      const TextEditingValue oldValue = TextEditingValue(text: '01-01-2021');
      const TextEditingValue newValue = TextEditingValue(
        text: '01a&01-2021x',
        selection: TextSelection.collapsed(offset: 14),
      );

      final TextEditingValue formattedValue =
          formatter.formatEditUpdate(oldValue, newValue);

      expect(formattedValue.text, '01-01-2021');
    });

    test('should preserve cursor position', () {
      const TextEditingValue oldValue = TextEditingValue(
          text: '01012021', selection: TextSelection.collapsed(offset: 4));
      const TextEditingValue newValue = TextEditingValue(text: '01012021');
      final TextEditingValue updatedValue =
          formatter.formatEditUpdate(oldValue, newValue);

      expect(updatedValue.selection.baseOffset, 6);
    });
  });
}
