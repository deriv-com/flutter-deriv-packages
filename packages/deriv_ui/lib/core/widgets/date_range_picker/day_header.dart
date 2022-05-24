part of 'calendar_date_range.dart';

class _DayHeader extends StatelessWidget {
  ///initialize constructor
  const _DayHeader(
      {required this.maxHeight,
      required this.headerTextStyle,
      this.horizontalPadding = 8,
      this.monthItemRowHeight = 48,
      this.monthItemSpaceBetweenRows = 8});

  final double? maxHeight;
  final TextStyle? headerTextStyle;
  final double horizontalPadding;
  final double monthItemRowHeight;
  final double monthItemSpaceBetweenRows;

  @override
  Widget build(BuildContext context) => Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).orientation == Orientation.landscape
              ? _maxCalendarWidthLandscape
              : _maxCalendarWidthPortrait,
          maxHeight: maxHeight!,
        ),
        child: GridView.custom(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: _MonthItemGridDelegate(
              horizontalPadding: horizontalPadding,
              monthItemRowHeight: monthItemRowHeight,
              monthItemSpaceBetweenRows: monthItemSpaceBetweenRows),
          childrenDelegate: SliverChildListDelegate(
            _getHeader(context),
            addRepaintBoundaries: false,
          ),
        ),
      );

  List<Widget> _getHeader(BuildContext context) {
    final MaterialLocalizations localizations =
        MaterialLocalizations.of(context);

    final List<Widget> headerItems = <Widget>[];

    for (int i = localizations.firstDayOfWeekIndex; true; i = (i + 1) % 7) {
      final String weekday = localizations.narrowWeekdays[i];

      headerItems.add(
        Center(
          child: Text(
            weekday,
            style: headerTextStyle,
          ),
        ),
      );

      if (i == (localizations.firstDayOfWeekIndex - 1) % 7) {
        break;
      }
    }

    return <Widget>[Container(), ...headerItems, Container()];
  }
}
