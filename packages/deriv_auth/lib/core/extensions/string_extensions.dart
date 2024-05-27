import 'package:deriv_ui/utils/regex_helpers.dart';

/// String extensions.
extension StringExtension on String {
  /// Returns all contents between first XML [tag].
  String? parseXMLTag(String tag) =>
      RegExp('<$tag>(.*)<\/$tag>').firstMatch(this)?.group(1);

  /// Converts a camelCase string to snake_case.
  String toSnakeCase() => replaceAllMapped(
        RegExp(r'([A-Z])'),
        (Match match) => '_${match[0]}',
      ).toLowerCase();
}

/// Extension methods for input validation on [String] using regex.
extension RegexExtension on String {
  /// Indicates whether the input is a valid email.
  bool get isValidEmail => validEmailRegex.hasMatch(this);

  /// Apart from signup (8-char password), login should support 6-char password as there will be legacy accounts having 6 chars.
  bool get isValidLoginPasswordLength =>
      validLoginPasswordLengthRegex.hasMatch(this);

  /// Signup valid Password Regex.
  bool get isValidSignupPassword => validPasswordRegex.hasMatch(this);
}

/// Extension methods for capitalizing [String].
extension Capitalize on String {
  /// Capitalize the first letter of the string.
  String get capitalize => '${this[0].toUpperCase()}${substring(1)}';
}
