import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('getDateFromDateTime returns DateTime with only date', () {
    final DateTime date = DateTime(2023, 5, 18, 10, 30);
    final DateTime result = getDateFromDateTime(date);

    expect(result, DateTime(2023, 5, 18));
  });

  group('isSameDay', () {
    test('returns true when both dates are in the same day, month and year',
        () {
      final DateTime firstDate = DateTime(2023, 5, 18);
      final DateTime secondDate = DateTime(2023, 5, 18, 10, 30);
      final bool result =
          isSameDay(firstDate: firstDate, secondDate: secondDate);

      expect(result, true);
    });

    test('returns false when dates are in different days', () {
      final DateTime firstDate = DateTime(2023, 5, 18);
      final DateTime secondDate = DateTime(2023, 5, 19);
      final bool result =
          isSameDay(firstDate: firstDate, secondDate: secondDate);

      expect(result, false);
    });
  });

  group('isSameMonth', () {
    test('returns true when both dates are in the same month', () {
      final DateTime firstDate = DateTime(2023, 5, 18);
      final DateTime secondDate = DateTime(2023, 5, 28);
      final bool result =
          isSameMonth(firstDate: firstDate, secondDate: secondDate);

      expect(result, true);
    });

    test('returns false when dates are in different months', () {
      final DateTime firstDate = DateTime(2023, 5, 18);
      final DateTime secondDate = DateTime(2023, 6, 28);
      final bool result =
          isSameMonth(firstDate: firstDate, secondDate: secondDate);

      expect(result, false);
    });
  });

  test('monthDelta returns the number of months between two DateTime objects',
      () {
    final DateTime startDate = DateTime(2023);
    final DateTime endDate = DateTime(2023, 3, 15);
    final int result = monthDelta(startDate: startDate, endDate: endDate);

    expect(result, 2);
  });

  test('addDaysToDate returns DateTime with added days and no time set', () {
    final DateTime date = DateTime(2023, 5, 18); // May 18, 2023
    final DateTime result = addDaysToDate(date: date, days: 5);

    expect(result.year, 2023);
    expect(result.month, 5);
    expect(result.day, 23); // Adding 5 days to May 18 results in May 23
    expect(result.hour, 0); // No time set
  });

  group('parseDate', () {
    test('returns InputDateModel with parsed DateTime', () {
      const String date = '18-05-2023';
      final InputDateModel result = parseDate(date: date);

      expect(result.isValidOrNull, true);
      expect(result.dateTime, DateTime(2023, 5, 18));
    });

    test('returns InputDateModel with null DateTime when date is invalid', () {
      const String date = '18-05-2023-';
      final InputDateModel result = parseDate(date: date);

      expect(result.isValidOrNull, false);
      expect(result.dateTime, null);
    });

    test('returns InputDateModel with null DateTime when date is null', () {
      const String date = '';
      final InputDateModel result = parseDate(date: date);

      expect(result.isValidOrNull, true);
      expect(result.dateTime, null);
    });

    test(
        'returns InputDateModel with isValidOrNull false when year is not four digits',
        () {
      const String date = '18-05-23'; // Year is not four digits
      final InputDateModel result = parseDate(date: date);

      expect(result.isValidOrNull, false);
      expect(result.dateTime, null);
    });
  });

  test('getOpacity returns the appropriate opacity value', () {
    const bool isEnabled = true;
    final double result = getOpacity(isEnabled: isEnabled);

    expect(result, 1.0);
  });
}
