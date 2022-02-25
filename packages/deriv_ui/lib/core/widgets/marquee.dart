import 'package:flutter/material.dart';

/// Marquee widget.
///
/// Adds a scrolling area to a widget, you can control what happens when the child widget reaches the edges of its content area.
class Marquee extends StatefulWidget {
  /// Initializes Marquee.
  ///
  /// [child] widget is required.
  const Marquee({
    required this.child,
    this.enabled = true,
    this.direction = Axis.horizontal,
    this.animationDuration = const Duration(milliseconds: 2600),
    this.backDuration = const Duration(milliseconds: 800),
    this.pauseDuration = const Duration(milliseconds: 1000),
    Key? key,
  }) : super(key: key);

  /// Child widget.
  final Widget child;

  /// Enables marquee.
  final bool enabled;

  /// Scroll direction.
  final Axis direction;

  /// Scroll duration.
  final Duration animationDuration;

  /// Back to start duration.
  final Duration backDuration;

  /// Pause duration.
  final Duration pauseDuration;

  @override
  _MarqueeState createState() => _MarqueeState();
}

class _MarqueeState extends State<Marquee> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();

    if (widget.enabled) {
      WidgetsBinding.instance?.addPostFrameCallback((_) => _scrollContent());
    }
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: widget.child,
        scrollDirection: widget.direction,
        controller: _scrollController,
      );

  Future<void> _scrollContent() async {
    while (_scrollController.hasClients) {
      await Future<void>.delayed(widget.pauseDuration);

      if (_scrollController.hasClients) {
        await _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: widget.animationDuration,
          curve: Curves.linear,
        );
      }

      await Future<void>.delayed(widget.pauseDuration);

      if (_scrollController.hasClients) {
        await _scrollController.animateTo(
          0,
          duration: widget.backDuration,
          curve: Curves.linear,
        );
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }
}
