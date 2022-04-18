// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:form_builder/form_builder.dart';

void main() => runApp(_Example());

class _Example extends StatelessWidget {
  final FormBuilderController _controller = FormBuilderController();

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'FormBuilder Example',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: Scaffold(
          appBar: AppBar(title: const Text('Form Builder Example')),
          body: Builder(
            builder: (BuildContext context) => Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: FormBuilder(
                  controller: _controller,
                  children: <Widget>[
                    FormTextField(
                      name: 'email',
                      label: 'Email',
                      validator: FormValidator().required().validate(),
                    ),
                    FormTextField(
                      name: 'password',
                      label: 'Password',
                      validator: FormValidator().required().min(6).validate(),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            if (_controller.saveAndValidate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('${_controller.values}'),
                                ),
                              );
                            }
                          },
                          child: const Text('Submit'),
                        ),
                        ElevatedButton(
                          onPressed: _controller.reset,
                          child: const Text('Reset'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}

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
          decoration: field.decoration.copyWith(labelText: label),
          onChanged: field.didChange,
        ),
      );
}
