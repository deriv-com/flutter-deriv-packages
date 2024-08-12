import 'package:deriv_theme/deriv_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Base wrapper of [TextFormField] with its common APIs.
class BaseTextField extends StatefulWidget {
  /// Initializes base text field.
  const BaseTextField({
    required this.labelText,
    this.controller,
    this.textColor,
    this.labelColor,
    this.initialValue,
    this.borderColor,
    this.focusNode,
    this.focusedTextColor,
    this.focusedLabelColor,
    this.focusedBorderColor,
    this.prefix,
    this.suffixIcon,
    this.formFieldKey,
    this.textInputAction,
    this.keyboardType,
    this.validator,
    this.maxLength,
    this.inputFormatters,
    this.showCounterText = true,
    this.readOnly = false,
    this.enabled = true,
    this.obscureText = false,
    this.errorMaxLines = 2,
    this.onEditingComplete,
    this.onChanged,
    this.onTap,
    this.semanticLabel,
    this.autofocus = false,
    Key? key,
  }) : super(key: key);

  /// Text field controller.
  final TextEditingController? controller;

  /// Text field label text.
  final String labelText;

  /// TextField text color when it's not focused.
  final Color? textColor;

  /// Text field label color when its not focused.
  final Color? labelColor;

  /// Initial value of text field.
  final String? initialValue;

  /// Text field border color when its not focused.
  final Color? borderColor;

  /// Text field focus node.
  final FocusNode? focusNode;

  /// Form field key.
  final GlobalKey<FormFieldState<String>>? formFieldKey;

  /// TextField text color when it's focused
  final Color? focusedTextColor;

  /// Text field label color when its focused.
  final Color? focusedLabelColor;

  /// Text field border color when its focused.
  final Color? focusedBorderColor;

  /// The prefix widget.
  final Widget? prefix;

  /// Suffix icon widget.
  final Widget? suffixIcon;

  /// Text field textInputAction.
  final TextInputAction? textInputAction;

  /// Text input type.
  final TextInputType? keyboardType;

  /// Indicates whether this text field should show counter text or not.
  final bool showCounterText;

  /// Indicates whether this text field should be readOnly or not.
  final bool readOnly;

  /// Indicates whether this text field should be enabled or not.
  final bool enabled;

  /// Indicates is text field obscure.
  final bool obscureText;

  /// Error max lines.
  final int errorMaxLines;

  /// Input max length.
  final int? maxLength;

  /// List of input formatters.
  final List<TextInputFormatter>? inputFormatters;

  /// validator function of text field.
  final String? Function(String?)? validator;

  /// onEditingComplete callback of text field.
  final VoidCallback? onEditingComplete;

  /// onChanged callback of text field.
  final void Function(String)? onChanged;

  /// onTap callback function.
  final VoidCallback? onTap;

  /// Semantic label.
  final String? semanticLabel;

  /// Autofocus.
  final bool autofocus;

  @override
  _BaseTextFieldState createState() => _BaseTextFieldState();
}

class _BaseTextFieldState extends State<BaseTextField> {
  GlobalKey<FormFieldState<String>>? _formFieldKey;
  bool _hasError = false;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();

    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_onFocusChange);

    _focusNode = widget.focusNode ?? FocusNode();

    _formFieldKey = widget.formFieldKey ??
        (widget.validator == null ? null : GlobalKey<FormFieldState<String>>());
  }

  void _onFocusChange() {
    if (!_focusNode.hasFocus) {
      _formFieldKey?.currentState?.validate();
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Semantics(
        explicitChildNodes: true,
        label: widget.semanticLabel,
        child: TextFormField(
          key: _formFieldKey,
          autofocus: widget.autofocus,
          controller: widget.controller,
          focusNode: _focusNode,
          initialValue: widget.initialValue,
          keyboardType: widget.keyboardType,
          maxLength: widget.maxLength,
          autocorrect: false,
          readOnly: widget.readOnly,
          enabled: widget.enabled,
          obscureText: widget.obscureText,
          textInputAction: widget.textInputAction,
          inputFormatters: widget.inputFormatters,
          decoration: InputDecoration(
            labelText: widget.labelText,
            border: const OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: widget.borderColor ?? context.theme.colors.hover,
              ),
              borderRadius: BorderRadius.circular(ThemeProvider.borderRadius04),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: widget.focusedBorderColor ?? context.theme.colors.blue,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: context.theme.colors.coral),
              borderRadius: BorderRadius.circular(ThemeProvider.borderRadius04),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: context.theme.colors.coral),
              borderRadius: BorderRadius.circular(ThemeProvider.borderRadius04),
            ),
            labelStyle: context.theme.textStyle(
              textStyle: TextStyles.subheading,
              color: _hasError
                  ? context.theme.colors.coral
                  : _hasFocus()
                      ? widget.focusedLabelColor ?? context.theme.colors.blue
                      : widget.labelColor ?? context.theme.colors.disabled,
            ),
            counterText: widget.showCounterText ? null : '',
            errorMaxLines: widget.errorMaxLines,
            prefix: widget.prefix,
            prefixStyle: context.theme.textStyle(
              textStyle: TextStyles.subheading,
              color: _getTextFieldColor(),
            ),
            suffixIcon: widget.suffixIcon,
          ),
          onEditingComplete: widget.onEditingComplete,
          validator: _validator,
          onChanged: _onChanged,
          onTap: widget.onTap,
        ),
      );

  bool _hasFocus() => _focusNode.hasFocus;

  Color _getTextFieldColor() => widget.enabled && _hasFocus()
      ? widget.focusedTextColor ?? context.theme.colors.prominent
      : widget.textColor ?? context.theme.colors.general;

  String? _validator(String? input) {
    final String? errorMsg = widget.validator?.call(input);

    setState(() => _hasError = errorMsg != null);

    return errorMsg;
  }

  void _onChanged(String input) {
    // Clear the error state when the user starts typing
    if (_hasError) {
      setState(() => _hasError = false);
      _formFieldKey?.currentState?.validate();
    }
    widget.onChanged?.call(input);
  }
}
