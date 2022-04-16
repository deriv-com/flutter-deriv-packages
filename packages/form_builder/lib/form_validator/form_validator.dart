import 'package:flutter/material.dart';

part 'rules/equal_rule.dart';
part 'rules/max_rule.dart';
part 'rules/min_rule.dart';
part 'rules/no_special_character_rule.dart';
part 'rules/required_rule.dart';

/// This class uses builder pattern to create a chain of validation rules to be
/// used on [FormField]s.
class FormValidator {
  final List<FormFieldValidator> _validators = <FormFieldValidator>[];

  /// Validates the field with all the given validation rules.
  FormFieldValidator validate() => (dynamic fieldValue) {
        for (final FormFieldValidator validator in _validators) {
          final String? error = validator.call(fieldValue);

          if (error != null) {
            return error;
          }
        }

        return null;
      };

  /// Adds a custom [FormFieldValidator] to the validator chain.
  FormValidator add(FormFieldValidator validator) {
    _validators.add(validator);

    return this;
  }
}
