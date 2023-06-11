import 'package:flutter/material.dart';

const int _maxTapCount = 6;
const int _tapIntervalTimeout = 5;

/// Setting gesture detector is a widget that opens app setting by tapping several times.
class AppSettingGestureDetector extends StatefulWidget {
  /// Initializes setting gesture detector
  const AppSettingGestureDetector({
    required this.child,
    required this.onTapNavigation,
    Key? key,
    this.enable = true,
  }) : super(key: key);

  /// Child widget for [AppSettingGestureDetector].
  final Widget child;
  
  /// The navigation Function after the clicks
  final Function onTapNavigation;

  /// Enables tapping.
  /// The default value is `true`.
  final bool enable;

  @override
  _AppSettingGestureDetectorState createState() =>
      _AppSettingGestureDetectorState();
}

class _AppSettingGestureDetectorState extends State<AppSettingGestureDetector> {
  int _tapCount = 0;

  @override
  Widget build(BuildContext context) => GestureDetector(
        child: widget.child,
        onTap: widget.enable ? _onTap : null,
      );

  void _onTap() {
    _tapCount++;

    if (_tapCount == _maxTapCount) {
      _tapCount = 0;

      widget.onTapNavigation();
    } else {
      if (_tapCount == 1) {
        Future<int>.delayed(
          const Duration(seconds: _tapIntervalTimeout),
          () => _tapCount = 0,
        );
      }
    }
  }
}
