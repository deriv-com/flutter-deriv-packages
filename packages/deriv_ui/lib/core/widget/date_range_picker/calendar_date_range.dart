import 'dart:math' as math;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import '../../helpers/color_helper.dart';
import '../../helpers/date_time_helper.dart';

part 'calendar_keyboard_navigator.dart';

part 'day_header.dart';

part 'focused_date.dart';

part 'highlight_painter.dart';

part 'month_item.dart';

part 'month_item_grid.dart';

part 'month_item_grid_delegate.dart';

const Duration _monthScrollDuration = Duration(milliseconds: 200);

const double _maxCalendarWidthLandscape = 384;
const double _maxCalendarWidthPortrait = 480;

/// Displays a scrollable calendar grid that allows a user to select a range of dates.
class CalendarDateRange extends StatefulWidget {
  /// Creates a scrollable calendar grid for picking date ranges.
  CalendarDateRange({
    required DateTime currentDate,
    required DateTime firstDate,
    required DateTime lastDate,
    required this.onStartDateChanged,
    required this.onEndDateChanged,
    required this.containerEdgeColor,
    required this.highLightColor,
    required this.dayStyle,
    required this.splashColor,
    required this.boxCircleColor,
    required this.selectDayColor,
    required this.disableDayColor,
    required this.monthItemRowHeight,
    required this.monthItemSpaceBetweenRows,
    required this.monthItemHeaderHeight,
    required this.horizontalPadding,
    required this.monthItemFooterHeight,
    required this.style,
    required this.gridHeight,
    this.headerHeight=48,
    this.headerStyle,
    Key? key,
    DateTime? initialStartDate,
    DateTime? initialEndDate,
  })  : initialStartDate = initialStartDate != null
            ? getDateFromDateTime(initialStartDate)
            : null,
        initialEndDate =
            initialEndDate != null ? getDateFromDateTime(initialEndDate) : null,
        firstDate = getDateFromDateTime(firstDate),
        lastDate = getDateFromDateTime(lastDate),
        currentDate = getDateFromDateTime(currentDate),
        super(key: key);

  /// The earliest allowable [DateTime] that the user can select.
  final DateTime firstDate;

  /// The latest allowable [DateTime] that the user can select.
  final DateTime lastDate;

  /// Called when the user changes the start date of the selected range.
  final ValueChanged<DateTime> onStartDateChanged;

  /// Called when the user changes the end date of the selected range.
  final ValueChanged<DateTime?>? onEndDateChanged;

  /// The [DateTime] representing today. It will be highlighted in the day grid.
  final DateTime currentDate;

  /// The [DateTime] that represents the start of the initial date range selection.
  final DateTime? initialStartDate;

  /// The [DateTime] that represents the end of the initial date range selection.
  final DateTime? initialEndDate;

  /// Header height
  final double? headerHeight;

  /// Header style
  final TextStyle? headerStyle;

  final double monthItemRowHeight;
  final double monthItemSpaceBetweenRows;
  final double monthItemHeaderHeight;
  final double horizontalPadding;
  final double monthItemFooterHeight;
  final TextStyle style;
  final double gridHeight;
  final Color containerEdgeColor;
  final Color highLightColor;
  final TextStyle dayStyle;
  final Color splashColor;
  final Color boxCircleColor;
  final Color selectDayColor;
  final Color disableDayColor;

  @override
  _CalendarDateRangeState createState() => _CalendarDateRangeState();
}

class _CalendarDateRangeState extends State<CalendarDateRange> {
  final GlobalKey scrollViewKey = GlobalKey();

  DateTime? startDate;
  DateTime? endDate;

  int initialMonthIndex = 0;
  late bool showWeekBottomDivider;

  late ScrollController controller;

  @override
  void initState() {
    super.initState();

    controller = ScrollController()..addListener(_scrollListener);

    startDate = widget.initialStartDate;
    endDate = widget.initialEndDate;

    final DateTime initialDate =
        widget.initialStartDate ?? widget.initialEndDate ?? widget.currentDate;

    if (widget.firstDate.isBefore(initialDate) &&
        (widget.lastDate.isAfter(initialDate) ||
            widget.lastDate.isAtSameMomentAs(initialDate))) {
      initialMonthIndex = monthDelta(
        startDate: widget.firstDate,
        endDate: initialDate,
      );
    }

    showWeekBottomDivider = initialMonthIndex != 0;
  }

  @override
  Widget build(BuildContext context) {
    const Key sliverAfterKey = Key('SILVER_AFTER_KEY');

    return Column(
      children: <Widget>[
        _DayHeader(
            maxHeight: widget.headerHeight,
            headerTextStyle: widget.headerStyle),
        if (showWeekBottomDivider) const Divider(height: 0),
        Expanded(
          child: _CalendarKeyboardNavigator(
            firstDate: widget.firstDate,
            lastDate: widget.lastDate,
            initialFocusedDay:
                startDate ?? widget.initialStartDate ?? widget.currentDate,
            child: CustomScrollView(
              key: scrollViewKey,
              controller: controller,
              center: sliverAfterKey,
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) => _buildMonthItem(
                      index: index,
                      beforeInitialMonth: true,
                      containerEdgeColor: widget.containerEdgeColor,
                      monthItemSpaceBetweenRows:
                          widget.monthItemSpaceBetweenRows,
                      monthItemRowHeight: widget.monthItemRowHeight,
                      boxCircleColor: widget.boxCircleColor,
                      dayStyle: widget.dayStyle,
                      disableDayColor: widget.disableDayColor,
                      highLightColor: widget.highLightColor,
                      monthItemHeaderHeight: widget.monthItemHeaderHeight,
                      selectDayColor: widget.selectDayColor,
                      splashColor: widget.splashColor,
                      style: widget.style,
                      gridHeight: widget.gridHeight,
                      horizontalPadding: widget.horizontalPadding,
                      monthItemFooterHeight: widget.monthItemFooterHeight,
                    ),
                    childCount: initialMonthIndex,
                  ),
                ),
                SliverList(
                  key: sliverAfterKey,
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) => _buildMonthItem(
                      index: index,
                      beforeInitialMonth: false,
                      containerEdgeColor: widget.containerEdgeColor,
                      monthItemSpaceBetweenRows:
                          widget.monthItemSpaceBetweenRows,
                      monthItemRowHeight: widget.monthItemRowHeight,
                      boxCircleColor: widget.boxCircleColor,
                      dayStyle: widget.dayStyle,
                      disableDayColor: widget.disableDayColor,
                      highLightColor: widget.highLightColor,
                      monthItemHeaderHeight: widget.monthItemHeaderHeight,
                      selectDayColor: widget.selectDayColor,
                      splashColor: widget.splashColor,
                      style: widget.style,
                      gridHeight: widget.gridHeight,
                      horizontalPadding: widget.horizontalPadding,
                      monthItemFooterHeight: widget.monthItemFooterHeight,
                    ),
                    childCount: _numberOfMonths - initialMonthIndex,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMonthItem(
      {required int index,
      required bool beforeInitialMonth,
      required double monthItemRowHeight,
      required double monthItemSpaceBetweenRows,
      required Color highLightColor,
      required TextStyle dayStyle,
      required Color splashColor,
      required Color boxCircleColor,
      required Color selectDayColor,
      required Color disableDayColor,
      required double monthItemHeaderHeight,
      required Color containerEdgeColor,
      required double horizontalPadding,
      required double monthItemFooterHeight,
      required TextStyle style,
      required double gridHeight}) {
    final int monthIndex = beforeInitialMonth
        ? initialMonthIndex - index - 1
        : initialMonthIndex + index;

    final DateTime month = addMonthsToMonthDate(
      monthDate: widget.firstDate,
      monthsToAdd: monthIndex,
    );

    return _MonthItem(
      currentDate: widget.currentDate,
      selectedDateStart: startDate,
      selectedDateEnd: endDate,
      firstDate: widget.firstDate,
      lastDate: widget.lastDate,
      displayedMonth: month,
      onChanged: _updateSelection,
      containerEdgeColor: containerEdgeColor,
      monthItemSpaceBetweenRows: monthItemSpaceBetweenRows,
      monthItemRowHeight: monthItemRowHeight,
      boxCircleColor: boxCircleColor,
      dayStyle: dayStyle,
      disableDayColor: disableDayColor,
      highLightColor: highLightColor,
      monthItemHeaderHeight: monthItemHeaderHeight,
      selectDayColor: selectDayColor,
      splashColor: splashColor,
      style: style,
      gridHeight: gridHeight,
      horizontalPadding: horizontalPadding,
      monthItemFooterHeight: monthItemFooterHeight,
    );
  }

  void _scrollListener() {
    if (controller.offset <= controller.position.minScrollExtent) {
      setState(() => showWeekBottomDivider = false);
    } else if (!showWeekBottomDivider) {
      setState(() => showWeekBottomDivider = true);
    }
  }

  void _updateSelection(DateTime date) {
    setState(() {
      if (startDate != null && endDate == null && !date.isBefore(startDate!)) {
        widget.onEndDateChanged?.call(endDate = date);
      } else {
        widget.onStartDateChanged.call(startDate = date);

        if (endDate != null) {
          widget.onEndDateChanged?.call(endDate = null);
        }
      }
    });
  }

  int get _numberOfMonths =>
      monthDelta(startDate: widget.firstDate, endDate: widget.lastDate) + 1;

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }
}
