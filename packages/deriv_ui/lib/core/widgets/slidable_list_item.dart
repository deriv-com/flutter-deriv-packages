import 'dart:async';

import 'package:flutter/material.dart';

/// Slidable list item widget.
class SlidableListItem extends StatefulWidget {
  /// Slidable list item widget
  ///
  /// This widget enables actions in swipe [child]
  /// [actions] is a list of widgets that will be shown on swipe left.
  const SlidableListItem({
    required this.child,
    this.actions,
    this.autoCloseDelay,
    Key? key,
  }) : super(key: key);

  /// List item widget.
  final Widget child;

  /// Actions list
  ///
  ///  Default value is an empty widget list.
  final List<Widget>? actions;

  /// After opening the item will get closed automatically after this duration.
  ///
  /// The default is `null`, which means it won't auto-close.
  final Duration? autoCloseDelay;

  @override
  _SlidableListItemState createState() => _SlidableListItemState();
}

class _SlidableListItemState extends State<SlidableListItem>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<Offset> _animation;

  Timer? _autoCloseTimer;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );

    _animation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: Offset(-0.2 * (widget.actions?.length ?? 0), 0),
    ).animate(
      CurveTween(curve: Curves.decelerate).animate(_animationController),
    );

    if (widget.autoCloseDelay != null) {
      _setupAutoCloseTimer(widget.autoCloseDelay!);
    }
  }

  @override
  Widget build(BuildContext context) => widget.actions == null
      ? widget.child
      : GestureDetector(
          onHorizontalDragUpdate: (DragUpdateDetails data) =>
              _onHorizontalDragUpdate(context: context, data: data),
          onHorizontalDragEnd: _onHorizontalDragEnd,
          child: Stack(
            children: <Widget>[
              SlideTransition(position: _animation, child: widget.child),
              Positioned.fill(
                child: LayoutBuilder(
                  builder: (_, BoxConstraints constraint) => AnimatedBuilder(
                    animation: _animationController,
                    builder: (_, Widget? child) => Stack(
                      children: <Widget>[
                        Positioned(
                          right: 0,
                          top: 0,
                          bottom: 0,
                          width: constraint.maxWidth * _animation.value.dx * -1,
                          child: Row(
                            children: widget.actions!
                                .map((Widget child) => Expanded(child: child))
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );

  void _setupAutoCloseTimer(Duration duration) =>
      _animationController.addStatusListener(
        (AnimationStatus status) {
          if (status == AnimationStatus.completed) {
            if (_isItemOpen) {
              _autoCloseTimer = Timer(
                duration,
                () => _animationController.animateTo(0),
              );
            } else {
              _autoCloseTimer?.cancel();
            }
          }
        },
      );

  bool get _isItemOpen => _animationController.value > 0.9;

  void _onHorizontalDragUpdate({
    required BuildContext context,
    required DragUpdateDetails data,
  }) =>
      setState(() => _animationController.value -=
          data.primaryDelta! / context.size!.width);

  void _onHorizontalDragEnd(DragEndDetails data) {
    if (data.primaryVelocity! > 250) {
      // Close menu on fast swipe in the right direction
      _animationController.animateTo(0);
    } else if (_animationController.value >= 0.5 ||
        data.primaryVelocity! < -250) {
      // Fully open if dragged a lot to left or on fast swipe to left
      _animationController.animateTo(1);
    } else {
      // Close if none of above
      _animationController.animateTo(0);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _autoCloseTimer?.cancel();
    super.dispose();
  }
}
