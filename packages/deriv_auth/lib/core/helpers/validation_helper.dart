import 'package:deriv_auth/deriv_auth.dart';

/// Validates the email input and returns an error message if invalid.
///
/// If the input is empty or a valid email, the function returns `null`.
/// Otherwise, it returns the provided [errorMessage].
String? emailValidator(String input, String errorMessage) {
  if (input.isEmpty || input.isValidEmail) {
    return null;
  }

  return errorMessage;
}

/// Validates the password input and returns an error message if invalid.
///
/// If the input is empty or meets the valid password length criteria,
/// the function returns `null`. Otherwise, it returns the provided [errorMessage].
///
String? passwordValidator(String input, String errorMessage) {
  if (input.isEmpty || (input.isValidLoginPasswordLength)) {
    return null;
  }

  return errorMessage;
}