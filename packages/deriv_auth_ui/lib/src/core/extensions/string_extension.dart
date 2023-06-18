import 'package:deriv_ui/deriv_ui.dart';

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
