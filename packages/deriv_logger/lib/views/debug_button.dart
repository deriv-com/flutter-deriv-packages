import 'package:deriv_logger/views/logger_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

/// Button for debug overlay
class DebugOverlayButton extends StatefulWidget {
  /// Instance of BUtton
  const DebugOverlayButton({
    required this.child,
    required this.onTap,
    required this.theme,
    super.key,
  });
  final Widget child;
  final Function() onTap;
  final DebugOverlayTheme theme;

  @override
  State<DebugOverlayButton> createState() => _DebugOverlayButtonState();
}

class _DebugOverlayButtonState extends State<DebugOverlayButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final SimulationCalculator _simulationCalculator = SimulationCalculator();
  Alignment _dragAlignment = Alignment.centerRight;

  void _runAnimation(Offset pixelsPerSecond, Size size) {
    _controller
        .drive(AlignmentTween(begin: _dragAlignment, end: _dragAlignment));
    _setSide();
    final SpringSimulation simulation =
        _simulationCalculator.calculateSimulation(pixelsPerSecond, size);
    _controller.animateWith(simulation);
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _setSide();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onPanDown: (DragDownDetails details) => _controller.stop(),
      onPanUpdate: (DragUpdateDetails details) => _setPosition(details, size),
      onPanEnd: (DragEndDetails details) =>
          _runAnimation(details.velocity.pixelsPerSecond, size),
      onTap: widget.onTap,
      child: Align(
        alignment: _dragAlignment,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: widget.theme.primaryColor,
            shape: BoxShape.circle,
          ),
          child: widget.child,
        ),
      ),
    );
  }

  void _setSide() {
    final bool isLeft = _dragAlignment.x < 0.0;
    if (isLeft) {
      setState(() => _dragAlignment = Alignment(-0.95, _dragAlignment.y));
    } else {
      setState(() => _dragAlignment = Alignment(0.95, _dragAlignment.y));
    }
  }

  void _setPosition(DragUpdateDetails details, Size size) {
    setState(
      () {
        _dragAlignment += Alignment(
          details.delta.dx / (size.width / 2),
          details.delta.dy / (size.height / 2),
        );
      },
    );
  }
}

/// Simulation calculator for UI.
class SimulationCalculator {
  /// Calculates the position of the gesture.
  SpringSimulation calculateSimulation(Offset pixelsPerSecond, Size size) {
    final double unitsPerSecondX = pixelsPerSecond.dx / size.width;
    final double unitsPerSecondY = pixelsPerSecond.dy / size.height;
    final Offset unitsPerSecond = Offset(unitsPerSecondX, unitsPerSecondY);
    final double unitVelocity = unitsPerSecond.distance;

    const SpringDescription spring =
        SpringDescription(mass: 30, stiffness: 1, damping: 1);
    final SpringSimulation simulation =
        SpringSimulation(spring, 0, 1, -unitVelocity);
    return simulation;
  }
}
