part of 'expandable_bottom_sheet.dart';

class _ExpandableBottomSheetTitleBar extends StatelessWidget {
  const _ExpandableBottomSheetTitleBar(
      {Key? key,
      this.leftPosition = 16,
      this.rightPosition = 16,
      this.rightPositionForButton=16})
      : super(key: key);
  final double leftPosition;
  final double rightPosition;
  final double rightPositionForButton;

  @override
  Widget build(BuildContext context) {
    final ExpandableBottomSheetProvider expandableBottomSheetProvider =
        ExpandableBottomSheetProvider.of(context)!;
    final AnimationController animationController =
        expandableBottomSheetProvider.controller!.animationController!;

    return (expandableBottomSheetProvider.fullScreenMode != null &&
            expandableBottomSheetProvider.fullScreenMode!)
        ? AnimatedBuilder(
            animation: animationController,
            builder: (BuildContext animatedBuilderContext, _) => Column(
              children: <Widget>[
                if (expandableBottomSheetProvider.showToggler)
                  Align(
                    heightFactor: 1 - animationController.value,
                    child: Opacity(
                      opacity: 1 - animationController.value,
                      child: const _ExpandableBottomSheetToggler( ),
                    ),
                  ),
                Align(
                  heightFactor: animationController.value,
                  child: Opacity(
                    opacity: animationController.value,
                    child: AppBar(
                      elevation: 0,
                      leading: IconButton(
                        onPressed: () {
                          expandableBottomSheetProvider.onTogglerTap?.call();
                          expandableBottomSheetProvider.controller?.close();
                        },
                        icon: const Icon(Icons.expand_more),
                      ),
                      title: Text(context.localization.labelContractDetails),
                    ),
                  ),
                ),
              ],
            ),
          )
        : _buildTitleBar(expandableBottomSheetProvider,leftPosition,rightPosition,rightPositionForButton);
  }

  Widget _buildTitleBar(
    ExpandableBottomSheetProvider expandableBottomSheetProvider,
    double leftPosition,
    double rightPosition,
    double rightPositionForButton,
  ) {
    final double expandableBottomSheetTogglerHeight =
        expandableBottomSheetProvider.showToggler ? 20 : 0;

    return StreamBuilder<bool>(
      stream: expandableBottomSheetProvider.controller?.hintStateStream,
      initialData: false,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) =>
          Container(
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                if (expandableBottomSheetProvider.showToggler)
                  const _ExpandableBottomSheetToggler(),
                const _ExpandableBottomSheetTitle(),
              ],
            ),
            if (_isLeftActionVisible(expandableBottomSheetProvider))
              Positioned(
                child: expandableBottomSheetProvider.leftAction!,
                top: expandableBottomSheetTogglerHeight,
                left: leftPosition,
              ),
            if (_isRightActionVisible(expandableBottomSheetProvider))
              Positioned(
                child: expandableBottomSheetProvider.rightAction!,
                top: expandableBottomSheetTogglerHeight,
                right: rightPosition,
              ),
            Positioned(
              child: _ExpandableBottomSheetHintButton(),
              top: expandableBottomSheetTogglerHeight,
              right: rightPositionForButton,
            ),
          ],
        ),
      ),
    );
  }

  bool _isLeftActionVisible(ExpandableBottomSheetProvider provider) =>
      provider.title != null && provider.leftAction != null;

  bool _isRightActionVisible(ExpandableBottomSheetProvider provider) =>
      provider.title != null &&
      provider.hint == null &&
      provider.rightAction != null;
}
