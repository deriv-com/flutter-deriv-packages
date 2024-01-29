part of 'calendar_date_range.dart';

const _MonthItemGridDelegate _monthItemGridDelegate = _MonthItemGridDelegate();

class _MonthSliverGridLayout extends SliverGridLayout {
  const _MonthSliverGridLayout({
    required this.crossAxisCount,
    required this.dayChildWidth,
    required this.edgeChildWidth,
    required this.reverseCrossAxis,
  });

  final int crossAxisCount;
  final double dayChildWidth;
  final double edgeChildWidth;
  final bool reverseCrossAxis;

  double get _rowHeight => _monthItemRowHeight + _monthItemSpaceBetweenRows;

  double get _childHeight => _monthItemRowHeight;

  @override
  int getMinChildIndexForScrollOffset(double scrollOffset) =>
      crossAxisCount * (scrollOffset ~/ _rowHeight);

  @override
  int getMaxChildIndexForScrollOffset(double scrollOffset) {
    final int mainAxisCount = (scrollOffset / _rowHeight).ceil();

    return math.max(0, crossAxisCount * mainAxisCount - 1);
  }

  double _getCrossAxisOffset({
    required double crossAxisStart,
    required bool isPadding,
  }) =>
      reverseCrossAxis
          ? ((crossAxisCount - 2) * dayChildWidth + 2 * edgeChildWidth) -
              crossAxisStart -
              (isPadding ? edgeChildWidth : dayChildWidth)
          : crossAxisStart;

  @override
  SliverGridGeometry getGeometryForChildIndex(int index) {
    final int adjustedIndex = index % crossAxisCount;
    final bool isEdge =
        adjustedIndex == 0 || adjustedIndex == crossAxisCount - 1;
    final double crossAxisStart =
        math.max(0, (adjustedIndex - 1) * dayChildWidth + edgeChildWidth);

    return SliverGridGeometry(
      scrollOffset: (index ~/ crossAxisCount) * _rowHeight,
      crossAxisOffset: _getCrossAxisOffset(
        crossAxisStart: crossAxisStart,
        isPadding: isEdge,
      ),
      mainAxisExtent: _childHeight,
      crossAxisExtent: isEdge ? edgeChildWidth : dayChildWidth,
    );
  }

  @override
  double computeMaxScrollOffset(int childCount) {
    final int mainAxisCount = ((childCount - 1) ~/ crossAxisCount) + 1;
    final double mainAxisSpacing = _rowHeight - _childHeight;

    return _rowHeight * mainAxisCount - mainAxisSpacing;
  }
}
