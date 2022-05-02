// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:form_builder/form_builder.dart';

import 'form_checkbox_field.dart';
import 'form_submit_button.dart';
import 'form_text_field.dart';

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
                  autoValidateMode: AutovalidateMode.onUserInteraction,
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
                    const FormCheckboxField(
                      name: 'remember_me',
                      label: 'Remember me',
                    ),
                    const SizedBox(height: 18),
                    const FormSubmitButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
