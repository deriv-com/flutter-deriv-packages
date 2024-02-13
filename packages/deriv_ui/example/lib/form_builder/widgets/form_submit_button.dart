// ignore_for_file: public_member_api_docs

import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';

class FormSubmitButton extends StatelessWidget {
  const FormSubmitButton();

  @override
  Widget build(BuildContext context) => FormStateBuilder(
        builder: (_, FormBuilderController controller) => ElevatedButton(
          onPressed:
              controller.isValid ? () => _onSubmit(context, controller) : null,
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 36),
          ),
          child: const Text('Login'),
        ),
      );

  void _onSubmit(BuildContext context, FormBuilderController controller) {
    if (controller.saveAndValidate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${controller.values}')),
      );
      controller.reset();
    }
  }
}
