part of 'expandable_bottom_sheet.dart';

class _ExpandableBottomSheetToggler extends StatelessWidget {
  const _ExpandableBottomSheetToggler(
      {Key? key,
      this.verticalMargin=8,
      this.horizontalMargin=32,
      this.height=4,
      this.width=40,
      this.color,
      this.borderRadius=4})
      : super(key: key);

  final double verticalMargin;
  final double horizontalMargin;
  final double height;
  final double width;
  final Color? color;
  final double borderRadius;

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
          margin:  EdgeInsets.symmetric(
            vertical: verticalMargin,
            horizontal: horizontalMargin,
          ),
          height: width,
          width: height,
          decoration: BoxDecoration(
            color:color,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
      onTap: expandableBottomSheetProvider.onTogglerTap,
    );
  }
}
