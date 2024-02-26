// ignore_for_file: public_member_api_docs

import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';

class FormTextField extends StatelessWidget {
  const FormTextField({
    required this.name,
    this.label,
    this.validator,
  });

  final String name;

  final String? label;

  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) => FormBuilderField<String>(
        name: name,
        validator: validator,
        builder: (FormBuilderFieldBuilderState<String> field) => TextFormField(
          decoration: field.decoration.copyWith(
            labelText: label,
            helperText: '',
          ),
          onChanged: field.didChange,
        ),
      );
}
