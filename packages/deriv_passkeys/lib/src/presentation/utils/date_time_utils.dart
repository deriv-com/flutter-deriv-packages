import 'package:jiffy/jiffy.dart';

///returns DateTime from timestamp
DateTime dateTimeFromTimestamp(int timestamp) =>
    DateTime.fromMillisecondsSinceEpoch(timestamp);

///returns formatted date
///e.g. April 20th, 2023
String formattedDate(DateTime date) =>
    Jiffy.parseFromDateTime(date).format(pattern: 'MMMM do, yyyy');
