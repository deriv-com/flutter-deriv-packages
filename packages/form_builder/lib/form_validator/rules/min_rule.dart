part of '../form_validator.dart';

/// Adds min validation rule on [FormValidator].
extension MinRuleExtensions on FormValidator {
  /// The field should be minimum as the given value.
  FormValidator min(num value, {String? error}) => add(
        (dynamic fieldValue) {
          bool _hasError = false;

          if (fieldValue is num && fieldValue < value) {
            _hasError = true;
          } else if (fieldValue is String && fieldValue.length < value) {
            _hasError = true;
          } else if (fieldValue is List && fieldValue.length < value) {
            _hasError = true;
          } else if (fieldValue is Map && fieldValue.length < value) {
            _hasError = true;
          }

          if (_hasError) {
            return error ?? 'Should be minimum of $value.';
          }

          return null;
        },
      );
}
