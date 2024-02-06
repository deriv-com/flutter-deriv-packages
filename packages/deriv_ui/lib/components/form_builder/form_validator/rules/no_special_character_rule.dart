part of '../form_validator.dart';

/// Adds noSpecialCharacter validation rule on [FormValidator].
extension NoSpecialCharacterRuleExtensions on FormValidator {
  static final RegExp _regex = RegExp(
    r"[^\p{L}\p{Nd}\s'.,:;()@#+-]",
    unicode: true,
    multiLine: true,
    caseSensitive: false,
  );

  /// The field should not contain any special characters.
  FormValidator noSpecialCharacter({String? error}) => add(
        (dynamic fieldValue) {
          if (fieldValue != null) {
            bool result = false;

            if (fieldValue is String) {
              result = _regex.stringMatch(fieldValue) != null;
            } else if (fieldValue is Iterable) {
              result = _validateIterable(fieldValue);
            } else if (fieldValue is Map) {
              result = _validateMap(fieldValue);
            }

            if (result) {
              return error ??
                  'This field can only include letters, numbers, spaces, and '
                      'any of these symbols: -+.,\'#@():;';
            }
          }

          return null;
        },
      );

  bool _validateIterable(Iterable<dynamic> iterable) => iterable.any(
        (dynamic item) {
          if (item is String) {
            return _regex.stringMatch(item) != null;
          } else if (item is Iterable) {
            return _validateIterable(item);
          } else if (item is Map) {
            return _validateMap(item);
          }

          return false;
        },
      );

  bool _validateMap(Map<dynamic, dynamic> map) =>
      map.values.any((dynamic item) {
        if (item is String) {
          return _regex.stringMatch(item) != null;
        } else if (item is Iterable) {
          return _validateIterable(item);
        } else if (item is Map) {
          return _validateMap(item);
        }

        return false;
      });
}
