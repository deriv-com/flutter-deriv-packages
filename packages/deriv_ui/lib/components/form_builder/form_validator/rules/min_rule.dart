part of '../form_validator.dart';

/// Adds min validation rule on [FormValidator].
extension MinRuleExtensions on FormValidator {
  /// The field should be minimum as the given value.
  FormValidator min(num value, {String? error}) => add(
        (dynamic fieldValue) {
          bool hasError = false;

          bool hasLength() =>
              fieldValue is String || fieldValue is List || fieldValue is Map;

          if (fieldValue is num && fieldValue < value) {
            hasError = true;
          } else if (hasLength() && fieldValue.length < value) {
            hasError = true;
          }

          if (hasError) {
            return error ?? 'Should be minimum of $value.';
          }

          return null;
        },
      );
}
