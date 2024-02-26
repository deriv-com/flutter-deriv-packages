// ignore_for_file: public_member_api_docs

import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';

class FormCheckboxField extends StatelessWidget {
  const FormCheckboxField({
    required this.name,
    required this.label,
  });

  final String name;

  final String label;

  @override
  Widget build(BuildContext context) => FormBuilderField<bool>(
        name: name,
        builder: (FormBuilderFieldBuilderState<bool> field) => GestureDetector(
          onTap: () => field.didChange(!(field.value ?? false)),
          child: Row(
            children: <Widget>[
              Text(label),
              Checkbox(value: field.value ?? false, onChanged: field.didChange),
            ],
          ),
        ),
      );
}
