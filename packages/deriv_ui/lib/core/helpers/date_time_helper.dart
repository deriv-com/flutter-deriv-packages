import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../util/strings_const.dart';
import '../widgets/date_range_picker/models/input_date_model.dart';


/// Formats a duration to time
String formatDuration({
  required Duration duration,
  bool showTimePartLabels = false,
  bool showDay = false,
  bool showHour = true,
  bool showSecond = true,
}) {
  final NumberFormat dayFormatter = NumberFormat('0');
  final NumberFormat timePartFormatter = NumberFormat('00');

  final int days = showDay ? duration.inDays : duration.inHours;
  final int hours = showDay ? duration.inHours.remainder(24) : duration.inHours;
  final int minutes = duration.inMinutes.remainder(60);
  final int seconds = duration.inSeconds.remainder(60);

  final String daysFormatted = showDay
      ? getTimePartLabel(
          timePart: days,
          zeroLabel: labelDay,
          singularLabel: labelDay,
          pluralLabel: labelDays,
          formatter: dayFormatter,
        )
      : '';

  final String hoursFormatted = showHour
      ? showTimePartLabels
          ? '${getTimePartLabel(timePart: hours, singularLabel: labelHour, zeroLabel:labelHour, pluralLabel: labelHour, formatter: timePartFormatter)} '
          : '${timePartFormatter.format(hours)}:'
      : '';

  final String minutesFormatted = showTimePartLabels
      ? getTimePartLabel(
          timePart: minutes,
          zeroLabel: labelMinute,
          singularLabel: labelMinute,
          pluralLabel: labelMinute,
          formatter: timePartFormatter,
        )
      : timePartFormatter.format(minutes);

  final String secondsFormatted = showSecond
      ? showTimePartLabels
          ? ' ${getTimePartLabel(timePart: seconds, singularLabel: labelSecond, zeroLabel: labelSecond, pluralLabel: labelSecond, formatter: timePartFormatter)}'
          : ':${timePartFormatter.format(seconds)}'
      : '';

  return '$daysFormatted $hoursFormatted$minutesFormatted$secondsFormatted'
      .trim();
}

/// Gets time part label.
String getTimePartLabel({
  required int timePart,
  required String zeroLabel,
  required String singularLabel,
  required String pluralLabel,
  required NumberFormat formatter,
}) =>
    Intl.plural(
      timePart,
      zero: '${formatter.format(timePart)} $zeroLabel',
      one: '${formatter.format(timePart)} $singularLabel',
      other: '${formatter.format(timePart)} $pluralLabel',
    );

/// Gets position headers date formatter
DateFormat getPositionHeadersDateFormatter() => DateFormat('dd MMMM yyyy');

/// Returns a [DateTime] with just the date of the original, but no time set.
DateTime getDateFromDateTime(DateTime date) =>
    DateTime(date.year, date.month, date.day);

/// Returns true if the two [DateTime] objects have the same day, month, and year, or are both null.
bool isSameDay({
  required DateTime? firstDate,
  required DateTime? secondDate,
}) =>
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
int monthDelta({
  required DateTime startDate,
  required DateTime endDate,
}) =>
    (endDate.year - startDate.year) * 12 + endDate.month - startDate.month;

/// Returns a [DateTime] with the added number of months and truncates any day and time information.
DateTime addMonthsToMonthDate({
  required DateTime monthDate,
  required int monthsToAdd,
}) =>
    DateTime(monthDate.year, monthDate.month + monthsToAdd);

/// Returns a [DateTime] with the added number of days and no time set.
DateTime addDaysToDate({
  required DateTime date,
  required int days,
}) =>
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

/// Pareses a String to DateTime.
/// Returns an instance of [InputDateModel].
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

/// Converts a DateTime to String according to the pattern provided.
String formatDateTimeToString({
  required DateTime dateTime,
  required String pattern,
}) =>
    DateFormat(pattern)
        .format(dateTime)
        .replaceAll('AM', 'am')
        .replaceAll('PM', 'pm');

/// Returns the weekday index from the short name of weekdays.
int stringToWeekDay(String? weekDayShortName) {
  switch (weekDayShortName) {
    case 'Mon':
      return 1;
    case 'Tue':
      return 2;
    case 'Wed':
      return 3;
    case 'Thu':
      return 4;
    case 'Fri':
      return 5;
    case 'Sat':
      return 6;
    case 'Sun':
      return 7;
    default:
      return 7;
  }
}


/// Returns the duration with proper unit
String getTimeDuration({
  required int? duration,
  String? durationUnit,
}) {
  if (durationUnit == 'm') {
    return labelMinutes(duration!);
  } else if (durationUnit == 'h') {
    return labelHoursValue(duration!);
  } else if (durationUnit == 'd') {
    return labelDaysValue(duration!);
  }
  return '$duration';
}
