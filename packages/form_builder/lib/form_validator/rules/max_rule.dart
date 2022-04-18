part of '../form_validator.dart';

/// Adds max validation rule on [FormValidator].
extension MaxRuleExtensions on FormValidator {
  /// The field should be maximum as the given value.
  FormValidator max(num value, {String? error}) => add(
        (dynamic fieldValue) {
          bool _hasError = false;

          bool _hasLength() =>
              fieldValue is String || fieldValue is List || fieldValue is Map;

          if (fieldValue is num && fieldValue > value) {
            _hasError = true;
          } else if (_hasLength() && fieldValue.length > value) {
            _hasError = true;
          }

          if (_hasError) {
            return error ?? 'Should be maximum of $value.';
          }

          return null;
        },
      );
}
