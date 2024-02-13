import 'package:flutter/material.dart';

part 'form_builder_controller.dart';
part 'form_builder_field.dart';
part 'form_state_builder.dart';

/// This widget wraps the [Form] widget and extends it's functionality.
class FormBuilder extends StatefulWidget {
  /// Constructs a new [FormBuilder] with the given [FormBuilderController].
  const FormBuilder({
    required this.controller,
    required this.children,
    this.autoValidateMode = AutovalidateMode.disabled,
    this.onChanged,
    this.onWillPop,
  });

  /// The controller that will be used to control the form.
  /// Note that you do not need to `dispose` the controller manually, It will be
  /// disposed automatically once the [FormBuilder] is disposed.
  final FormBuilderController controller;

  /// Children of the form. Typically a list of [FormBuilderField] widgets.
  final List<Widget> children;

  /// Sets the form auto validation mode for the form.
  final AutovalidateMode autoValidateMode;

  /// Will be called when there is a change in the form fields.
  final VoidCallback? onChanged;

  /// If returns a Future that resolves to false, The route that contains the
  /// form will not be popped.
  final WillPopCallback? onWillPop;

  /// Finds the closest [FormBuilderState] in the [BuildContext] and returns it.
  static FormBuilderState? of(BuildContext context) {
    final FormBuilderState? result =
        context.findAncestorStateOfType<FormBuilderState>();

    if (result == null) {
      debugPrint(
        'FormBuilder: FormBuilderState is not found. Make sure you have '
        'a FormBuilder widget as a parent of your widget.',
      );
    }

    return result;
  }

  @override
  FormBuilderState createState() => FormBuilderState();
}

/// State associated with the [FormBuilder] widget.
class FormBuilderState extends State<FormBuilder> {
  @override
  Widget build(BuildContext context) => Form(
        key: controller._formKey,
        autovalidateMode: widget.autoValidateMode,
        onWillPop: widget.onWillPop,
        onChanged: () {
          controller.didChange();
          widget.onChanged?.call();
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: widget.children,
        ),
      );

  /// Returns the [FormBuilderController] associated with the [FormBuilder].
  FormBuilderController get controller => widget.controller;

  /// Saves the fields value for the given key.
  void setFieldValue(String name, dynamic value) {
    setState(() => controller._values[name] = value);
  }

  /// Removes the given key from the form values.
  void removeFieldValue(String name) {
    setState(() => controller._values.remove(name));
  }

  /// Registers the form field with the given unique name in the form fields.
  void registerField(String name, dynamic field) {
    if (controller.fields.containsKey(name)) {
      // It is safe to replace the new field with the old one that has the
      // same key, In such case [FormBuilder] will only care about the last one
      // and ignore the old one.
      debugPrint(
        'FormBuilder: A field with the "$name" name already exists. '
        'Replacing the old field with the new one.',
      );
    }

    controller.fields[name] = field;
  }

  /// Removes the matching form field from the form fields.
  void unregisterField(String name, dynamic field) {
    if (controller.fields.containsKey(name) &&
        field == controller.fields[name]) {
      controller.fields.remove(name);
    }

    controller._values.remove(name);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
