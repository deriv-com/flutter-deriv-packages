part of 'number_pad.dart';

class _NumberPadSingleTextTitle extends StatelessWidget {
  _NumberPadSingleTextTitle(
      {required this.title,
      this.hint,
      this.backgroundColor,
      this.verticalMargin=16,
      this.style,
      this.padding=16,
      this.iconSize,
      this.iconColor});

  final String title;

  /// Key for the [CustomTooltip] Widget.
  final GlobalKey _tooltipKey = GlobalKey();

  /// Message of the [CustomTooltip] Widget.
  final String? hint;
  final Color? backgroundColor;
  final double verticalMargin;
  final TextStyle? style;
  final double padding;
  final double? iconSize;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) => Container(
        color: backgroundColor,
        padding: EdgeInsets.symmetric(vertical: verticalMargin),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Text(
              title,
              style: style,
            ),
            hint != null
                ? Padding(
                    padding: EdgeInsets.only(right: padding),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: CustomTooltip(
                        message: hint!,
                        tooltipKey: _tooltipKey,
                        preferBelow: false,
                        child: Icon(
                          Icons.info_outline,
                          size: iconSize,
                          color: iconColor,
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      );
}
