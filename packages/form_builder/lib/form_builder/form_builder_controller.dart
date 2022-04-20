part of 'form_builder.dart';

/// Controller class for the [FormBuilder] widget.
class FormBuilderController extends ChangeNotifier {
  /// Constructs a new [FormBuilderController] with the given initial values.
  FormBuilderController({
    this.initialValues = const <String, dynamic>{},
  });

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  /// Initial values of the form, Pair of field name and field value.
  final Map<String, dynamic> initialValues;

  final Map<String, dynamic> _values = <String, dynamic>{};

  final Map<String, dynamic> _fields = <String, dynamic>{};

  bool _enabled = true;

  /// Returns or sets whether the form is enabled or not.
  bool get enabled => _enabled;

  set enabled(bool value) {
    _enabled = value;
    notifyListeners();
  }

  /// Returns a [Map] of all fields with just keys and values.
  Map<String, dynamic> get values => _values;

  /// Returns a [Map] of all the form fields.
  Map<String, dynamic> get fields => _fields;

  /// Returns the initial value of the given key.
  T? initialValueOf<T>(String name) => initialValues[name];

  /// Returns the value of the given key.
  T? value<T>(String name) => values[name];

  /// Returns the field of the given key.
  FormBuilderFieldState<FormBuilderField<T>, T>? field<T>(String name) =>
      fields[name];

  /// Calls onSaved method on every [FormBuilderField] in children of this form.
  void save() => _formKey.currentState?.save();

  /// Resets every [FormBuilderField] in children of this form back to its
  /// initial value.
  void reset() => _formKey.currentState?.reset();

  /// Validates every [FormBuilderField] in children of the form, and returns
  /// true if there are no errors. The form will rebuild to report the results.
  bool validate() => _formKey.currentState?.validate() ?? false;

  /// Saves and validates the form.
  bool saveAndValidate() {
    save();
    return validate();
  }

  /// Returns whether all of the [FormBuilderField] are valid or not.
  bool get isValid => fields.entries.every((MapEntry<String, dynamic> item) {
        final dynamic field = item.value;
        field as FormBuilderFieldState<FormBuilderField<dynamic>, dynamic>;

        return field.isValid;
      });

  /// Returns true if any of the [FormBuilderField] in children of this form
  /// isn't null and has any data in it.
  bool get isNotEmpty => fields.values.any((dynamic field) =>
      (field as FormBuilderFieldState<FormBuilderField<dynamic>, dynamic>)
          .isNotEmpty);

  /// Returns true if all the [FormBuilderField] are empty.
  bool get isEmpty => !isNotEmpty;

  /// Returns true if the form values is any different than it's initial value.
  bool get hasChanged => fields.entries.any((MapEntry<String, dynamic> item) {
        final dynamic field = item.value;
        field as FormBuilderFieldState<FormBuilderField<dynamic>, dynamic>;

        return field.initialValue != field.value;
      });
}
