part of 'number_pad.dart';

class _NumberPadSingleTextField extends StatelessWidget {
  const _NumberPadSingleTextField({
    required this.title,
    this.dialogDescription,
    this.leading,
  });

  final String title;
  final String? dialogDescription;
  final Widget? leading;

  Size getTextSize(
    String text,
    TextStyle style,
    BuildContext context, {
    double? textScaleFactor,
  }) =>
      (TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: 1,
        textScaleFactor: textScaleFactor ?? 1,
        textDirection: ui.TextDirection.ltr,
      )..layout())
          .size;

  @override
  Widget build(BuildContext context) {
    const double margin = ThemeProvider.margin24;

    final _NumberPadProvider? numPadProvider = _NumberPadProvider.of(context);

    final Size labelSize = getTextSize(
      numPadProvider?.currency ?? '',
      TextStyles.headlineNormal,
      context,
    );

    return Column(
      children: <Widget>[
        title.isEmpty
            ? const SizedBox.shrink()
            : _NumberPadSingleTextTitle(
                title: title,
                dialogDescription: dialogDescription,
                leading: leading,
              ),
        Row(
          children: <Widget>[
            Expanded(
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  final Size textSize = getTextSize(
                    numPadProvider?.firstInputController?.text ?? '',
                    TextStyles.display1,
                    context,
                  );
                  double padding = margin + labelSize.width;
                  if (textSize.width + padding > constraints.maxWidth) {
                    padding = margin;
                  }
                  return numPadProvider != null
                      ? Padding(
                          padding: EdgeInsets.only(
                            left: padding,
                          ),
                          child: _NumberPadTextField(
                            controller: numPadProvider.firstInputController,
                            textStyle: TextStyles.display1,
                            focusNode: numPadProvider.firstInputFocusNode,
                            inputValidator: numPadProvider.isFirstInputInRange,
                            textAlign: TextAlign.center,
                          ),
                        )
                      : const SizedBox.shrink();
                },
              ),
            ),
            numPadProvider != null
                ? Padding(
                    padding: const EdgeInsets.only(
                      right: margin,
                    ),
                    child: Text(
                      getStringWithMappedCurrencyName(numPadProvider.currency),
                      style: context.theme.textStyle(
                        textStyle: TextStyles.headlineNormal,
                        color: context.theme.base04Color,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ],
    );
  }
}
