part of 'expandable_bottom_sheet.dart';

class _ExpandableBottomSheetHintButton extends StatelessWidget {

  _ExpandableBottomSheetHintButton({Key? key}) : super(key: key);

  final GlobalKey _hintKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final ExpandableBottomSheetProvider expandableBottomSheetProvider =
        ExpandableBottomSheetProvider.of(context)!;

    return expandableBottomSheetProvider.title == null ||
            expandableBottomSheetProvider.hint == null
        ? const SizedBox.shrink()
        : Padding(
            padding:
                const EdgeInsets.symmetric(vertical: ThemeProvider.margin12),
            child: ClipOval(
              child: Material(
                color: Colors.transparent,
                child: CustomTooltip(
                  message: expandableBottomSheetProvider.hint ?? '',
                  tooltipKey: _hintKey,
                  preferBelow: false,
                  child: Icon(
                    Icons.info_outline,
                    size: ThemeProvider.iconSize24,
                    color: context.theme.colors.disabled,
                  ),
                ),
              ),
            ),
          );
  }
}
