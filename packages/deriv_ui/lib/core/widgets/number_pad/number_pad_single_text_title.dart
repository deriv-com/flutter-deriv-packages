part of 'number_pad.dart';

class _NumberPadSingleTextTitle extends StatelessWidget {
  _NumberPadSingleTextTitle(
      {required this.title,
      this.hint,
      this.backgroundColor = LightThemeColors.base07,
      this.verticalPadding = 16,
      this.style,
      this.rightPadding = 16,
      this.iconSize = 24,
      this.iconColor = LightThemeColors.base04});

  final String title;

  /// Key for the [CustomTooltip] Widget.
  final GlobalKey _tooltipKey = GlobalKey();

  /// Message of the [CustomTooltip] Widget.
  final String? hint;
  final Color? backgroundColor;
  final double? verticalPadding;
  final TextStyle? style;
  final double? rightPadding;
  final double? iconSize;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) => Container(
        color: backgroundColor,
        padding: EdgeInsets.symmetric(vertical: verticalPadding ?? 16),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Text(
              title,
              style: style,
            ),
            hint != null
                ? Padding(
                    padding: EdgeInsets.only(right: rightPadding ?? 16),
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
