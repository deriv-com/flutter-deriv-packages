part of 'calendar_date_range.dart';

/// InheritedWidget indicating what the current focused date is for its children.
class _FocusedDate extends InheritedWidget {
  const _FocusedDate({
    required Widget child,
    required this.date,
    required this.scrollDirection,
    Key? key,
  }) : super(key: key, child: child);

  final DateTime? date;
  final TraversalDirection? scrollDirection;

  @override
  bool updateShouldNotify(_FocusedDate oldWidget) =>
      !isSameDay(firstDate: date, secondDate: oldWidget.date) ||
      scrollDirection != oldWidget.scrollDirection;

  static _FocusedDate? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_FocusedDate>();
}
