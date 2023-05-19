import 'package:deriv_date_range_picker/src/core/date_input_formatter.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DateInputFormatter', () {
    late DateInputFormatter formatter;

    setUpAll(() {
      formatter = DateInputFormatter();
    });

    test('should format input as hyphened date', () {
      const TextEditingValue oldValue = TextEditingValue.empty;
      const TextEditingValue newValue = TextEditingValue(
        text: '01012021',
        selection: TextSelection.collapsed(offset: 8),
      );

      final TextEditingValue formattedValue =
          formatter.formatEditUpdate(oldValue, newValue);

      expect(formattedValue.text, '01-01-2021');
      expect(formattedValue.selection.baseOffset, 10);
    });

    test('should remove non-numeric characters', () {
      const TextEditingValue oldValue = TextEditingValue.empty;
      const TextEditingValue newValue = TextEditingValue(
        text: '01a&01-2021x',
        selection: TextSelection.collapsed(offset: 14),
      );

      final TextEditingValue formattedValue =
          formatter.formatEditUpdate(oldValue, newValue);

      expect(formattedValue.text, '01-01-2021');
      expect(formattedValue.selection.baseOffset, 10);
    });
  });
}
