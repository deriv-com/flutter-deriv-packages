import 'package:flutter_test/flutter_test.dart';
import 'package:deriv_passkeys/src/presentation/utils/date_time_utils.dart';

void main() {
  group('DateTimeUtils', () {
    test('dateTimeFromTimestamp should return DateTime', () {
      const int timestamp = 1630444800000;

      final DateTime result = dateTimeFromTimestamp(timestamp);

      expect(result, isA<DateTime>());
    });

    test('formattedDate should return formatted date string', () {
      final DateTime date = DateTime(2023, 4, 20); // Provide a valid date

      final String result = formattedDate(date);

      expect(result, isA<String>());
    });

    test('getDaySuffix should return correct suffix', () {
      expect(getDaySuffix(1), 'st');
      expect(getDaySuffix(2), 'nd');
      expect(getDaySuffix(3), 'rd');
      expect(getDaySuffix(4), 'th');
      expect(getDaySuffix(11), 'th');
      expect(getDaySuffix(12), 'th');
      expect(getDaySuffix(13), 'th');
      expect(getDaySuffix(21), 'st');
      expect(getDaySuffix(22), 'nd');
      expect(getDaySuffix(23), 'rd');
      expect(getDaySuffix(24), 'th');
    });

    test('getMonthName should return correct month name', () {
      expect(getMonthName(1), 'January');
      expect(getMonthName(2), 'February');
      expect(getMonthName(3), 'March');
      expect(getMonthName(4), 'April');
      expect(getMonthName(5), 'May');
      expect(getMonthName(6), 'June');
      expect(getMonthName(7), 'July');
      expect(getMonthName(8), 'August');
      expect(getMonthName(9), 'September');
      expect(getMonthName(10), 'October');
      expect(getMonthName(11), 'November');
      expect(getMonthName(12), 'December');
    });
  });
}
