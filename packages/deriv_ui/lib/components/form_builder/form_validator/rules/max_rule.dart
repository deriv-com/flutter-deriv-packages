part of '../form_validator.dart';

/// Adds max validation rule on [FormValidator].
extension MaxRuleExtensions on FormValidator {
  /// The field should be maximum as the given value.
  FormValidator max(num value, {String? error}) => add(
        (dynamic fieldValue) {
          bool hasError = false;

          bool hasLength() =>
              fieldValue is String || fieldValue is List || fieldValue is Map;

          if (fieldValue is num && fieldValue > value) {
            hasError = true;
          } else if (hasLength() && fieldValue.length > value) {
            hasError = true;
          }

          if (hasError) {
            return error ?? 'Should be maximum of $value.';
          }

          return null;
        },
      );
}
