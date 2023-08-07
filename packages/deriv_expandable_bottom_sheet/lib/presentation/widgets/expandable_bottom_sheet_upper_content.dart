part of 'expandable_bottom_sheet.dart';

/// Function signature for `HeightCalculatedHandler`.
typedef HeightCalculatedHandler = void Function(double);

class _ExpandableBottomSheetUpperContent extends StatefulWidget {
  const _ExpandableBottomSheetUpperContent({
    required this.onHeightCalculated,
    this.onHeightChanged,
    Key? key,
  }) : super(key: key);

  final HeightCalculatedHandler onHeightCalculated;
  final VoidCallback? onHeightChanged;

  @override
  _ExpandableBottomSheetUpperContentState createState() =>
      _ExpandableBottomSheetUpperContentState();
}

class _ExpandableBottomSheetUpperContentState
    extends State<_ExpandableBottomSheetUpperContent> {
  @override
  Widget build(BuildContext context) {
    final Widget? upperContent =
        ExpandableBottomSheetProvider.of(context)?.upperContent;

    return Builder(
      builder: (BuildContext context) {
        SchedulerBinding.instance!.addPostFrameCallback(
          (_) => widget.onHeightCalculated(context.size!.height),
        );

        return NotificationListener<LayoutChangedNotification>(
          onNotification: (_) => _heightChangeHandler(context),
          child: SizeChangedLayoutNotifier(
            child: upperContent ?? const SizedBox.shrink(),
          ),
        );
      },
    );
  }

  bool _heightChangeHandler(BuildContext context) {
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      if (mounted) {
        widget.onHeightCalculated(context.size!.height);
        widget.onHeightChanged?.call();
      }
    });

    return true;
  }
}
