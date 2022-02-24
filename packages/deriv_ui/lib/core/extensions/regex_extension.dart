import 'package:flutter_multipliers/core/helpers/helpers.dart' as helpers;

/// Extension methods for input validation on [String] using regex.
extension RegexExtension on String {
  /// Capitalize string.
  String get capitalize => helpers.capitalize(this);

  /// Indicates whether the input is a valid email.
  bool get isValidEmail => helpers.validEmailRegex.hasMatch(this);

  /// Indicates whether the input is a valid password.
  bool get isValidPassword => helpers.validPasswordRegex.hasMatch(this);

  /// Indicates whether the input is a valid password in terms of length.
  bool get isValidPasswordLength =>
      helpers.validPasswordLengthRegex.hasMatch(this);

  /// Apart from signup (8-char password), login should support 6-char password
  /// as there will be legacy accounts having 6 chars.
  bool get isValidLoginPasswordLength =>
      helpers.validLoginPasswordLengthRegex.hasMatch(this);
}
