import 'dart:ui';

import 'package:deriv_ui/core/extensions/context_extension.dart';
import 'package:deriv_ui/core/widget/date_range_picker/selected_date_range.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../util/color.dart';
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
    this.selectedDateRangeTextStyle=const TextStyle(),
    this.selectedDateRangeColor=LightThemeColors.base02,
    this.minAllowedDate,
    this.maxAllowedDate,
    this.initialStartDate,
    this.initialEndDate,
    this.backgroundColor=LightThemeColors.base02,
    this.titleColor=LightThemeColors.base02,
    this.titlePadding=const EdgeInsets.only(
      top: 16,
      left: 24,
      right: 16,
      bottom: 16,
    ),
    this.titleStyle=const TextStyle(color: Colors.black),
    this.verticalPadding=8,
    this.dateInputPadding=const EdgeInsets.only(
      left: 24,
      top:16,
      right:24,
    ),
    this.calenderButtonColor=LightThemeColors.base08,
    this.cancelButtonStyle,
    this.okButtonStyle,
    this.okButtonValidColor= BrandColors.coral,
    this.okButtonNotValidColor=LightThemeColors.base05,
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

  ///Background Color
  final Color? backgroundColor;

  /// Title color
  final Color? titleColor;

  /// Title padding
  final EdgeInsetsGeometry? titlePadding;

  /// Title Style
  final TextStyle? titleStyle;

  /// Title vertical padding
  final double? verticalPadding;

  /// Date Input padding
  final EdgeInsetsGeometry? dateInputPadding;

  /// Calender button Color
  final Color? calenderButtonColor;

  /// Cancel Button Style
  final TextStyle? cancelButtonStyle;

  /// Ok Button Style
  final TextStyle? okButtonStyle;

  /// Ok Button valid Color
  final Color? okButtonValidColor;

  /// Ok Button not valid color
  final Color? okButtonNotValidColor;

  ///
  final TextStyle selectedDateRangeTextStyle;

  ///
  final Color selectedDateRangeColor;

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
            color: widget.backgroundColor ?? Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _buildTitle(
                    color: widget.titleColor,
                    style: widget.titleStyle,
                    verticalPadding: widget.verticalPadding,
                    titlePadding: widget.titlePadding,
                    selectedDateRangeColor: widget.selectedDateRangeColor,
                    selectedDateRangeTextStyle:
                        widget.selectedDateRangeTextStyle),
                _buildDateInput(dateInputPadding: widget.dateInputPadding),
                _buildActions(
                    cancelButtonStyle: widget.cancelButtonStyle,
                    okButtonNotValidColor: widget.okButtonNotValidColor,
                    okButtonStyle: widget.okButtonStyle,
                    okButtonValidColor: widget.okButtonValidColor),
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

  Widget _buildTitle({
    required TextStyle selectedDateRangeTextStyle,
    required Color selectedDateRangeColor,
    Color? color,
    EdgeInsetsGeometry? titlePadding,
    TextStyle? style,
    double? verticalPadding,
  }) =>
      Container(
        color: color,
        padding: titlePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(
                vertical: verticalPadding ?? 0,
              ),
              child: Text(
                context.localization.labelSelectedRange,
                style: style,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SelectedDateRange(
                  currentDate: widget.currentDate,
                  startDate: isStartDateValid ? startDate : null,
                  endDate: isEndDateValid ? endDate : null,
                  style: selectedDateRangeTextStyle,
                  color: selectedDateRangeColor,
                ),
                _buildCalendarButton(color: widget.calenderButtonColor),
              ],
            ),
          ],
        ),
      );

  Widget _buildDateInput({required EdgeInsetsGeometry? dateInputPadding}) =>
      Padding(
        padding: dateInputPadding ?? const EdgeInsets.all(0),
        child: _DateRangeTextField(
          initialStartDate: startDate,
          initialEndDate: endDate,
          isStartDateValid: isStartDateValid,
          isEndDateValid: isEndDateValid,
          onEditingComplete: _onEditingComplete,
        ),
      );

  Widget _buildCalendarButton({Color? color}) => ClipOval(
        child: Material(
          color: Colors.transparent,
          child: IconButton(
            icon: Icon(
              Icons.date_range,
              semanticLabel: context.localization.semanticCalendarIcon,
              color: color?.withOpacity(
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

  Widget _buildActions(
          {TextStyle? cancelButtonStyle,
          TextStyle? okButtonStyle,
          Color? okButtonValidColor,
          Color? okButtonNotValidColor}) =>
      ButtonBar(
        children: <Widget>[
          TextButton(
            child: Text(
              context.localization.actionCancel,
              style: cancelButtonStyle,
            ),
            onPressed: _onCancelTap,
          ),
          TextButton(
            child: Text(
              context.localization.actionOK,
              style: okButtonStyle?.copyWith(
                  color: _isDateValidForApply()
                      ? okButtonValidColor
                      : okButtonNotValidColor),
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
