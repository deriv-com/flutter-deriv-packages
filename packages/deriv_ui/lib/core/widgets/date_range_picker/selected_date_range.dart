import 'package:deriv_ui/util/color.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../util/strings_const.dart';
import '../../helpers/color_helper.dart';

/// Selected date range to show selected start and end date.
class SelectedDateRange extends StatelessWidget {
  /// Initializes selected date range.
  const SelectedDateRange({
    required this.currentDate,
    this.style = const TextStyle(),
    this.color = LightThemeColors.base02,
    this.startDate,
    this.endDate,
    this.labelTextStartDate,
    this.labelTextEndDate,
    Key? key,
  }) : super(key: key);

  /// Current date.
  final DateTime currentDate;

  /// Start date.
  final DateTime? startDate;

  /// End date.
  final DateTime? endDate;

  /// Selected date(start and end) TextStyle
  final TextStyle? style;

  /// Selected date(start and end)  text Color
  final Color? color;

  /// Start date Label Text
  final String? labelTextStartDate;

  /// End date Label Text
  final String? labelTextEndDate;

  @override
  Widget build(BuildContext context) {
    final List<String> formattedDateParts =
        _getFormattedDateRange(currentDate).split('-');

    return Expanded(
      child: RichText(
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          text: startDate == null
              ? labelTextStartDate ?? labelStartDate
              : formattedDateParts.first,
          style: style?.copyWith(
            color: color?.withOpacity(
              getOpacity(isEnabled: startDate != null),
            ),
          ),
          children: <TextSpan>[
            TextSpan(
              text: ' - ',
              style: style?.copyWith(
                color: color?.withOpacity(
                  getOpacity(isEnabled: startDate != null && endDate != null),
                ),
              ),
            ),
            TextSpan(
              text: endDate == null
                  ? labelTextEndDate ?? labelEndDate
                  : formattedDateParts.last,
              style: style?.copyWith(
                color: color?.withOpacity(
                  getOpacity(isEnabled: endDate != null),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getFormattedDateRange(DateTime currentDate) {
    const String monthDayFormat = 'MMM dd';
    const String monthDayYearFormat = 'MMM dd, yyyy';

    String? formattedStart;
    String? formattedEnd;

    if (startDate != null && endDate != null) {
      if (startDate!.year == endDate!.year) {
        formattedStart = DateFormat(monthDayFormat).format(startDate!);
        formattedEnd = DateFormat(monthDayYearFormat).format(endDate!);
      } else {
        formattedStart = DateFormat(monthDayYearFormat).format(startDate!);
        formattedEnd = DateFormat(monthDayYearFormat).format(endDate!);
      }
    } else {
      if (startDate?.year == currentDate.year ||
          endDate?.year == currentDate.year) {
        formattedStart = startDate == null
            ? null
            : DateFormat(monthDayFormat).format(startDate!);
        formattedEnd = endDate == null
            ? null
            : DateFormat(monthDayFormat).format(endDate!);
      } else {
        formattedStart = startDate == null
            ? null
            : DateFormat(monthDayYearFormat).format(startDate!);
        formattedEnd = endDate == null
            ? null
            : DateFormat(monthDayYearFormat).format(endDate!);
      }
    }

    return '$formattedStart-$formattedEnd';
  }
}
