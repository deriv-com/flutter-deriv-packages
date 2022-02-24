import 'package:deriv_ui/core/extensions/context_extension.dart';
import 'package:deriv_ui/core/widget/date_range_picker/selected_date_range.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../helpers/color_helper.dart';
import '../../helpers/date_time_helper.dart';
import '../../helpers/mask_text_input_formatter.dart';
import 'models/date_range_model.dart';
import 'models/input_date_model.dart';

part 'date_range_text_field.dart';

/// Date input range widget.
class InputDateRange extends StatefulWidget {
  /// Initializes date range input widget.
  const InputDateRange({
    required this.currentDate,
    this.minAllowedDate,
    this.maxAllowedDate,
    this.initialStartDate,
    this.initialEndDate,
    Key? key,
  }) : super(key: key);

  /// The [DateTime] representing today.
  final DateTime currentDate;

  /// The earliest allowed [DateTime] that the user can select.
  final DateTime? minAllowedDate;

  /// The latest allowed [DateTime] that the user can select.
  final DateTime? maxAllowedDate;

  /// The [DateTime] that represents the start of the initial date range selection.
  final DateTime? initialStartDate;

  /// The [DateTime] that represents the end of the initial date range selection.
  final DateTime? initialEndDate;

  @override
  _InputDateRangeState createState() => _InputDateRangeState();
}

class _InputDateRangeState extends State<InputDateRange> {
  late DateTime? startDate;
  late DateTime? endDate;
  late bool isStartDateValid;
  late bool isEndDateValid;

  final DateFormat dateFormatter = DateFormat('dd MMM');

  @override
  void initState() {
    super.initState();

    startDate = widget.initialStartDate;
    endDate = widget.initialEndDate;
    isStartDateValid = true;
    isEndDateValid = true;
  }

  @override
  Widget build(BuildContext context) => WillPopScope(
        child: GestureDetector(
          child: Container(
            color: context.theme.base08Color,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _buildTitle(),
                _buildDateInput(),
                _buildActions(),
              ],
            ),
          ),
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        ),
        onWillPop: () async {
          _onCancelTap();

          return true;
        },
      );

  Widget _buildTitle() => Container(
        color: context.theme.base07Color,
        padding: const EdgeInsets.only(
          top: ThemeProvider.margin16,
          left: ThemeProvider.margin24,
          right: ThemeProvider.margin16,
          bottom: ThemeProvider.margin16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: ThemeProvider.margin08,
              ),
              child: Text(
                context.localization.labelSelectedRange,
                style: context.theme.textStyle(
                  textStyle: TextStyles.overline,
                  color: context.theme.base03Color,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SelectedDateRange(
                  currentDate: widget.currentDate,
                  startDate: isStartDateValid ? startDate : null,
                  endDate: isEndDateValid ? endDate : null,
                ),
                _buildCalendarButton(),
              ],
            ),
          ],
        ),
      );

  Widget _buildDateInput() => Padding(
        padding: const EdgeInsets.only(
          left: ThemeProvider.margin24,
          top: ThemeProvider.margin16,
          right: ThemeProvider.margin24,
        ),
        child: _DateRangeTextField(
          initialStartDate: startDate,
          initialEndDate: endDate,
          isStartDateValid: isStartDateValid,
          isEndDateValid: isEndDateValid,
          onEditingComplete: _onEditingComplete,
        ),
      );

  Widget _buildCalendarButton() => ClipOval(
        child: Material(
          color: Colors.transparent,
          child: IconButton(
            icon: Icon(
              Icons.date_range,
              semanticLabel: context.localization.semanticCalendarIcon,
              color: context.theme.base02Color.withOpacity(
                getOpacity(
                  isEnabled: _isDateValidForCalendar(),
                ),
              ),
            ),
            tooltip: context.localization.labelCalendar,
            onPressed: () {
              if (_isDateValidForCalendar()) {
                _onConfirmTap(true);
              }
            },
          ),
        ),
      );

  Widget _buildActions() => ButtonBar(
        children: <Widget>[
          TextButton(
            child: Text(
              context.localization.actionCancel,
              style: context.theme.textStyle(
                textStyle: TextStyles.button,
                color: context.theme.brandCoralColor,
              ),
            ),
            onPressed: _onCancelTap,
          ),
          TextButton(
            child: Text(
              context.localization.actionOK,
              style: context.theme.textStyle(
                textStyle: TextStyles.button,
                color: _isDateValidForApply()
                    ? context.theme.brandCoralColor
                    : context.theme.base05Color,
              ),
            ),
            onPressed: () {
              if (_isDateValidForApply()) {
                _onConfirmTap(false);
              }
            },
          ),
        ],
      );

  void _onConfirmTap(bool showCalendar) => _applySelectedDateRange(
        DateRangeModel(
          startDate: startDate,
          endDate: endDate,
          showCalendar: showCalendar,
        ),
      );

  void _onEditingComplete(
    InputDateModel startDateModel,
    InputDateModel endDateModel,
  ) =>
      setState(() {
        startDate =
            startDateModel.isValidOrNull ? startDateModel.dateTime : null;
        endDate = endDateModel.isValidOrNull ? endDateModel.dateTime : null;

        _checkStartAndEndDateValidity(
          startDateModel.isValidOrNull,
          endDateModel.isValidOrNull,
        );
      });

  void _onCancelTap() =>
      _applySelectedDateRange(DateRangeModel(showCalendar: false));

  void _applySelectedDateRange(DateRangeModel datePickerResult) =>
      Navigator.pop(context, datePickerResult);

  bool _isDateValidForCalendar() => isStartDateValid && isEndDateValid;

  bool _isDateValidForApply() =>
      (_isStartDateAfterOrSameAsMinAllowableDate() &&
          _isStartDateBeforeOrSameAsMaxAllowableDate() &&
          _isStartDateBeforeOrSameAsEndDate() &&
          _isEndDateBeforeOrSameAsMaxAllowableDate()) ||
      (_hasOneValidDate() && isStartDateValid && isEndDateValid);

  bool _isStartDateAfterOrSameAsMinAllowableDate() =>
      startDate != null &&
      widget.minAllowedDate != null &&
      (startDate!.isAfter(widget.minAllowedDate!) ||
          startDate!.isAtSameMomentAs(widget.minAllowedDate!));

  bool _isStartDateBeforeOrSameAsMaxAllowableDate() =>
      startDate != null &&
      widget.maxAllowedDate != null &&
      (startDate!.isBefore(widget.maxAllowedDate!) ||
          startDate!.isAtSameMomentAs(widget.maxAllowedDate!));

  bool _isStartDateBeforeOrSameAsEndDate() =>
      startDate != null &&
      endDate != null &&
      (startDate!.isBefore(endDate!) || startDate!.isAtSameMomentAs(endDate!));

  bool _isEndDateBeforeOrSameAsMaxAllowableDate() =>
      endDate != null &&
      widget.maxAllowedDate != null &&
      (endDate!.isBefore(widget.maxAllowedDate!) ||
          endDate!.isAtSameMomentAs(widget.maxAllowedDate!));

  bool _isEndDateAfterOrSameAsMinAllowableDate() =>
      endDate != null &&
      widget.minAllowedDate != null &&
      (endDate!.isAfter(widget.minAllowedDate!) ||
          endDate!.isAtSameMomentAs(widget.minAllowedDate!));

  bool _hasOneValidDate() {
    if (startDate != null && endDate == null) {
      return _isStartDateAfterOrSameAsMinAllowableDate() &&
          _isStartDateBeforeOrSameAsMaxAllowableDate();
    } else if (startDate == null && endDate != null) {
      return _isEndDateBeforeOrSameAsMaxAllowableDate() &&
          _isEndDateAfterOrSameAsMinAllowableDate();
    } else {
      return false;
    }
  }

  void _checkStartAndEndDateValidity(
    bool startDateIsValidOrNull,
    bool endDateIsValidOrNull,
  ) {
    if (startDateIsValidOrNull) {
      if (startDate != null) {
        if (endDate != null) {
          isStartDateValid = _isStartDateAfterOrSameAsMinAllowableDate() &&
              _isStartDateBeforeOrSameAsMaxAllowableDate() &&
              _isStartDateBeforeOrSameAsEndDate();
        } else {
          isStartDateValid = _isStartDateAfterOrSameAsMinAllowableDate() &&
              _isStartDateBeforeOrSameAsMaxAllowableDate();
        }
      } else {
        isStartDateValid = true;
      }
    } else {
      isStartDateValid = false;
    }

    if (endDateIsValidOrNull) {
      if (endDate != null) {
        if (startDate != null) {
          isEndDateValid = _isEndDateBeforeOrSameAsMaxAllowableDate() &&
              _isEndDateAfterOrSameAsMinAllowableDate() &&
              _isStartDateBeforeOrSameAsEndDate();
        } else {
          isEndDateValid = _isEndDateBeforeOrSameAsMaxAllowableDate() &&
              _isEndDateAfterOrSameAsMinAllowableDate();
        }
      } else {
        isEndDateValid = true;
      }
    } else {
      isEndDateValid = false;
    }
  }
}
