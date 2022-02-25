part of 'expandable_bottom_sheet.dart';

class _ExpandableBottomSheetHintButton extends StatelessWidget {
  _ExpandableBottomSheetHintButton(
      {Key? key, this.padding = 12, this.iconSize = 24, this.iconColor})
      : super(key: key);

  final GlobalKey _hintKey = GlobalKey();
  final double padding;
  final double iconSize;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final ExpandableBottomSheetProvider expandableBottomSheetProvider =
        ExpandableBottomSheetProvider.of(context)!;

    return expandableBottomSheetProvider.title == null ||
            expandableBottomSheetProvider.hint == null
        ? const SizedBox.shrink()
        : Padding(
            padding: EdgeInsets.symmetric(vertical: padding),
            child: ClipOval(
              child: Material(
                color: Colors.transparent,
                child: CustomTooltip(
                  message: expandableBottomSheetProvider.hint ?? '',
                  tooltipKey: _hintKey,
                  preferBelow: false,
                  child: Icon(
                    Icons.info_outline,
                    size: iconSize,
                    color: iconColor,
                  ),
                ),
              ),
            ),
          );
  }
}
