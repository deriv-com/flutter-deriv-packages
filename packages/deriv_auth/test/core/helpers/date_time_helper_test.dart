import 'package:intl/intl.dart';
import 'package:test/test.dart';

import 'package:deriv_auth/core/helpers/helpers.dart';

void main() {
  group('date time helper functions tests =>', () {
    test('getCurrentLocalEpoch returns milliSecondsSinceEpoch int.', () {
      expect(
        getCurrentLocalEpoch(),
        isA<int>(),
      );
    });

    test('getCurrentServerTime returns DateTime.', () {
      const int timeDifference = 100;
      expect(
        getCurrentServerTime(timeDifference),
        isA<DateTime>(),
      );
    });

    test('getDateTime returns DateTime.', () {
      expect(getDateTime(10), isA<DateTime>());
      expect(getDateTime(null), null);
    });

    test('getDateTimeFromString returns DateTime.', () {
      expect(getDateTimeFromString('10'), isA<DateTime>());
      expect(getDateTimeFromString(null), null);
    });

    test('getSecondsSinceEpoch returns int.', () {
      expect(getSecondsSinceEpoch(10), isA<int>());
    });

    test('getSecondsSinceEpochDateTime returns int.', () {
      expect(getSecondsSinceEpochDateTime(DateTime.now()), isA<int>());
      expect(getSecondsSinceEpochDateTime(null), null);
    });

    test('getStringFromDateTime returns String.', () {
      expect(getStringFromDateTime(DateTime.now()), isA<String>());
      final String formattedDateTime =
          DateFormat('dd-MM-yyyy').format(DateTime.now());
      expect(getStringFromDateTime(DateTime.now(), pattern: 'dd-MM-yyyy'),
          formattedDateTime);
      expect(getStringFromDateTime(null), null);
    });
  });
}
