part of 'form_builder.dart';

/// Signature for building the widget representing the [FormField].
typedef FormBuilderFieldBuilder<T> = Widget Function(
  FormBuilderFieldBuilderState<T> field,
);

/// Shorthanded type alias for the [FormBuilderFieldState] type.
typedef FormBuilderFieldBuilderState<T>
    = FormBuilderFieldState<FormBuilderField<T>, T>;

/// This widget is the base class for [FormBuilder] fields. It contains basic
/// and shared functionality for all types of fields in the form and renders a
/// custom UI with the [builder] method.
class FormBuilderField<T> extends FormField<T> {
  /// Constructs a new [FormBuilderField].
  FormBuilderField({
    required this.name,
    required FormBuilderFieldBuilder<T> builder,
    Key? key,
    T? initialValue,
    bool enabled = true,
    FormFieldValidator<T>? validator,
    AutovalidateMode? autovalidateMode,
    FormFieldSetter<T>? onSaved,
    this.decoration = const InputDecoration(),
    this.onChanged,
    this.onReset,
    this.focusNode,
    this.onFocusChanged,
  }) : super(
          key: key,
          initialValue: initialValue,
          enabled: enabled,
          builder: (FormFieldState<T> field) =>
              builder(field as FormBuilderFieldBuilderState<T>),
          validator: validator,
          autovalidateMode: autovalidateMode,
          onSaved: onSaved,
        );

  /// A unique name to reference this field in the form.
  final String name;

  /// The border, labels, icons, and styles used to decorate this field.
  final InputDecoration decoration;

  /// Called when the field value is changed.
  final ValueChanged<T?>? onChanged;

  /// Called when the field value is reset.
  final VoidCallback? onReset;

  /// The [FocusNode] to override the default one for this field.
  final FocusNode? focusNode;

  /// Called when the field focus is changed.
  final ValueChanged<bool>? onFocusChanged;

  @override
  FormBuilderFieldState<FormBuilderField<T>, T> createState() =>
      FormBuilderFieldState<FormBuilderField<T>, T>();
}

/// State associated with the [FormBuilderField] widget.
class FormBuilderFieldState<F extends FormBuilderField<T>, T>
    extends FormFieldState<T> {
  late final FormBuilderState _formBuilderState;
  late final FocusNode _focusNode;

  @override
  // ignore: avoid_as
  F get widget => super.widget as F;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _formBuilderState = FormBuilder.of(context);
    _formBuilderState.registerField(widget.name, this);
    _formBuilderState.controller.addListener(_updateState);
    focusNode.addListener(_updateState);
    setValue(initialValue);
  }

  @override
  void save() {
    super.save();
    _formBuilderState.setFieldValue(widget.name, value);
  }

  @override
  void didChange(T? value) {
    super.didChange(value);
    widget.onChanged?.call(value);
  }

  @override
  void reset() {
    super.reset();
    setValue(initialValue);
    widget.onReset?.call();
  }

  @override
  bool validate() => super.validate() && !hasError;

  /// Requests the primary focus for this field.
  void focus() => focusNode.requestFocus();

  void _updateState() {
    widget.onFocusChanged?.call(focusNode.hasFocus);
    setState(() {});
  }

  /// Returns the initial value of the field.
  T? get initialValue {
    if (widget.initialValue != null) {
      return widget.initialValue;
    }

    final dynamic _value =
        _formBuilderState.controller.initialValueOf<dynamic>(widget.name);

    if (_value is T) {
      return _value;
    }

    if (_value != null) {
      assert(() {
        debugPrint(
          'FormBuilder: The initial value type of the field "${widget.name}" '
          'does not match the type of the field. '
          'Expected ($T), got (${_value.runtimeType})',
        );

        return true;
      }());
    }
  }

  @override
  bool get hasError => super.hasError || widget.decoration.errorText != null;

  @override
  bool get isValid => super.isValid && !hasError;

  /// Returns the instance of [FocusNode] for this field.
  FocusNode get focusNode => _focusNode;

  /// Returns true if the field has focus.
  bool get hasFocus => focusNode.hasFocus;

  /// Returns true if the field is enabled.
  bool get enabled => widget.enabled && _formBuilderState.controller.enabled;

  /// Returns true if the field is not empty.
  bool get isNotEmpty {
    if (value is String) {
      return value != null && (value as String).isNotEmpty;
    }

    return value != null;
  }

  /// Returns true if the field is empty.
  bool get isEmpty => !isNotEmpty;

  /// Returns the [InputDecoration] for this field and overrides the error
  /// message with the one provided in the input decoration.
  InputDecoration get decoration => widget.decoration.copyWith(
        errorText: widget.decoration.errorText ?? errorText,
      );

  @override
  void dispose() {
    focusNode.removeListener(_updateState);
    _formBuilderState.controller.removeListener(_updateState);
    _formBuilderState.unregisterField(widget.name, this);
    super.dispose();
  }
}
