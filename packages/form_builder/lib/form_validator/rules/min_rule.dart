part of '../form_validator.dart';

/// Adds min validation rule on [FormValidator].
extension MinRuleExtensions on FormValidator {
  /// The field should be minimum as the given value.
  FormValidator min(num value, {String? error}) => add(
        (dynamic fieldValue) {
          bool _hasError = false;

          bool _hasLength() =>
              fieldValue is String || fieldValue is List || fieldValue is Map;

          if (fieldValue is num && fieldValue < value) {
            _hasError = true;
          } else if (_hasLength() && fieldValue.length < value) {
            _hasError = true;
          }

          if (_hasError) {
            return error ?? 'Should be minimum of $value.';
          }

          return null;
        },
      );
}
