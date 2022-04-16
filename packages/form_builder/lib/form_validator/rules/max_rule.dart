part of '../form_validator.dart';

/// Adds max validation rule on [FormValidator].
extension MaxRuleExtensions on FormValidator {
  /// The field should be maximum as the given value.
  FormValidator max(num value, {String? error}) => add(
        (dynamic fieldValue) {
          bool _hasError = false;

          if (fieldValue is num && fieldValue > value) {
            _hasError = true;
          } else if (fieldValue is String && fieldValue.length > value) {
            _hasError = true;
          } else if (fieldValue is List && fieldValue.length > value) {
            _hasError = true;
          } else if (fieldValue is Map && fieldValue.length > value) {
            _hasError = true;
          }

          if (_hasError) {
            return error ?? 'Should be maximum of $value.';
          }

          return null;
        },
      );
}
