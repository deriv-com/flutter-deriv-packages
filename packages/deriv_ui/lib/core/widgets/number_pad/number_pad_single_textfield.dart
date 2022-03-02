part of 'number_pad.dart';

class _NumberPadSingleTextField extends StatelessWidget {
  const _NumberPadSingleTextField(
      {required this.title,
      required this.style,
      this.margin = 24,
      this.label = '',
      this.numberPadFieldModel= const NumberPadFieldModel(),
      this.currencyLabelStyle});

  final String title;
  final double margin;
  final TextStyle style;

  final NumberPadFieldModel? numberPadFieldModel;
  final String label;
  final TextStyle? currencyLabelStyle;

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
    final _NumberPadProvider? numPadProvider = _NumberPadProvider.of(context);

    final Size labelSize = getTextSize(
      numPadProvider?.currency ?? '',
      style,
      context,
    );

    return Column(
      children: <Widget>[
        title.isEmpty
            ? const SizedBox.shrink()
            : _NumberPadSingleTextTitle(
                hint: informTradeAmountHint,
                title: title,
              ),
        Row(
          children: <Widget>[
            Expanded(
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  final Size textSize = getTextSize(
                    numPadProvider?.firstInputController?.text ?? '',
                    style,
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
                            focusNode: numPadProvider.firstInputFocusNode,
                            inputValidator: numPadProvider.isFirstInputInRange,
                            label: label,
                            numberPadFieldModel: numberPadFieldModel,
                          ),
                        )
                      : const SizedBox.shrink();
                },
              ),
            ),
            numPadProvider != null
                ? Padding(
                    padding: EdgeInsets.only(
                      right: margin,
                    ),
                    child: Text(
                      getStringWithMappedCurrencyName(numPadProvider.currency),
                      style: currencyLabelStyle,
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ],
    );
  }
}
