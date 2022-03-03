part of 'number_pad.dart';

class _NumberPadTextField extends StatefulWidget {
  const _NumberPadTextField({
    required this.inputValidator,
    this.controller,
    this.focusNode,
    this.label = '',
    this.numberPadFieldModel = const NumberPadFieldModel(),
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool Function() inputValidator;
  final NumberPadFieldModel? numberPadFieldModel;
  final String label;

  @override
  _NumberPadTextFieldState createState() => _NumberPadTextFieldState();
}

class _NumberPadTextFieldState extends State<_NumberPadTextField> {
  Color? _labelColor;

  @override
  void initState() {
    super.initState();
    _labelColor = widget.numberPadFieldModel?.labelColor;
    widget.focusNode?.addListener(_onFocusChanged);
  }

  @override
  Widget build(BuildContext context) => TextField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        style: widget.inputValidator.call()
            ? widget.numberPadFieldModel?.textStyle
            : widget.numberPadFieldModel?.textStyle?.copyWith(
                color: widget.numberPadFieldModel?.borderSideColor,
              ),
        decoration: widget.label.isEmpty
            ? const InputDecoration(border: InputBorder.none)
            : InputDecoration(
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: widget.numberPadFieldModel?.borderSideColor ??
                        Colors.black,
                  ),
                ),
                labelText: widget.label,
                labelStyle: widget.numberPadFieldModel?.textStyle?.copyWith(
                  color: _labelColor,
                ),
              ),
        textAlign: widget.numberPadFieldModel?.textAlign ?? TextAlign.start,
        readOnly: true,
        showCursor: true,
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
          ? widget.numberPadFieldModel?.focusColor
          : widget.numberPadFieldModel?.withoutFocusColor);
    }
  }

  @override
  void dispose() {
    super.dispose();
    widget.focusNode?.removeListener(_onFocusChanged);
  }
}
