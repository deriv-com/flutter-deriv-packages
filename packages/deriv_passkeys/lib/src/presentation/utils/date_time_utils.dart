import 'package:flutter/foundation.dart';

///returns DateTime from timestamp
DateTime dateTimeFromTimestamp(int timestamp) =>
    DateTime.fromMillisecondsSinceEpoch(timestamp);

///returns formatted date
///e.g. April 20th, 2023
String formattedDate(DateTime date) {
  final String day = date.day.toString();
  final String year = date.year.toString();
  final String suffix = getDaySuffix(date.day);
  final String monthName = getMonthName(date.month);
  return '$monthName $day$suffix, $year';
}

///returns day suffix
@visibleForTesting
String getDaySuffix(int day) {
  if (day >= 11 && day <= 13) {
    return 'th';
  }
  switch (day % 10) {
    case 1:
      return 'st';
    case 2:
      return 'nd';
    case 3:
      return 'rd';
    default:
      return 'th';
  }
}

///returns month name
@visibleForTesting
String getMonthName(int month) {
  switch (month) {
    case 1:
      return 'January';
    case 2:
      return 'February';
    case 3:
      return 'March';
    case 4:
      return 'April';
    case 5:
      return 'May';
    case 6:
      return 'June';
    case 7:
      return 'July';
    case 8:
      return 'August';
    case 9:
      return 'September';
    case 10:
      return 'October';
    case 11:
      return 'November';
    case 12:
      return 'December';
    default:
      return '';
  }
}
