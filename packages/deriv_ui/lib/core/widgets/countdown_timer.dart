import 'dart:async';

import 'package:flutter/material.dart';

/// Countdown timer widget
class CountdownTimer extends StatefulWidget {
  /// Countdown timer is a widget to show animated time.
  ///
  /// [endTime] will be used for duration calculation.
  /// [widgetBuilder] indicates widget that shows result.
  /// If you want to show `hour` part set [showHour] to true.
  /// [showTimePartLabels] determines whether you want to showtime separator or time part labels.
  /// [onCountdownFinished] will be called when countdown reaches to zero.
  const CountdownTimer({
    required this.startTime,
    required this.endTime,
    required this.widgetBuilder,
    Key? key,
    this.showDay = false,
    this.showHour = false,
    this.showSecond = true,
    this.showTimePartLabels = false,
    this.onCountdownFinished,
    this.formatDuration,
  }) : super(key: key);

  /// Start time.
  final DateTime startTime;

  /// End time.
  final DateTime endTime;

  /// Shows day.
  ///
  /// Default value is `false`
  final bool showDay;

  /// Shows hour.
  ///
  /// Default value is `false`.
  final bool showHour;

  /// Shows second.
  ///
  /// Default value is `true`.
  final bool showSecond;

  /// Shows time labels.
  ///
  /// Default value is `false`.
  final bool showTimePartLabels;

  /// Timer container widget builder.
  final Widget Function(Duration value, String formattedValue) widgetBuilder;

  /// Formats a duration to time function
  final String Function(Duration value)? formatDuration;

  /// On countdown finished callback.
  final VoidCallback? onCountdownFinished;

  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  Timer? _timer;
  late Duration _difference;

  @override
  void initState() {
    super.initState();

    _startCounter();
  }

  @override
  Widget build(BuildContext context) =>
      widget.widgetBuilder(_difference, widget.formatDuration!(_difference));

  void _startCounter() {
    DateTime endTime = widget.endTime.toUtc();

    if (widget.endTime.compareTo(widget.startTime) == -1) {
      endTime = widget.startTime.toUtc();
    }

    _difference = endTime.difference(widget.startTime);

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_difference.inSeconds <= 0) {
        _timer?.cancel();

        widget.onCountdownFinished?.call();
      } else {
        setState(() {
          _difference = Duration(seconds: _difference.inSeconds - 1);
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();

    super.dispose();
  }
}
