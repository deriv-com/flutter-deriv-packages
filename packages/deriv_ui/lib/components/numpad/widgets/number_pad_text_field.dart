part of 'number_pad.dart';

class _NumberPadTextField extends StatefulWidget {
  const _NumberPadTextField({
    required this.textStyle,
    required this.inputValidator,
    this.controller,
    this.focusNode,
    this.textAlign,
    this.label = '',
    this.suffixIcon,
  });

  final Widget? suffixIcon;
  final TextEditingController? controller;
  final TextStyle textStyle;
  final FocusNode? focusNode;
  final bool Function() inputValidator;
  final TextAlign? textAlign;
  final String label;

  @override
  _NumberPadTextFieldState createState() => _NumberPadTextFieldState();
}

class _NumberPadTextFieldState extends State<_NumberPadTextField> {
  Color? _labelColor;

  @override
  void initState() {
    super.initState();

    _labelColor = context.theme.colors.disabled;

    widget.focusNode?.addListener(_onFocusChanged);
  }

  @override
  Widget build(BuildContext context) => TextField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        style: widget.inputValidator.call()
            ? context.theme.textStyle(textStyle: widget.textStyle)
            : context.theme.textStyle(
                textStyle: widget.textStyle,
                color: context.theme.colors.coral,
              ),
        decoration: widget.label.isEmpty
            ? InputDecoration(
                border: InputBorder.none,
                suffixIcon: widget.suffixIcon != null
                    ? Padding(
                        padding: const EdgeInsets.only(
                            right: ThemeProvider.margin16),
                        child: widget.suffixIcon,
                      )
                    : null,
              )
            : InputDecoration(
                suffixIcon: widget.suffixIcon != null
                    ? Padding(
                        padding: const EdgeInsets.only(
                            right: ThemeProvider.margin16),
                        child: widget.suffixIcon,
                      )
                    : null,
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: context.theme.colors.blue,
                  ),
                ),
                labelText: widget.label,
                labelStyle: context.theme.textStyle(
                  textStyle: widget.textStyle,
                  color: _labelColor,
                ),
              ),
        textAlign: widget.textAlign ?? TextAlign.start,
        readOnly: true,
        showCursor: true,
        cursorColor: context.theme.colors.prominent,
        enableInteractiveSelection: false,
        autofocus: true,
      );

  void _onFocusChanged() {
    if (widget.focusNode?.hasFocus ?? false) {
      if (widget.controller?.text == noInput) {
        widget.controller?.clear();
      }
    } else if (widget.controller?.text.isEmpty ?? false) {
      widget.controller?.text = noInput;
    }

    if (widget.label.isNotEmpty) {
      setState(() => _labelColor = (widget.focusNode?.hasFocus ?? false)
          ? context.theme.colors.blue
          : context.theme.colors.disabled);
    }
  }
}
