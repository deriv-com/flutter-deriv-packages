part of 'package:deriv_ui/core/widgets/interchangeable_list/interchangeable_list.dart';

class _InterchangeableItemAnimation {
  // ignore: avoid_void_async
  static void start({
    required BuildContext context,
    required Widget transitionOverlay,
    required int startItemIndex,
    required int endItemIndex,
    required GlobalKey<AnimatedListState> startingListKey,
    required GlobalKey<AnimatedListState> endingListKey,
    required Duration waitDuration,
    required Duration duration,
    required double list2ItemHeight,
    double? header2Height = 0,
    Function? postAnimationCallback,
    bool shouldInsertLastElement = true,
  }) async {
    // Declarations:
    int _flyingCount = 0;
    final GlobalKey globalKey = GlobalKey();

    // Remove actual item from the initial list:
    startingListKey.currentState!.removeItem(
      startItemIndex,
      (BuildContext context, Animation<double> animation) =>
          const SizedBox.shrink(),
    );

    // Insert an overlay item in the initial list to show it temporarily:
    startingListKey.currentState!.insertItem(startItemIndex);

    // Wait for the specified duration:
    await Future<void>.delayed(waitDuration);

    // Now, remove the temporary overlay item to start animating towards new list.
    startingListKey.currentState!.removeItem(
      startItemIndex,
      (BuildContext context, Animation<double> animation) => SizeTransition(
        sizeFactor: animation,
        child: Opacity(
          key: globalKey,
          opacity: 0,
          child: transitionOverlay,
        ),
      ),
    );

    _flyingCount++;

    // Do some magic math:
    WidgetsBinding.instance!.addPostFrameCallback((Duration timeStamp) async {
      // Find the starting position of the moving item, which is exactly the
      // gap its leaving behind, in the original list.
      final RenderBox box1 =
          globalKey.currentContext!.findRenderObject() as RenderBox;
      final Offset pos1 = box1.localToGlobal(Offset.zero);
      // Find the destination position of the moving item, which is at the
      // end of the destination list.
      final RenderBox box2 =
          endingListKey.currentContext!.findRenderObject() as RenderBox;

      final double box2height = endItemIndex == 0
          ? ((header2Height ?? 0) - (list2ItemHeight * (_flyingCount + 1)))
          : ((endItemIndex - _flyingCount) * list2ItemHeight) +
              (header2Height ?? 0);
      final Offset pos2 = box2.localToGlobal(Offset(0, box2height));
      // Insert an overlay to "fly over" the item between two lists.
      final OverlayEntry entry = OverlayEntry(
        builder: (BuildContext context) => TweenAnimationBuilder<Offset>(
          tween: Tween<Offset>(begin: pos1, end: pos2),
          duration: duration,
          builder: (_, Offset value, Widget? child) => Positioned(
            left: value.dx,
            top: value.dy,
            child: transitionOverlay,
          ),
        ),
      );

      // Start Overlay animation and remove on end.
      Overlay.of(context)!.insert(entry);
      await Future<void>.delayed(duration);
      entry.remove();

      // Finally, add the item to next list after animation is done.
      if (shouldInsertLastElement) {
        endingListKey.currentState!.insertItem(endItemIndex);
      }
      _flyingCount--;

      postAnimationCallback?.call();
    });
  }
}
