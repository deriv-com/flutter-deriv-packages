part of 'expandable_bottom_sheet.dart';

class _ExpandableBottomSheetTitleBar extends StatelessWidget {

  const _ExpandableBottomSheetTitleBar({
    required this.labelContractDetails,
    Key? key
    }) : super(key: key);

  final String labelContractDetails;

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
                      child: _ExpandableBottomSheetToggler(),
                    ),
                  ),
                Align(
                  heightFactor: animationController.value,
                  child: Opacity(
                    opacity: animationController.value,
                    child: AppBar(
                      elevation: ThemeProvider.zeroMargin,
                      leading: IconButton(
                        onPressed: () {
                          expandableBottomSheetProvider.onTogglerTap?.call();
                          expandableBottomSheetProvider.controller?.close();
                        },
                        icon: const Icon(Icons.expand_more),
                      ),
                      title: Text(labelContractDetails),
                    ),
                  ),
                ),
              ],
            ),
          )
        : _buildTitleBar(expandableBottomSheetProvider);
  }

  Widget _buildTitleBar(
    ExpandableBottomSheetProvider expandableBottomSheetProvider,
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
                  _ExpandableBottomSheetToggler(),
                _ExpandableBottomSheetTitle(),
              ],
            ),
            if (_isLeftActionVisible(expandableBottomSheetProvider))
              Positioned(
                child: expandableBottomSheetProvider.leftAction!,
                top: expandableBottomSheetTogglerHeight,
                left: ThemeProvider.margin16,
              ),
            if (_isRightActionVisible(expandableBottomSheetProvider))
              Positioned(
                child: expandableBottomSheetProvider.rightAction!,
                top: expandableBottomSheetTogglerHeight,
                right: ThemeProvider.margin16,
              ),
            Positioned(
              child: _ExpandableBottomSheetHintButton(),
              top: expandableBottomSheetTogglerHeight,
              right: ThemeProvider.margin16,
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
