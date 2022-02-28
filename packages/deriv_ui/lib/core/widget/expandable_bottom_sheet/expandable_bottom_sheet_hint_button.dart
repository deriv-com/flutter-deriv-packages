part of 'expandable_bottom_sheet.dart';

class _ExpandableBottomSheetHintButton extends StatelessWidget {
  _ExpandableBottomSheetHintButton(
      {Key? key, this.verticalPadding = 12, this.iconSize = 24, this.iconColor=LightThemeColors.base04})
      : super(key: key);

  final GlobalKey _hintKey = GlobalKey();
  final double verticalPadding;
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
            padding: EdgeInsets.symmetric(vertical: verticalPadding),
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
