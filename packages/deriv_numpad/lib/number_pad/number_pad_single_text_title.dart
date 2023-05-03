part of 'number_pad.dart';

class _NumberPadSingleTextTitle extends StatelessWidget {
  const _NumberPadSingleTextTitle({
    required this.title,
    this.dialogDescription,
    this.leading,
  });

  final String title;

  /// Message of the [InfoIconButton] Widget.
  final String? dialogDescription;

  /// The widget on the extreme left of this [_NumberPadSingleTextTitle].
  final Widget? leading;

  @override
  Widget build(BuildContext context) => Container(
        color: context.theme.base07Color,
        padding: const EdgeInsets.symmetric(vertical: ThemeProvider.margin16),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: ThemeProvider.margin16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: leading ?? const SizedBox.shrink(),
              ),
            ),
            Text(
              title,
              style: context.theme.textStyle(textStyle: TextStyles.subheading),
            ),
            Padding(
              padding: const EdgeInsets.only(right: ThemeProvider.margin16),
              child: Align(
                alignment: Alignment.centerRight,
                child: dialogDescription != null
                    ? InfoIconButton(
                        dialogTitle: title,
                        dialogDescription: dialogDescription,
                        actionOK:
                            _NumberPadProvider.of(context)!.label.actionOK,
                      )
                    : const SizedBox.shrink(),
              ),
            )
          ],
        ),
      );
}
