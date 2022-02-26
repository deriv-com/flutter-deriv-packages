import 'package:deriv_ui/core/extensions/context_extension.dart';
import 'package:deriv_ui/core/widget/date_range_picker/range_picker_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../../util/color.dart';
import '../../helpers/color_helper.dart';
import '../animated_popup.dart';
import 'calendar_date_range.dart';
import 'input_date_range.dart';
import 'models/animated_popup_dialog_card_model.dart';
import 'models/date_range_model.dart';
import 'selected_date_range.dart';

/// Calendar date range picker widget.
class DateRangePicker extends StatefulWidget {
  /// Initializes calendar date range picker widget.
  const DateRangePicker({
    required this.currentDate,
    required this.minAllowedDate,
    required this.maxAllowedDate,
    this.selectedDateRangeTextStyle=const TextStyle(),
    this.monthItemHeaderHeight = 48,
    this.monthItemRowHeight = 48,
    this.horizontalPadding = 8,
    this.monthItemSpaceBetweenRows = 8,
    this.monthItemFooterHeight = 16,
    this.style=const TextStyle(),
    this.containerEdgeColor = BrandColors.coral,
    this.highLightColor = BrandColors.coral,
    this.dayStyle=const TextStyle(),
    this.splashColor = BrandColors.coral,
    this.boxCircleColor = BrandColors.coral,
    this.selectDayColor = LightThemeColors.base04,
    this.disableDayColor = LightThemeColors.base01,
    this.selectedDateRangeColor=LightThemeColors.base02,
    this.initialStartDate,
    this.initialEndDate,
    this.mode = DateRangPickerMode.calendar,
    this.backgroundColor,
    this.appBarPadding = const EdgeInsets.all(0),
    this.iconColor,
    this.iconButtonColor,
    this.calendarColor,
    this.bottomPadding,
    this.leftPadding,
    this.verticalPadding,
    this.calendarStyle,
    this.animatedPopupDialogCardModel,
    this.headerHeight,
    this.headerStyle,
    Key? key,
  }) : super(key: key);

  /// The [DateTime] representing today. It will be highlighted in the day grid.
  final DateTime currentDate;

  /// The earliest allowed [DateTime] that the user can select.
  final DateTime minAllowedDate;

  /// The latest allowed [DateTime] that the user can select.
  final DateTime maxAllowedDate;

  /// The [DateTime] that represents the start of the initial date range selection.
  final DateTime? initialStartDate;

  /// The [DateTime] that represents the end of the initial date range selection.
  final DateTime? initialEndDate;

  /// Date range Picker mode determine range picker starts in calendar or input mode.
  ///
  /// Default value is [DateRangPickerMode.calendar].
  final DateRangPickerMode mode;

  ///Padding for AppBar
  final EdgeInsetsGeometry appBarPadding;

  ///Background color
  final Color? backgroundColor;

  ///AppBar Icon color
  final Color? iconColor;

  /// Icon Button Color
  final Color? iconButtonColor;

  /// Calendar color
  final Color? calendarColor;

  /// Calendar bottom padding
  final double? bottomPadding;

  /// Calendar left padding
  final double? leftPadding;

  /// Calendar vertical padding
  final double? verticalPadding;

  /// Calendar Text style
  final TextStyle? calendarStyle;

  ///Animated Popup dialog Card values
  final AnimatedPopupDialogCardModel? animatedPopupDialogCardModel;

  final Color selectedDateRangeColor;

  final TextStyle selectedDateRangeTextStyle;

  final double monthItemRowHeight;
  final double monthItemSpaceBetweenRows;
  final double monthItemHeaderHeight;
  final double horizontalPadding;
  final double monthItemFooterHeight;
  final TextStyle style;
  final Color containerEdgeColor;
  final Color highLightColor;
  final TextStyle dayStyle;
  final Color splashColor;
  final Color boxCircleColor;
  final Color selectDayColor;
  final Color disableDayColor;

  /// Header height
  final double? headerHeight;

  /// Header style
  final TextStyle? headerStyle;

  @override
  _DateRangePickerState createState() => _DateRangePickerState();
}

class _DateRangePickerState extends State<DateRangePicker> {
  DateTime? selectedStartDate;
  DateTime? selectedEndDate;

  bool showCalendar = true;

  @override
  void initState() {
    super.initState();

    selectedStartDate = widget.initialStartDate;
    selectedEndDate = widget.initialEndDate;

    SchedulerBinding.instance?.addPostFrameCallback((_) {
      if (widget.mode == DateRangPickerMode.input) {
        showDateRangeInputDialog();
      }
    });
  }

  @override
  Widget build(BuildContext context) => Visibility(
        visible: showCalendar,
        child: Scaffold(
          backgroundColor: widget.backgroundColor,
          appBar: _buildAppBar(context,
              appBarPadding: widget.appBarPadding,
              iconButtonColor: widget.iconButtonColor,
              iconColor: widget.iconColor),
          body: _buildCalendar(
              selectedDateRangeColor: widget.selectedDateRangeColor,
              selectedDateRangeTextStyle: widget.selectedDateRangeTextStyle,
              bottomPadding: widget.bottomPadding,
              color: widget.calendarColor,
              leftPadding: widget.leftPadding,
              style: widget.calendarStyle,
              verticalPadding: widget.verticalPadding),
        ),
      );

  AppBar _buildAppBar(BuildContext context,
          {EdgeInsetsGeometry appBarPadding = const EdgeInsets.all(0),
          Color? iconColor,
          Color? iconButtonColor}) =>
      AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.close,
            semanticLabel: context.localization.semanticCloseIcon,
            color: iconColor,
          ),
          tooltip: context.localization.labelClose,
          onPressed: () => Navigator.pop(context),
        ),
        actions: <Widget>[
          Padding(
            padding: appBarPadding,
            child: IconButton(
              icon: Icon(
                Icons.check,
                semanticLabel: context.localization.semanticConfirmIcon,
                color: iconButtonColor != null
                    ? iconButtonColor.withOpacity(
                        getOpacity(isEnabled: _isSaveEnabled()),
                      )
                    : iconButtonColor,
              ),
              tooltip: context.localization.labelConfirm,
              onPressed: _isSaveEnabled() ? _setSelectedDate : null,
            ),
          ),
        ],
      );

  Widget _buildCalendar({
    Color? selectedDateRangeColor,
    TextStyle? selectedDateRangeTextStyle,
    Color? color,
    double? leftPadding,
    double? bottomPadding,
    double? verticalPadding,
    TextStyle? style,
  }) =>
      Column(
        children: <Widget>[
          Container(
            color: color,
            padding: EdgeInsets.only(
              left: leftPadding ?? 0,
              bottom: bottomPadding ?? 0,
            ),
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
                      startDate: selectedStartDate,
                      endDate: selectedEndDate,
                      color: selectedDateRangeColor,
                      style: selectedDateRangeTextStyle,
                    ),
                    _buildEditButton(),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: CalendarDateRange(
              currentDate: widget.currentDate,
              firstDate: widget.minAllowedDate,
              lastDate: widget.maxAllowedDate,
              initialStartDate: selectedStartDate,
              initialEndDate: selectedEndDate,
              onStartDateChanged: (DateTime date) =>
                  setState(() => selectedStartDate = date),
              onEndDateChanged: (DateTime? date) =>
                  setState(() => selectedEndDate = date),
              horizontalPadding: widget.horizontalPadding,
              style: widget.style,
              splashColor: widget.splashColor,
              selectDayColor: widget.selectDayColor,
              monthItemHeaderHeight: widget.monthItemHeaderHeight,
              highLightColor: widget.highLightColor,
              disableDayColor: widget.disableDayColor,
              dayStyle: widget.dayStyle,
              boxCircleColor: widget.boxCircleColor,
              monthItemRowHeight: widget.monthItemRowHeight,
              monthItemSpaceBetweenRows: widget.monthItemSpaceBetweenRows,
              containerEdgeColor: widget.containerEdgeColor,
              monthItemFooterHeight: widget.monthItemFooterHeight,
              headerHeight: widget.headerHeight,
              headerStyle: widget.headerStyle,
            ),
          ),
        ],
      );

  Widget _buildEditButton({double? buttonRightPadding, Color? iconColor}) =>
      Container(
        padding: EdgeInsets.only(
          right: buttonRightPadding ?? 0,
        ),
        child: ClipOval(
          child: Material(
            color: Colors.transparent,
            child: IconButton(
              icon: Icon(
                Icons.edit,
                semanticLabel: context.localization.semanticEditIcon,
                color: iconColor,
              ),
              tooltip: context.localization.labelEdit,
              onPressed: showDateRangeInputDialog,
            ),
          ),
        ),
      );

  Future<void> showDateRangeInputDialog() async {
    setState(() => showCalendar = false);

    final DateRangeModel? datePickerResult = await showDialog<DateRangeModel>(
      context: context,
      builder: (BuildContext context) => AnimatedPopupDialog(
        child: InputDateRange(
          currentDate: widget.currentDate,
          minAllowedDate: widget.minAllowedDate,
          maxAllowedDate: widget.maxAllowedDate,
          initialStartDate: selectedStartDate,
          initialEndDate: selectedEndDate,
          selectedDateRangeTextStyle: widget.selectedDateRangeTextStyle,
          selectedDateRangeColor: widget.selectedDateRangeColor,
        ),
        cardBorderRadius: widget.animatedPopupDialogCardModel?.cardBorderRadius,
        cardColor: widget.animatedPopupDialogCardModel?.cardColor,
        cardElevation: widget.animatedPopupDialogCardModel?.cardElevation,
        cardPadding: widget.animatedPopupDialogCardModel?.cardPadding,
        verticalMargin: widget.animatedPopupDialogCardModel?.verticalMargin,
      ),
    );

    if (datePickerResult == null) {
      return;
    }

    setState(() {
      showCalendar = datePickerResult.showCalendar ?? true;

      selectedStartDate = datePickerResult.startDate;
      selectedEndDate = datePickerResult.endDate;
    });

    if (!showCalendar) {
      _setSelectedDate();
    }
  }

  void _setSelectedDate() => Navigator.pop(
        context,
        selectedStartDate == null && selectedEndDate == null
            ? null
            : DateRangeModel(
                startDate: selectedStartDate,
                endDate: selectedEndDate,
              ),
      );

  bool _isSaveEnabled() => selectedStartDate != null || selectedEndDate != null;
}
