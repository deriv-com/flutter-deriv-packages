part of 'expandable_bottom_sheet.dart';

class _ExpandableBottomSheetLowerContent extends StatelessWidget {
  const _ExpandableBottomSheetLowerContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ExpandableBottomSheetProvider provider =
        ExpandableBottomSheetProvider.of(context)!;

    return StreamBuilder<double>(
      stream: provider.controller?.heightStream,
      initialData: provider.controller?.height,
      builder: (BuildContext context, AsyncSnapshot<double> snapshot) =>
          AnimatedContainer(
        curve: Curves.easeOut,
        duration: provider.changeStateDuration!,
        height: snapshot.data,
        child: provider.lowerContent,
      ),
    );
  }
}
