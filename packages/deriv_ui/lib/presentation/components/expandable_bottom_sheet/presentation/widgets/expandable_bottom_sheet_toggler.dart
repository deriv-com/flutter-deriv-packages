part of 'expandable_bottom_sheet.dart';

class _ExpandableBottomSheetToggler extends StatelessWidget {
  const _ExpandableBottomSheetToggler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ExpandableBottomSheetProvider expandableBottomSheetProvider =
        ExpandableBottomSheetProvider.of(context)!;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onVerticalDragUpdate: expandableBottomSheetProvider.onVerticalDragUpdate,
      onVerticalDragEnd: expandableBottomSheetProvider.onVerticalDragEnd,
      child: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(
            vertical: ThemeProvider.margin08,
            horizontal: ThemeProvider.margin32,
          ),
          height: ThemeProvider.margin04,
          width: ThemeProvider.margin40,
          decoration: BoxDecoration(
            color: context.theme.colors.active,
            borderRadius: BorderRadius.circular(ThemeProvider.borderRadius04),
          ),
        ),
      ),
      onTap: expandableBottomSheetProvider.onTogglerTap,
    );
  }
}
