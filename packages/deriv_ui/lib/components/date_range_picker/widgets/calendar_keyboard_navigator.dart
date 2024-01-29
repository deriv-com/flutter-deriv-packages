part of 'calendar_date_range.dart';

class _CalendarKeyboardNavigator extends StatefulWidget {
  const _CalendarKeyboardNavigator({
    required this.child,
    required this.initialFocusedDay,
    required this.firstDate,
    required this.lastDate,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final DateTime initialFocusedDay;
  final DateTime firstDate;
  final DateTime lastDate;

  @override
  _CalendarKeyboardNavigatorState createState() =>
      _CalendarKeyboardNavigatorState();
}

class _CalendarKeyboardNavigatorState
    extends State<_CalendarKeyboardNavigator> {
  Map<LogicalKeySet, Intent>? shortcutMap;
  Map<Type, Action<Intent>>? actionMap;
  late FocusNode dayGridFocus;
  TraversalDirection? dayTraversalDirection;
  DateTime? focusedDay;

  @override
  void initState() {
    super.initState();

    shortcutMap = <LogicalKeySet, Intent>{
      LogicalKeySet(LogicalKeyboardKey.arrowLeft):
          const DirectionalFocusIntent(TraversalDirection.left),
      LogicalKeySet(LogicalKeyboardKey.arrowRight):
          const DirectionalFocusIntent(TraversalDirection.right),
      LogicalKeySet(LogicalKeyboardKey.arrowDown):
          const DirectionalFocusIntent(TraversalDirection.down),
      LogicalKeySet(LogicalKeyboardKey.arrowUp):
          const DirectionalFocusIntent(TraversalDirection.up),
    };

    actionMap = <Type, Action<Intent>>{
      NextFocusIntent:
          CallbackAction<NextFocusIntent>(onInvoke: _handleGridNextFocus),
      PreviousFocusIntent: CallbackAction<PreviousFocusIntent>(
          onInvoke: _handleGridPreviousFocus),
      DirectionalFocusIntent: CallbackAction<DirectionalFocusIntent>(
          onInvoke: _handleDirectionFocus),
    };

    dayGridFocus = FocusNode(debugLabel: 'Day Grid');
  }

  @override
  Widget build(BuildContext context) => FocusableActionDetector(
        shortcuts: shortcutMap,
        actions: actionMap,
        focusNode: dayGridFocus,
        onFocusChange: _handleGridFocusChange,
        child: _FocusedDate(
          date: dayGridFocus.hasFocus ? focusedDay : null,
          scrollDirection: dayGridFocus.hasFocus ? dayTraversalDirection : null,
          child: widget.child,
        ),
      );

  void _handleGridFocusChange(bool focused) => setState(() {
        if (focused) {
          focusedDay ??= widget.initialFocusedDay;
        }
      });

  void _handleGridNextFocus(NextFocusIntent intent) => dayGridFocus
    ..requestFocus()
    ..nextFocus();

  void _handleGridPreviousFocus(PreviousFocusIntent intent) => dayGridFocus
    ..requestFocus()
    ..previousFocus();

  void _handleDirectionFocus(DirectionalFocusIntent intent) {
    assert(focusedDay != null);

    setState(() {
      final DateTime? nextDate = _nextDateInDirection(
        date: focusedDay!,
        direction: intent.direction,
      );

      if (nextDate != null) {
        focusedDay = nextDate;
        dayTraversalDirection = intent.direction;
      }
    });
  }

  static const Map<TraversalDirection, int> _directionOffset =
      <TraversalDirection, int>{
    TraversalDirection.up: -DateTime.daysPerWeek,
    TraversalDirection.right: 1,
    TraversalDirection.down: DateTime.daysPerWeek,
    TraversalDirection.left: -1,
  };

  int _dayDirectionOffset({
    required TraversalDirection traversalDirection,
    required TextDirection textDirection,
  }) {
    TraversalDirection? currentTraversalDirection;

    if (textDirection == TextDirection.rtl) {
      if (traversalDirection == TraversalDirection.left) {
        currentTraversalDirection = TraversalDirection.right;
      } else if (traversalDirection == TraversalDirection.right) {
        currentTraversalDirection = TraversalDirection.left;
      }
    }

    return _directionOffset[currentTraversalDirection!]!;
  }

  DateTime? _nextDateInDirection({
    required DateTime date,
    required TraversalDirection direction,
  }) {
    final TextDirection textDirection = Directionality.of(context);
    final DateTime nextDate = addDaysToDate(
      date: date,
      days: _dayDirectionOffset(
        traversalDirection: direction,
        textDirection: textDirection,
      ),
    );

    if (!nextDate.isBefore(widget.firstDate) &&
        !nextDate.isAfter(widget.lastDate)) {
      return nextDate;
    }

    return null;
  }

  @override
  void dispose() {
    dayGridFocus.dispose();

    super.dispose();
  }
}
