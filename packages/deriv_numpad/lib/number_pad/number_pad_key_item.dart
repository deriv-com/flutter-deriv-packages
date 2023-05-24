part of 'number_pad.dart';

class _NumberPadKey extends StatefulWidget {
  const _NumberPadKey({
    required this.onPressed,
    required this.ignoring,
    required this.index,
    required this.actionOK,
  });

  final Function(BuildContext, TextEditingController, String) onPressed;

  final bool ignoring;

  final int index;

  final String actionOK;

  @override
  _NumberPadKeyState createState() => _NumberPadKeyState();
}

class _NumberPadKeyState extends State<_NumberPadKey> {
  Timer? _timer;

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

  /// The delay time that will be used when deleting the characters
  /// on long press backspace button.
  static const int delayTime = 80;

  /// The number of ticks that will be used when before deleting second symbol
  /// in input field.
  static const int tickPause = 10;

  @override
  Widget build(BuildContext context) {
    final _NumberPadProvider? numberPadProvider =
        _NumberPadProvider.of(context);
    final String text = _keyboardContent[widget.index];

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
              child: GestureDetector(
                onLongPressStart: (_) {
                  if (text == backspaceInput) {
                    widget.onPressed(
                      context,
                      numberPadProvider!.focusedInput()!,
                      text,
                    );
                    _timer = Timer.periodic(
                      const Duration(milliseconds: delayTime),
                      (Timer timer) {
                        if (timer.tick < tickPause) {
                          return;
                        }
                        widget.onPressed(
                          context,
                          numberPadProvider.focusedInput()!,
                          text,
                        );
                      },
                    );
                  }
                },
                onLongPressEnd: (_) {
                  if (text == backspaceInput) {
                    _timer?.cancel();
                  }
                },
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
                          text == applyValuesInput ? widget.actionOK : text,
                          style: context.theme
                              .textStyle(textStyle: TextStyles.button),
                        ),
                  onPressed: () {
                    widget.onPressed(
                      context,
                      numberPadProvider!.focusedInput()!,
                      text,
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool _isIgnoring() =>
      _keyboardContent[widget.index] == applyValuesInput && !widget.ignoring;
}
