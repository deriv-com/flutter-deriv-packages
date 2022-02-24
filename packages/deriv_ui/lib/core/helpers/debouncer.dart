import 'dart:async';

/// Debouncer class adds some delay before performing an action such as tapping
/// a button.
class Debouncer {
  /// This is called to add a delay equals to the passed [delay] before
  /// executing an action.
  Debouncer({this.delay = const Duration(milliseconds: 300)});

  /// The total delay time in ms.
  final Duration delay;

  Timer? _timer;

  /// Runs the debouncer.
  void run(
    Function() action, {
    Duration? delay,
  }) {
    _timer?.cancel();
    _timer = Timer(delay ?? this.delay, action);
  }

  /// Cancels the debouncer.
  void cancel() => _timer?.cancel();
}
