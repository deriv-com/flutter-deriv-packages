import 'package:deriv_date_range_picker/src/models/input_date_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Returns a [DateTime] with just the date of the original, but no time set.
DateTime getDateFromDateTime(DateTime date) =>
    DateTime(date.year, date.month, date.day);

/// Returns true if the two [DateTime] objects have the same day, month, and year, or are both null.
bool isSameDay({required DateTime? firstDate, required DateTime? secondDate}) =>
    firstDate?.year == secondDate?.year &&
    firstDate?.month == secondDate?.month &&
    firstDate?.day == secondDate?.day;

/// Returns true if the two [DateTime] objects have the same month, and year, or are both null.
bool isSameMonth({
  required DateTime? firstDate,
  required DateTime? secondDate,
}) =>
    firstDate?.year == secondDate?.year &&
    firstDate?.month == secondDate?.month;

/// Determines the number of months between two [DateTime] objects.
int monthDelta({required DateTime startDate, required DateTime endDate}) =>
    (endDate.year - startDate.year) * 12 + endDate.month - startDate.month;

/// Returns a [DateTime] with the added number of months and truncates any day and time information.
DateTime addMonthsToMonthDate({
  required DateTime monthDate,
  required int monthsToAdd,
}) =>
    DateTime(monthDate.year, monthDate.month + monthsToAdd);

/// Returns a [DateTime] with the added number of days and no time set.
DateTime addDaysToDate({required DateTime date, required int days}) =>
    DateTime(date.year, date.month, date.day + days);

/// Computes the offset from the first day of the week that the first day of the [month] falls on.
int firstDayOffset({
  required int year,
  required int month,
  required MaterialLocalizations localizations,
}) {
  final int weekdayFromMonday = DateTime(year, month).weekday - 1;
  final int firstDayOfWeekIndex = (localizations.firstDayOfWeekIndex - 1) % 7;

  return (weekdayFromMonday - firstDayOfWeekIndex) % 7;
}

/// Returns the number of days in a month, according to the proleptic Gregorian calendar.
int getDaysInMonth({
  required int year,
  required int month,
}) {
  if (month == DateTime.february) {
    final bool isLeapYear =
        (year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0);

    return isLeapYear ? 29 : 28;
  }

  const List<int> daysInMonth = <int>[
    31,
    -1,
    31,
    30,
    31,
    30,
    31,
    31,
    30,
    31,
    30,
    31
  ];

  return daysInMonth[month - 1];
}

/// Pareses a String to DateTime. Returns an instance of [InputDateModel].
InputDateModel parseDate({
  required String? date,
  String dateFormat = 'dd-MM-yyyy',
}) {
  if (date == null || date.isEmpty) {
    return InputDateModel();
  }

  try {
    final List<String> dateList = date.split('-');

    if (dateList.length == 3 && dateList[2].length != 4) {
      return InputDateModel(isValidOrNull: false);
    }

    return InputDateModel(
      dateTime: DateFormat(dateFormat).parseStrict(date),
    );
  } on Exception catch (_) {
    return InputDateModel(isValidOrNull: false);
  }
}

/// Returns the opacity based on the [isEnabled] value.
double getOpacity({required bool isEnabled}) => isEnabled ? 1.0 : 0.32;
