import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'shimmer_direction.dart';

part 'shimmer_filter.dart';

/// A widget that paints shimmer animation on it's child.
class Shimmer extends StatefulWidget {
  /// Widget's constructor.
  Shimmer({
    required this.child,
    required this.baseColor,
    required this.highlightColor,
    Key? key,
    this.duration = const Duration(milliseconds: 1500),
    this.direction = ShimmerDirection.ltr,
    this.loop = 0,
    this.enabled = true,
  })  : gradient = LinearGradient(
          begin: Alignment.topLeft,
          colors: <Color>[
            baseColor,
            baseColor,
            highlightColor,
            baseColor,
            baseColor,
          ],
          stops: const <double>[0, 0.35, 0.5, 0.65, 1],
        ),
        super(key: key);

  /// The widget on which the animation is painted.
  final Widget child;

  /// The duration of each animation loop.
  final Duration duration;

  /// The direction of the animation options: [ShimmerDirection].
  final ShimmerDirection direction;

  /// Gradient generated form colors of the shimmer animation.
  final Gradient gradient;

  /// The number of repeats of the animation, to run forever set to `0`.
  final int loop;

  /// Controls if the animation is active or not.
  final bool enabled;

  /// The basic color of the animation.
  final Color baseColor;

  /// The highlight color of the animation.
  final Color highlightColor;

  @override
  _ShimmerState createState() => _ShimmerState();
}

class _ShimmerState extends State<Shimmer> with SingleTickerProviderStateMixin {
  /// Animation controller.
  late final AnimationController _controller;

  /// The number of cycles that the animation has been repeated.
  int _count = 0;

  /// Handles animation process.
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..addStatusListener((AnimationStatus status) {
        if (status != AnimationStatus.completed) {
          return;
        }

        _count++;

        if (widget.loop <= 0) {
          _controller.repeat();
        } else if (_count < widget.loop) {
          _controller.forward(from: 0);
        }
      });

    if (widget.enabled) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(Shimmer oldWidget) {
  /// Handles if the animation should continue or not.
    if (widget.enabled) {
      _controller.forward();
    } else {
      _controller.stop();
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: _controller,
        child: widget.child,
        builder: (BuildContext context, Widget? child) => _Shimmer(
          child: child,
          direction: widget.direction,
          gradient: widget.gradient,
          percent: _controller.value,
        ),
      );

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }
}

/// The shimmer effect Render Object.
class _Shimmer extends SingleChildRenderObjectWidget {
  const _Shimmer({
    required this.percent,
    required this.direction,
    required this.gradient,
    Widget? child,
  }) : super(child: child);

  /// The completed proportion of one animation loop.
  final double percent;

  /// The direction of the animation options: [ShimmerDirection].
  final ShimmerDirection direction;

  /// Gradient generated form colors of the shimmer animation.
  final Gradient gradient;

  /// Creates the shimmer render object.
  @override
  _ShimmerFilter createRenderObject(BuildContext context) =>
      _ShimmerFilter(percent, direction, gradient);

  /// Updates the shimmer render object as the animation proceeds.
  @override
  void updateRenderObject(BuildContext context, _ShimmerFilter shimmer) {
    shimmer
      ..percent = percent
      ..gradient = gradient
      ..direction = direction;
  }
}
