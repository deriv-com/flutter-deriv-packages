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
  });
}
