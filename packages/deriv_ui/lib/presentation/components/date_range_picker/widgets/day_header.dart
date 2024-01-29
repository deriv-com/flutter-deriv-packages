part of 'calendar_date_range.dart';

class _DayHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).orientation == Orientation.landscape
              ? _maxCalendarWidthLandscape
              : _maxCalendarWidthPortrait,
          maxHeight: _monthItemRowHeight,
        ),
        child: GridView.custom(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: _monthItemGridDelegate,
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
            style: context.theme.textStyle(
              textStyle: TextStyles.body1,
              color: context.theme.colors.disabled,
            ),
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
