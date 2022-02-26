part of 'calendar_date_range.dart';

class _MonthItemGridDelegate extends SliverGridDelegate {
  const _MonthItemGridDelegate(
      { this.monthItemRowHeight=48,
       this.monthItemSpaceBetweenRows=8,
       this.horizontalPadding=8});

  final double horizontalPadding;
  final double monthItemRowHeight;
  final double monthItemSpaceBetweenRows;

  @override
  SliverGridLayout getLayout(SliverConstraints constraints) {
    final double tileWidth =
        (constraints.crossAxisExtent - 2 * horizontalPadding) /
            DateTime.daysPerWeek;

    return _MonthSliverGridLayout(
      monthItemRowHeight: monthItemRowHeight,
      monthItemSpaceBetweenRows: monthItemSpaceBetweenRows,
      crossAxisCount: DateTime.daysPerWeek + 2,
      dayChildWidth: tileWidth,
      edgeChildWidth: horizontalPadding,
      reverseCrossAxis: axisDirectionIsReversed(constraints.crossAxisDirection),
    );
  }

  @override
  bool shouldRelayout(_MonthItemGridDelegate oldDelegate) => false;
}
