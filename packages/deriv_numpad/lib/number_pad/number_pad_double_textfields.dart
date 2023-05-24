part of 'number_pad.dart';

class _NumberPadDoubleTextFields extends StatelessWidget {
  const _NumberPadDoubleTextFields({
    required this.firstTitleValue,
    required this.secondTitleValue,
  });

  final String firstTitleValue;
  final String secondTitleValue;

  @override
  Widget build(BuildContext context) {
    final _NumberPadProvider? numPadProvider = _NumberPadProvider.of(context);

    return Row(
      children: <Widget>[
        Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(
                left: ThemeProvider.margin24,
                top: ThemeProvider.margin24,
                bottom: ThemeProvider.margin24,
              ),
              child: _NumberPadTextField(
                controller: numPadProvider!.firstInputController,
                textStyle: TextStyles.subheading,
                focusNode: numPadProvider.firstInputFocusNode,
                inputValidator: numPadProvider.isFirstInputInRange,
                label: firstTitleValue,
              ),
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: ThemeProvider.margin24,
                horizontal: ThemeProvider.margin08,
              ),
              child: _NumberPadTextField(
                controller: numPadProvider.secondInputController,
                textStyle: TextStyles.subheading,
                focusNode: numPadProvider.secondInputFocusNode,
                inputValidator: numPadProvider.isSecondInputInRange,
                label: secondTitleValue,
              ),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(
              right: ThemeProvider.margin24,
            ),
            child: Text(
              getStringWithMappedCurrencyName(numPadProvider.currency),
              style: context.theme.textStyle(
                textStyle: TextStyles.headlineNormal,
                color: context.theme.colors.disabled,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
