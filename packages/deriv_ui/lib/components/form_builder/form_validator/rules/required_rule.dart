part of '../form_validator.dart';

/// Adds required validation rule on [FormValidator].
extension RequiredRuleExtensions on FormValidator {
  /// The field can't be null or empty.
  FormValidator required({String? error}) => add(
        (dynamic fieldValue) {
          if (fieldValue == null ||
              (fieldValue is String && fieldValue.trim().isEmpty) ||
              (fieldValue is Iterable && fieldValue.isEmpty) ||
              (fieldValue is Map && fieldValue.isEmpty)) {
            return error ?? 'This field is required.';
          }

          return null;
        },
      );
}
