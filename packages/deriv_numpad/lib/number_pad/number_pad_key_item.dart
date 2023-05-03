part of 'number_pad.dart';

class _NumberPadKey extends StatelessWidget {
  const _NumberPadKey(
      {required this.onPressed,
      required this.ignoring,
      required this.index,
      required this.actionOK});

  final Function(BuildContext, TextEditingController, String) onPressed;

  final bool ignoring;

  final int index;
  final String actionOK;

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
                    side: BorderSide(color: context.theme.base08Color),
                  ),
                  backgroundColor: (text == applyValuesInput)
                      // TODO(emad): check Account to be loaded
                      ? (true
                          ? context.theme.brandCoralColor
                          // ignore: dead_code
                          : context.theme.base04Color)
                      : context.theme.base07Color,
                ),
                child: text == backspaceInput
                    ? Icon(
                        Icons.backspace,
                        size: 18,
                        color: context.theme.base01Color,
                      )
                    : Text(
                        text == applyValuesInput ? actionOK : text,
                        style: context.theme
                            .textStyle(textStyle: TextStyles.button),
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
