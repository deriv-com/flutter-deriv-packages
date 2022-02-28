import 'package:deriv_ui/core/extensions/context_extension.dart';
import 'package:deriv_ui/util/color.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../helpers/color_helper.dart';

/// Selected date range to show selected start and end date.
class SelectedDateRange extends StatelessWidget {
  /// Initializes selected date range.
  const SelectedDateRange({
    required this.currentDate,
     this.style=const TextStyle(color: Colors.black),
     this.color=LightThemeColors.base08,
    this.startDate,
    this.endDate,
    Key? key,
  }) : super(key: key);

  /// Current date.
  final DateTime currentDate;

  /// Start date.
  final DateTime? startDate;

  /// End date.
  final DateTime? endDate;

  /// TextStyle
  final TextStyle? style;

  ///Color
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final List<String> formattedDateParts =
        _getFormattedDateRange(currentDate).split('-');

    return Expanded(
      child: RichText(
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          text: startDate == null
              ? context.localization.labelStartDate
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
                  ? context.localization.labelEndDate
                  : formattedDateParts.last,
              style:style?.copyWith(
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
