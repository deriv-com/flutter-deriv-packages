part of 'number_pad.dart';

class _NumberPadDoubleTextFields extends StatelessWidget {
  const _NumberPadDoubleTextFields({
    required this.firstTitleValue,
    required this.secondTitleValue,
    this.paddingFirstTitle = const EdgeInsets.only(
      left: 24,
      top: 24,
      bottom: 24,
    ),
    this.paddingSecondTitle = const EdgeInsets.symmetric(
      vertical: 24,
      horizontal: 8,
    ),
    this.currencyTextStyle,
    this.numberPadFieldModelFirst = const NumberPadFieldModel(),
    this.numberPadFieldModelSecond = const NumberPadFieldModel(),
    this.rightPaddingCurrency = 24,
  });

  final String firstTitleValue;
  final String secondTitleValue;
  final EdgeInsetsGeometry? paddingFirstTitle;
  final EdgeInsetsGeometry? paddingSecondTitle;

  final NumberPadFieldModel? numberPadFieldModelFirst;
  final NumberPadFieldModel? numberPadFieldModelSecond;

  final TextStyle? currencyTextStyle;
  final double? rightPaddingCurrency;

  @override
  Widget build(BuildContext context) {
    final _NumberPadProvider? numPadProvider = _NumberPadProvider.of(context);

    return Row(
      children: <Widget>[
        Expanded(
          child: Center(
            child: Padding(
              padding: paddingFirstTitle ??
                  const EdgeInsets.only(
                    left: 24,
                    top: 24,
                    bottom: 24,
                  ),
              child: _NumberPadTextField(
                controller: numPadProvider!.firstInputController,
                focusNode: numPadProvider.firstInputFocusNode,
                inputValidator: numPadProvider.isFirstInputInRange,
                label: firstTitleValue,
                numberPadFieldModel: numberPadFieldModelFirst,
              ),
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Padding(
              padding: paddingSecondTitle ??
                  const EdgeInsets.symmetric(
                    vertical: 24,
                    horizontal: 8,
                  ),
              child: _NumberPadTextField(
                  controller: numPadProvider.secondInputController,
                  focusNode: numPadProvider.secondInputFocusNode,
                  inputValidator: numPadProvider.isSecondInputInRange,
                  label: secondTitleValue,
                  numberPadFieldModel: numberPadFieldModelSecond),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.only(
              right: rightPaddingCurrency ?? 24,
            ),
            child: Text(
              getStringWithMappedCurrencyName(numPadProvider.currency),
              style:
                  currencyTextStyle?.copyWith(color: LightThemeColors.base04),
            ),
          ),
        ),
      ],
    );
  }
}
