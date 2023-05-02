part of 'expandable_bottom_sheet.dart';

class _ExpandableBottomSheetTitle extends StatelessWidget {
  const _ExpandableBottomSheetTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ExpandableBottomSheetProvider expandableBottomSheetProvider =
        ExpandableBottomSheetProvider.of(context)!;

    return expandableBottomSheetProvider.title == null
        ? const SizedBox.shrink()
        : GestureDetector(
            behavior: HitTestBehavior.translucent,
            onVerticalDragUpdate:
                expandableBottomSheetProvider.onVerticalDragUpdate,
            onVerticalDragEnd: expandableBottomSheetProvider.onVerticalDragEnd,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: Text(
                expandableBottomSheetProvider.title!,
                style: context.theme.textStyle(
                  textStyle: TextStyles.subheading,
                  color: context.theme.colors.prominent,
                ),
              ),
            ),
            onTap: expandableBottomSheetProvider.fullScreenMode!
                ? null
                : expandableBottomSheetProvider.onTogglerTap,
          );
  }
}
