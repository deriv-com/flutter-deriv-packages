import 'package:deriv_date_range_picker/deriv_date_range_picker.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

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
    this.fieldStartLabelText,
    this.fieldEndLabelText,
    this.semanticCalendarLabel,
    this.toolTipCalendar,
    this.cancelText,
    this.confirmText,
    this.labelSelectedDateRange,
    Key? key,
  }) : super(key: key);

  /// Label text for the start date field.
  final String? fieldStartLabelText;

  /// Label text for the end date field.
  final String? fieldEndLabelText;

  /// Semantic label for the calendar icon.
  final String? semanticCalendarLabel;

  /// Text that appears when the user long-presses the calendar icon.
  final String? toolTipCalendar;

  /// Text for the cancel button.
  final String? cancelText;

  /// Text for the confirm button.
  final String? confirmText;

  /// Label for selected date range.
  final String? labelSelectedDateRange;

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
            color: context.theme.colors.primary,
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
        color: context.theme.colors.secondary,
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
                widget.labelSelectedDateRange ??
                    context.localization!.labelSelectedDateRange,
                style: context.theme.textStyle(
                  textStyle: TextStyles.overline,
                  color: context.theme.colors.lessProminent,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SelectedDateRange(
                  fieldStartLabelText: widget.fieldStartLabelText ??
                      context.localization!.labelStartDate,
                  fieldEndLabelText: widget.fieldEndLabelText ??
                      context.localization!.labelEndDate,
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
          fieldStartLabelText: widget.fieldStartLabelText ??
              context.localization!.labelStartDate,
          fieldEndLabelText:
              widget.fieldEndLabelText ?? context.localization!.labelEndDate,
          dateFormat: 'dd-MM-yyyy',
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
              semanticLabel: widget.semanticCalendarLabel,
              color: context.theme.colors.general.withOpacity(
                getOpacity(
                  isEnabled: _isDateValidForCalendar(),
                ),
              ),
            ),
            tooltip: widget.toolTipCalendar,
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
            onPressed: _onCancelTap,
            child: Text(
              widget.cancelText ?? context.localization!.labelActionCancel,
              style: context.theme.textStyle(
                textStyle: TextStyles.button,
                color: context.theme.colors.coral,
              ),
            ),
          ),
          TextButton(
            child: Text(
              widget.confirmText ?? context.localization!.labelActionOk,
              style: context.theme.textStyle(
                textStyle: TextStyles.button,
                color: _isDateValidForApply()
                    ? context.theme.colors.coral
                    : context.theme.colors.active,
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
