import 'dart:async';
import 'package:flutter/material.dart';
part 'package:deriv_ui/core/widgets/interchangeable_list/interchangeable_list_animation.dart';

/// Controller Class for [AnimatedMultiList].
class InterchangeableListController extends ChangeNotifier {
  /// Index on list one start animation from.
  late int fromIndex;

  /// Index on list two to end the animation on.
  late int toIndex;

  /// A [Widget] that gets displayed when transitioning from value list one to list two.
  late Widget transitionOverlay;

  /// [Duration] of transition.
  late Duration duration;

  /// [Duration] of how much time will the [transitionOverlay] stay at initial position before animation begins.
  late Duration waitDuration;

  /// Callback for when the animation finishes.
  late Function? postAnimationCallback;

  /// Change Notifier tp call Animate function.
  void animateItems({
    required int fromIndex,
    required int toIndex,
    required Widget transitionOverlay,
    Duration duration = const Duration(seconds: 1),
    Duration waitDuration = const Duration(seconds: 1),
    Function? postAnimationCallback,
  }) {
    this.fromIndex = fromIndex;
    this.toIndex = toIndex;
    this.transitionOverlay = transitionOverlay;
    this.duration = duration;
    this.waitDuration = waitDuration;
    this.postAnimationCallback = postAnimationCallback;

    notifyListeners();
  }
}

/// Class with two animated lists that perform a transition animation.
class InterchangeableList extends StatefulWidget {
  /// Constructor.
  const InterchangeableList({
    required this.listOneItemBuilder,
    required this.listTwoItemBuilder,
    required this.listOneInitialCount,
    required this.listTwoInitialCount,
    required this.controller,
    this.header1,
    this.header2,
    Key? key,
  }) : super(key: key);

  /// Initial count for list one.
  final int listOneInitialCount;

  /// Initial count for list two.
  final int listTwoInitialCount;

  /// Builder for list one.
  final Widget Function(BuildContext, int, Animation<double>)
      listOneItemBuilder;

  /// Builder for list two.
  final Widget Function(BuildContext, int, Animation<double>)
      listTwoItemBuilder;

  /// Optional header for list one.
  final Widget? header1;

  /// Optional header for list two.
  final Widget? header2;

  /// Controller to manually call animate method.
  final InterchangeableListController controller;

  @override
  State<InterchangeableList> createState() => _InterchangeableListState();
}

class _InterchangeableListState extends State<InterchangeableList> {
  final GlobalKey<AnimatedListState> _startingListKey =
      GlobalKey<AnimatedListState>();
  final GlobalKey<AnimatedListState> _endingListKey =
      GlobalKey<AnimatedListState>();
  int? _currentlyAnimatingIndex;
  Widget? _transitionOverlay;

  @override
  void initState() {
    widget.controller.addListener(() {
      _animateObject(
        fromIndex: widget.controller.fromIndex,
        toIndex: widget.controller.toIndex,
        transitionOverlay: widget.controller.transitionOverlay,
        duration: widget.controller.duration,
        waitDuration: widget.controller.waitDuration,
        postAnimationCallback: widget.controller.postAnimationCallback,
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildListHeader(
            itemCount: widget.listOneInitialCount,
            title: widget.header1,
          ),
          _buildAnimatedList(
            initialItemCount: widget.listOneInitialCount,
            builder:
                (BuildContext context, int index, Animation<double> animation) {
              if (_currentlyAnimatingIndex == index &&
                  _transitionOverlay != null) {
                return _transitionOverlay!;
              } else {
                return widget.listOneItemBuilder(
                  context,
                  index,
                  animation,
                );
              }
            },
            key: _startingListKey,
          ),
          const SizedBox(height: 20),
          _buildListHeader(
            itemCount: widget.listTwoInitialCount,
            title: widget.header2,
          ),
          _buildAnimatedList(
            initialItemCount: widget.listTwoInitialCount,
            builder: widget.listTwoItemBuilder,
            key: _endingListKey,
          ),
        ],
      );

  Widget _buildListHeader({
    required Widget? title,
    required int? itemCount,
  }) =>
      (title == null || itemCount == 0) ? const SizedBox.shrink() : title;

  Widget _buildAnimatedList({
    required int initialItemCount,
    required Widget Function(BuildContext, int, Animation<double>) builder,
    required GlobalKey<AnimatedListState> key,
  }) =>
      AnimatedList(
        shrinkWrap: true,
        key: key,
        initialItemCount: initialItemCount,
        itemBuilder: builder,
      );

  void _animateObject({
    required int fromIndex,
    required int toIndex,
    required Widget transitionOverlay,
    required Duration duration,
    required Duration waitDuration,
    Function? postAnimationCallback,
  }) {
    _currentlyAnimatingIndex = fromIndex;
    _transitionOverlay = transitionOverlay;
    Future<void>.delayed(waitDuration, () {
      _currentlyAnimatingIndex = null;
      _transitionOverlay = null;
    });

    _InterchangeableItemAnimation.start(
      context: context,
      transitionOverlay: transitionOverlay,
      startItemIndex: fromIndex,
      endItemIndexIndex: toIndex,
      startingListKey: _startingListKey,
      endingListKey: _endingListKey,
      duration: duration,
      waitDuration: waitDuration,
      postAnimationCallback: () => postAnimationCallback?.call(),
    );
  }
}
