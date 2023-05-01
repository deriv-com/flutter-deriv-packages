part of 'expandable_bottom_sheet.dart';

class _ExpandableBottomSheetTitle extends StatelessWidget {
  const _ExpandableBottomSheetTitle({required this.themeProvider, Key? key}) : super(key: key);

  final ThemeProvider themeProvider;

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
                style: themeProvider.textStyle(
                  textStyle: TextStyles.subheading,
                  color: themeProvider.colors.prominent,
                ),
              ),
            ),
            onTap: expandableBottomSheetProvider.fullScreenMode!
                ? null
                : expandableBottomSheetProvider.onTogglerTap,
          );
  }
}
