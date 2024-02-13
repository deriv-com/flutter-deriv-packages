part of 'number_pad.dart';

class _NumberPadKeypadWidget extends StatefulWidget {
  const _NumberPadKeypadWidget({
    required this.onKeyPressed,
  });

  final NumberPadKeyPressedCallback onKeyPressed;

  @override
  _NumberPadKeypadWidgetState createState() => _NumberPadKeypadWidgetState();
}

class _NumberPadKeypadWidgetState extends State<_NumberPadKeypadWidget> {
  static const double _smallestScreenHeight = 450;
  static const double _buttonsRatio = 0.4;
  static const int _numberOfRows = 5;
  static const int _numberOfColumns = 3;

  /// There are 3 columns in keyboard that amount of w/h of each one is 0.4 (48/120)
  double get _keyboardHeight =>
      (MediaQuery.of(context).size.width / _numberOfColumns) *
      _buttonsRatio *
      _numberOfRows;

  double get _overflowSpace =>
      _smallestScreenHeight - MediaQuery.of(context).size.height;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: MediaQuery.of(context).size.height >= _smallestScreenHeight
            ? _keyboardHeight
            : _keyboardHeight - _overflowSpace,
        child: Column(
          children: List<Widget>.generate(
            _numberOfRows,
            (int rowCounter) => _buildKeyboardRows(rowCounter),
          ),
        ),
      );

  Widget _buildKeyboardRows(int row) => Expanded(
        child: Row(
          children:
              List<Widget>.generate((row != 4) ? 3 : 1, (int columnCounter) {
            final int counter = (row != 4) ? row * _numberOfColumns : 12;
            final int index = columnCounter + counter;
            return _NumberPadKey(
              index: index,
              ignoring: _NumberPadProvider.of(context)!.isAllInputsValid() &&
                  _noErrorExist(),
              onPressed: widget.onKeyPressed,
              actionOK: _NumberPadProvider.of(context)!.label.actionOK,
            );
          }),
        ),
      );

  bool _noErrorExist() {
    final _NumberPadProvider provider = _NumberPadProvider.of(context)!;
    final NumpadValidationText? Function(String value)? validate =
        provider.label.onValidate;
    if (validate == null) {
      return true;
    } else {
      final NumpadValidationText? result =
          validate(provider.firstInputController!.text);
      final bool _noError = result == null || result.enableActionButton;

      return _noError;
    }
  }
}
