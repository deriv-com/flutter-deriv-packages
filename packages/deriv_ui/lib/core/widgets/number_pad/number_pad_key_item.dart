part of 'number_pad.dart';

class _NumberPadKey extends StatelessWidget {
  const _NumberPadKey(
      {required this.onPressed,
      required this.ignoring,
      required this.index,
      this.borderSideColor = LightThemeColors.base08,
      this.backSpaceIconColor = LightThemeColors.base01,
      this.textStyle,
      this.pressTextButtonColor = BrandColors.coral,
      this.withoutPressTextButtonColor = LightThemeColors.base07,
      this.okButtonTitle});

  final Function(BuildContext, TextEditingController, String) onPressed;

  final bool ignoring;

  final int index;
  final Color borderSideColor;
  final Color? backSpaceIconColor;
  final TextStyle? textStyle;
  final String? okButtonTitle;

  /// when keyboard ok button press change color
  final Color? pressTextButtonColor;

  /// when keyboard ok button not press change color
  final Color? withoutPressTextButtonColor;

  static const List<String> _keyboardContent = <String>[
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    point,
    '0',
    backspaceInput,
    applyValuesInput
  ];

  @override
  Widget build(BuildContext context) {
    final _NumberPadProvider? numberPadProvider =
        _NumberPadProvider.of(context);
    final String text = _keyboardContent[index];

    return Builder(
      builder: (BuildContext context) => Expanded(
        child: SizedBox.expand(
          child: IgnorePointer(
            ignoring: _isIgnoring(),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              foregroundDecoration: BoxDecoration(
                color: _isIgnoring()
                    ? Colors.black.withOpacity(0.5)
                    : Colors.transparent,
              ),
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: borderSideColor),
                  ),
                  backgroundColor: (text == applyValuesInput)
                      // TODO(emad): check Account to be loaded
                      ? (true
                          ? pressTextButtonColor
                          // ignore: dead_code
                          : withoutPressTextButtonColor)
                      : withoutPressTextButtonColor,
                ),
                child: text == backspaceInput
                    ? Icon(
                        Icons.backspace,
                        size: 18,
                        color: backSpaceIconColor,
                      )
                    : Text(
                        text == applyValuesInput
                            ? okButtonTitle ?? actionOK
                            : text,
                        style: textStyle,
                      ),
                onPressed: () => onPressed(
                  context,
                  numberPadProvider!.focusedInput()!,
                  text,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool _isIgnoring() =>
      _keyboardContent[index] == applyValuesInput && !ignoring;
}
