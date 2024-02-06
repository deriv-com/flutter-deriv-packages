part of '../form_validator.dart';

/// Adds equal validation rule on [FormValidator].
extension EqualRuleExtensions on FormValidator {
  /// The field must be equal to the given value.
  FormValidator equal(dynamic value, {String? error}) => add(
        (dynamic fieldValue) {
          if (fieldValue != value) {
            return error ?? 'Should be equal to $value.';
          }

          return null;
        },
      );
}
