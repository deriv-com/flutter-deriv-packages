import 'package:deriv_date_range_picker/deriv_date_range_picker.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// import 'package:flutter_multipliers/core/extensions/extensions.dart';
// import 'package:flutter_multipliers/core/helpers/helpers.dart';

/// Selected date range to show selected start and end date.
class SelectedDateRange extends StatelessWidget {
  /// Initializes selected date range.
  const SelectedDateRange({
    required this.currentDate,
    required this.fieldStartLabelText,
    required this.fieldEndLabelText,
    this.startDate,
    this.endDate,
    Key? key,
  }) : super(key: key);

  /// Label text for the start date field.
  final String fieldStartLabelText;

  /// Label text for the end date field.
  final String fieldEndLabelText;

  /// Current date.
  final DateTime currentDate;

  /// Start date.
  final DateTime? startDate;

  /// End date.
  final DateTime? endDate;

  @override
  Widget build(BuildContext context) {
    final List<String> formattedDateParts =
        _getFormattedDateRange(currentDate).split('-');

    return Expanded(
      child: RichText(
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          text: startDate == null
              ? fieldStartLabelText
              : formattedDateParts.first,
          style: context.theme.textStyle(
            textStyle: TextStyles.headlineNormal,
            color: context.theme.colors.general.withOpacity(
              getOpacity(isEnabled: startDate != null),
            ),
          ),
          children: <TextSpan>[
            TextSpan(
              text: ' - ',
              style: context.theme.textStyle(
                textStyle: TextStyles.headlineNormal,
                color: context.theme.colors.general.withOpacity(
                  getOpacity(isEnabled: startDate != null && endDate != null),
                ),
              ),
            ),
            TextSpan(
              text:
                  endDate == null ? fieldEndLabelText : formattedDateParts.last,
              style: context.theme.textStyle(
                textStyle: TextStyles.headlineNormal,
                color: context.theme.colors.general.withOpacity(
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
