part of 'calendar_date_range.dart';

/// Displays the days of a given month and allows choosing a date range.
class _MonthItem extends StatefulWidget {
  const _MonthItem({
    required this.currentDate,
    required this.selectedDateStart,
    required this.selectedDateEnd,
    required this.firstDate,
    required this.lastDate,
    required this.displayedMonth,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  final DateTime currentDate;

  final DateTime? selectedDateStart;
  final DateTime? selectedDateEnd;

  final DateTime firstDate;
  final DateTime lastDate;

  final DateTime displayedMonth;

  final ValueChanged<DateTime> onChanged;

  @override
  _MonthItemState createState() => _MonthItemState();
}

class _MonthItemState extends State<_MonthItem> {
  late List<FocusNode> dayFocusNodes;

  @override
  void initState() {
    super.initState();

    final int daysInMonth = getDaysInMonth(
      year: widget.displayedMonth.year,
      month: widget.displayedMonth.month,
    );

    dayFocusNodes = List<FocusNode>.generate(
      daysInMonth,
      (int index) =>
          FocusNode(skipTraversal: true, debugLabel: 'Day ${index + 1}'),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final DateTime? focusedDate = _FocusedDate.of(context)?.date;

    if (focusedDate != null &&
        isSameMonth(
            firstDate: widget.displayedMonth, secondDate: focusedDate)) {
      dayFocusNodes[focusedDate.day - 1].requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final MaterialLocalizations localizations =
        MaterialLocalizations.of(context);

    final int year = widget.displayedMonth.year;
    final int month = widget.displayedMonth.month;
    final int daysInMonth = getDaysInMonth(year: year, month: month);
    final int dayOffset =
        firstDayOffset(year: year, month: month, localizations: localizations);
    final int weeks = ((daysInMonth + dayOffset) / DateTime.daysPerWeek).ceil();
    final double gridHeight =
        weeks * _monthItemRowHeight + (weeks - 1) * _monthItemSpaceBetweenRows;
    final List<Widget> dayItems = <Widget>[];

    for (int i = 0; true; i += 1) {
      final int day = i - dayOffset + 1;

      if (day > daysInMonth) {
        break;
      }

      if (day < 1) {
        dayItems.add(Container());
      } else {
        final DateTime dayToBuild = DateTime(year, month, day);
        final Widget dayItem =
            _buildDayItem(context: context, dayToBuild: dayToBuild);

        dayItems.add(dayItem);
      }
    }

    final List<Widget> paddedDayItems = <Widget>[];

    for (int i = 0; i < weeks; i++) {
      final int start = i * DateTime.daysPerWeek;

      final int end = math.min(
        start + DateTime.daysPerWeek,
        dayItems.length,
      );

      final List<Widget> weekList = dayItems.sublist(start, end);

      final DateTime dateAfterLeadingPadding =
          DateTime(year, month, start - dayOffset + 1);

      final bool isLeadingInRange = _isLeadingInRange(
        dayOffset: dayOffset,
        index: i,
        dateAfterLeadingPadding: dateAfterLeadingPadding,
      );

      weekList.insert(
        0,
        _buildEdgeContainer(context: context, isHighlighted: isLeadingInRange),
      );

      if (end < dayItems.length ||
          (end == dayItems.length &&
              dayItems.length % DateTime.daysPerWeek == 0)) {
        final DateTime dateBeforeTrailingPadding =
            DateTime(year, month, end - dayOffset);

        final bool isTrailingInRange = widget.selectedDateStart != null &&
            widget.selectedDateEnd != null &&
            !dateBeforeTrailingPadding.isBefore(widget.selectedDateStart!) &&
            dateBeforeTrailingPadding.isBefore(widget.selectedDateEnd!);

        weekList.add(
          _buildEdgeContainer(
            context: context,
            isHighlighted: isTrailingInRange,
          ),
        );
      }

      paddedDayItems.addAll(weekList);
    }

    final double maxWidth = _getMaxWidth(context);

    return Column(
      children: <Widget>[
        Container(
          constraints: BoxConstraints(maxWidth: maxWidth),
          height: _monthItemHeaderHeight,
          padding:
              const EdgeInsets.symmetric(horizontal: ThemeProvider.margin24),
          alignment: AlignmentDirectional.centerStart,
          child: ExcludeSemantics(
            child: Text(
              localizations.formatMonthYear(widget.displayedMonth),
              style: context.theme.textStyle(
                textStyle: TextStyles.body1,
                color: context.theme.colors.lessProminent,
              ),
            ),
          ),
        ),
        Container(
          constraints: BoxConstraints(
            maxWidth: maxWidth,
            maxHeight: gridHeight,
          ),
          child: GridView.custom(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: _monthItemGridDelegate,
            childrenDelegate: SliverChildListDelegate(
              paddedDayItems,
              addRepaintBoundaries: false,
            ),
          ),
        ),
        const SizedBox(height: _monthItemFooterHeight),
      ],
    );
  }

  Widget _buildDayItem({
    required BuildContext context,
    required DateTime dayToBuild,
  }) {
    final MaterialLocalizations localizations =
        MaterialLocalizations.of(context);

    final TextDirection textDirection = Directionality.of(context);
    final Color highlightColor = _highlightColor(context);
    final int day = dayToBuild.day;

    final bool isDisabled = dayToBuild.isAfter(widget.lastDate) ||
        dayToBuild.isBefore(widget.firstDate);

    TextStyle itemStyle = context.theme.textStyle(
      textStyle: TextStyles.body1,
      color: context.theme.colors.lessProminent,
    );

    BoxDecoration? decoration;

    final bool isRangeSelected =
        widget.selectedDateStart != null && widget.selectedDateEnd != null;
    final bool isSelectedDayStart = widget.selectedDateStart != null &&
        dayToBuild.isAtSameMomentAs(widget.selectedDateStart!);
    final bool isSelectedDayEnd = widget.selectedDateEnd != null &&
        dayToBuild.isAtSameMomentAs(widget.selectedDateEnd!);
    final bool isInRange = isRangeSelected &&
        dayToBuild.isAfter(widget.selectedDateStart!) &&
        dayToBuild.isBefore(widget.selectedDateEnd!);

    _HighlightPainter? highlightPainter;

    if (isSelectedDayStart || isSelectedDayEnd) {
      itemStyle = context.theme.textStyle(
          textStyle: itemStyle, color: context.theme.colors.prominent);

      decoration = BoxDecoration(
        color: context.theme.colors.coral,
        shape: BoxShape.circle,
      );

      if (isRangeSelected &&
          widget.selectedDateStart != widget.selectedDateEnd) {
        final _HighlightPainterStyle style = isSelectedDayStart
            ? _HighlightPainterStyle.highlightTrailing
            : _HighlightPainterStyle.highlightLeading;

        highlightPainter = _HighlightPainter(
          color: highlightColor,
          style: style,
          textDirection: textDirection,
        );
      }
    } else if (isInRange) {
      highlightPainter = _HighlightPainter(
        color: highlightColor,
        style: _HighlightPainterStyle.highlightAll,
        textDirection: textDirection,
      );
    }
    if (isDisabled) {
      itemStyle = context.theme.textStyle(
          textStyle: itemStyle, color: context.theme.colors.disabled);
    } else if (isSameDay(
        firstDate: widget.currentDate, secondDate: dayToBuild)) {
      itemStyle = context.theme.textStyle(
          textStyle: itemStyle, color: context.theme.colors.prominent);

      decoration = isSelectedDayStart || isSelectedDayEnd
          ? BoxDecoration(
              color: context.theme.colors.coral,
              shape: BoxShape.circle,
            )
          : BoxDecoration(
              border: Border.all(color: context.theme.colors.coral),
              shape: BoxShape.circle,
            );
    }

    String semanticLabel =
        '${localizations.formatDecimal(day)}, ${localizations.formatFullDate(dayToBuild)}';

    if (isSelectedDayStart) {
      semanticLabel =
          localizations.dateRangeStartDateSemanticLabel(semanticLabel);
    } else if (isSelectedDayEnd) {
      semanticLabel =
          localizations.dateRangeEndDateSemanticLabel(semanticLabel);
    }

    Widget dayWidget = Container(
      decoration: decoration,
      child: Center(
        child: Semantics(
          label: semanticLabel,
          selected: isSelectedDayStart || isSelectedDayEnd,
          child: ExcludeSemantics(
            child: Text(
              localizations.formatDecimal(day),
              style: itemStyle,
            ),
          ),
        ),
      ),
    );

    if (highlightPainter != null) {
      dayWidget = CustomPaint(
        painter: highlightPainter,
        child: dayWidget,
      );
    }

    if (!isDisabled) {
      dayWidget = InkResponse(
        focusNode: dayFocusNodes[day - 1],
        onTap: () => widget.onChanged(dayToBuild),
        radius: _monthItemRowHeight / 2 + 4,
        splashColor: context.theme.colors.coral.withOpacity(
          getOpacity(isEnabled: false),
        ),
        onFocusChange: _dayFocusChanged,
        child: dayWidget,
      );
    }

    return dayWidget;
  }

  Widget _buildEdgeContainer({
    required BuildContext context,
    required bool isHighlighted,
  }) =>
      Container(color: isHighlighted ? _highlightColor(context) : null);

  Color _highlightColor(BuildContext context) =>
      context.theme.colors.coral.withOpacity(getOpacity(isEnabled: false));

  void _dayFocusChanged(bool focused) {
    if (focused) {
      final TraversalDirection? focusDirection =
          _FocusedDate.of(context)?.scrollDirection;

      if (focusDirection != null) {
        ScrollPositionAlignmentPolicy policy =
            ScrollPositionAlignmentPolicy.explicit;

        switch (focusDirection) {
          case TraversalDirection.up:
          case TraversalDirection.left:
            policy = ScrollPositionAlignmentPolicy.keepVisibleAtStart;
            break;
          case TraversalDirection.right:
          case TraversalDirection.down:
            policy = ScrollPositionAlignmentPolicy.keepVisibleAtEnd;
            break;
        }

        Scrollable.ensureVisible(
          primaryFocus!.context!,
          duration: _monthScrollDuration,
          alignmentPolicy: policy,
        );
      }
    }
  }

  bool _isLeadingInRange({
    required int dayOffset,
    required int index,
    required DateTime dateAfterLeadingPadding,
  }) =>
      !(dayOffset > 0 && index == 0) &&
      widget.selectedDateStart != null &&
      widget.selectedDateEnd != null &&
      dateAfterLeadingPadding.isAfter(widget.selectedDateStart!) &&
      !dateAfterLeadingPadding.isAfter(widget.selectedDateEnd!);

  double _getMaxWidth(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.landscape
          ? _maxCalendarWidthLandscape
          : _maxCalendarWidthPortrait;

  @override
  void dispose() {
    for (final FocusNode node in dayFocusNodes) {
      node.dispose();
    }

    super.dispose();
  }
}
