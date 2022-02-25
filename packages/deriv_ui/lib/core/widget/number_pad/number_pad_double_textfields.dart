part of 'number_pad.dart';

class _NumberPadDoubleTextFields extends StatelessWidget {
  const _NumberPadDoubleTextFields({
    required this.firstTitleValue,
    required this.secondTitleValue,
    this.paddingFirstTitle = const EdgeInsets.all(0),
    this.paddingSecondTitle = const EdgeInsets.all(0),
    this.currencyTextStyle,
    this.numberPadFieldModelFirst,
    this.numberPadFieldModelSecond,
  });

  final String firstTitleValue;
  final String secondTitleValue;
  final EdgeInsetsGeometry? paddingFirstTitle;
  final EdgeInsetsGeometry? paddingSecondTitle;

  final NumberPadFieldModel? numberPadFieldModelFirst;
  final NumberPadFieldModel? numberPadFieldModelSecond;

  final TextStyle? currencyTextStyle;

  @override
  Widget build(BuildContext context) {
    final _NumberPadProvider? numPadProvider = _NumberPadProvider.of(context);

    return Row(
      children: <Widget>[
        Expanded(
          child: Center(
            child: Padding(
              padding: paddingFirstTitle??const EdgeInsets.all(0),
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
              padding: paddingSecondTitle??const EdgeInsets.all(0),
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
            padding: const EdgeInsets.only(
              right: 24,
            ),
            child: Text(
              getStringWithMappedCurrencyName(numPadProvider.currency),
              style: currencyTextStyle,
            ),
          ),
        ),
      ],
    );
  }
}
