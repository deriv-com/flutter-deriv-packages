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

  /// [bool] to see if the list should insert last element.
  late bool? shouldInsertLastElement;

  /// Change Notifier tp call Animate function.
  void animateItems({
    required int fromIndex,
    required int toIndex,
    required Widget transitionOverlay,
    Duration duration = const Duration(seconds: 1),
    Duration waitDuration = const Duration(seconds: 1),
    Function? postAnimationCallback,
    bool? shouldInsertLastElement,
  }) {
    this.fromIndex = fromIndex;
    this.toIndex = toIndex;
    this.transitionOverlay = transitionOverlay;
    this.duration = duration;
    this.waitDuration = waitDuration;
    this.postAnimationCallback = postAnimationCallback;
    this.shouldInsertLastElement = shouldInsertLastElement;
    notifyListeners();
  }
}

/// Class with two animated lists that perform a transition animation.
class InterchangeableList extends StatefulWidget {
  /// Constructor.
  InterchangeableList({
    required this.listOneItemBuilder,
    required this.listTwoItemBuilder,
    required this.listOneInitialCount,
    required this.listTwoInitialCount,
    required this.listTwoItemHeight,
    required this.controller,
    GlobalKey<AnimatedListState>? listOneKey,
    GlobalKey<AnimatedListState>? listTwoKey,
    this.header1,
    this.header2,
    this.header2Height,
  }) {
    this.listOneKey = listOneKey ?? GlobalKey<AnimatedListState>();
    this.listTwoKey = listTwoKey ?? GlobalKey<AnimatedListState>();
  }

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

  /// Height of item used in list two.
  // Assuming all items have same height.
  final double listTwoItemHeight;

  /// Height for second header.
  final double? header2Height;

  /// Controller to manually call animate method.
  final InterchangeableListController controller;

  /// [GlobalKey<AnimatedListState>] for list two.
  late final GlobalKey<AnimatedListState> listOneKey;

  /// [GlobalKey<AnimatedListState>] for list two.
  late final GlobalKey<AnimatedListState> listTwoKey;

  @override
  State<InterchangeableList> createState() => _InterchangeableListState();
}

class _InterchangeableListState extends State<InterchangeableList> {
  int? _currentlyAnimatingIndex;
  Widget? _transitionOverlay;
  // TODO(huned-deriv): use this _transitioningItem map to insert list of animations and manage them.
  // final Map<int, Widget> _transitioningItem = <int, Widget>{};

  @override
  void initState() {
    widget.controller.addListener(() {
      _animateObject(
        fromIndex: widget.controller.fromIndex,
        toIndex: widget.controller.toIndex,
        transitionOverlay: widget.controller.transitionOverlay,
        duration: widget.controller.duration,
        waitDuration: widget.controller.waitDuration,
        list2ItemHeight: widget.listTwoItemHeight,
        header2Height: widget.header2Height,
        postAnimationCallback: widget.controller.postAnimationCallback,
        shouldInsertLastElement: widget.controller.shouldInsertLastElement,
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
              //if (_transitioningItem.containsKey(index)) {
              // return _transitioningItem[index]!;
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
            key: widget.listOneKey,
          ),
          const SizedBox(height: 20),
          _buildListHeader(
            itemCount: widget.listTwoInitialCount,
            title: widget.header2,
          ),
          _buildAnimatedList(
            initialItemCount: widget.listTwoInitialCount,
            builder: widget.listTwoItemBuilder,
            key: widget.listTwoKey,
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
        physics: const NeverScrollableScrollPhysics(),
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
    required double list2ItemHeight,
    Function? postAnimationCallback,
    double? header2Height,
    bool? shouldInsertLastElement,
  }) {
    // _transitioningItem.putIfAbsent(fromIndex, () => transitionOverlay);
    _currentlyAnimatingIndex = fromIndex;
    _transitionOverlay = transitionOverlay;
    Future<void>.delayed(waitDuration, () {
      // _transitioningItem.remove(fromIndex);
      _currentlyAnimatingIndex = null;
      _transitionOverlay = null;
    });

    _InterchangeableItemAnimation.start(
      context: context,
      transitionOverlay: transitionOverlay,
      startItemIndex: fromIndex,
      endItemIndex: toIndex,
      startingListKey: widget.listOneKey,
      endingListKey: widget.listTwoKey,
      duration: duration,
      waitDuration: waitDuration,
      list2ItemHeight: list2ItemHeight,
      header2Height: header2Height,
      postAnimationCallback: () => postAnimationCallback?.call(),
      shouldInsertLastElement: shouldInsertLastElement ?? true,
    );
  }
}
