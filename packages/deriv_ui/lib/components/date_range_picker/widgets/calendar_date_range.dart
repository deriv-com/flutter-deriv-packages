import 'dart:math' as math;

import 'package:deriv_ui/deriv_ui.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

part 'calendar_keyboard_navigator.dart';
part 'day_header.dart';
part 'focused_date.dart';
part 'highlight_painter.dart';
part 'month_item.dart';
part 'month_item_grid.dart';
part 'month_item_grid_delegate.dart';

const Duration _monthScrollDuration = Duration(milliseconds: 200);

const double _monthItemHeaderHeight = ThemeProvider.margin48;
const double _monthItemFooterHeight = ThemeProvider.margin16;
const double _monthItemRowHeight = ThemeProvider.margin48;
const double _monthItemSpaceBetweenRows = ThemeProvider.margin08;
const double _horizontalPadding = ThemeProvider.margin08;
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
        _DayHeader(),
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

  Widget _buildMonthItem({
    required int index,
    required bool beforeInitialMonth,
  }) {
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
