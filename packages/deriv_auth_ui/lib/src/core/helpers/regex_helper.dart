/// Valid Email Regex.
RegExp validEmailRegex =
    RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,63}$');

/// Valid Password Regex.
RegExp validPasswordRegex =
    RegExp(r'^(?=.*[a-z])(?=.*[0-9])(?=.*[A-Z])[ -~]{8,25}$');

/// Valid Password with uppercase.
RegExp validPasswordWithUppercaseRegex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z]).*$');

/// Valid Password with numbers.
RegExp validPasswordWithNumberRegex = RegExp(r'^(?=.*[0-9]).*$');

/// Valid Password with symbols.
RegExp validPasswordWithSymbols = RegExp(r'^(?=.*[@#$%^&+!=]).*$');

/// Valid Password length Regex.
RegExp validPasswordLengthRegex = RegExp(r'^.{8,25}$');

/// Valid Password length for login.
RegExp validLoginPasswordLengthRegex = RegExp(r'^.{6,25}$');

/// Check if [str] input contains only a-z letters and 0-9 numbers
bool hasOnlySmallLettersAndNumberInput(String str) =>
    RegExp('^[a-z0-9.]+\$').hasMatch(str);

/// Check if [string] input contains only 0-9 numbers
bool hasOnlyNumberInput(String string) => RegExp('^[0-9]+\$').hasMatch(string);

/// Gets double value from the provided [string] and returns it as a string.
String getNumFromString(String string) {
  final RegExp doubleRegex =
      RegExp(r'-?(?:\d*\.)?\d+(.*?:[eE][+-]?\d+)?', multiLine: true);

  return doubleRegex
      .allMatches(string)
      .map<dynamic>((dynamic value) => value.group(0))
      .toString();
}

/// Returns current account broker
String? getAccountBrokerCode(String loginId) {
  final RegExp regex = RegExp('[A-Za-z]+|\\d+');
  final RegExpMatch? match = regex.firstMatch(loginId);
  return match?.group(0);
}

/// Check if the provided value matches the criteria of first name.
final RegExp firstNameRegexp =
    RegExp(r"^(?!.*\s{2,})[\p{L}\s'.-]{2,50}$", unicode: true);

/// Check if the provided value matches the criteria of family name.
final RegExp lastNameRegexp =
    RegExp(r"^(?!.*\s{2,})[\p{L}\s'.-]{2,50}$", unicode: true);

/// Check if the provided value matches the criteria of birthday.
final RegExp dateOfBirthRegexp =
    RegExp(r'^[0-9]{4}-[0-9]{1,2}-[0-9]{1,2}$', unicode: true);

/// Check if the provided value matches the criteria of first line of address.
final RegExp firstLineOfAddressRegexp =
    RegExp(r"^([a-zA-Z0-9’'.,:;()@#-]+\s)*[a-zA-Z0-9''.,:;()@#-]{0,70}$");

/// Check if the provided value matches the criteria of second line of address.
final RegExp secondLineOfAddressRegexp =
    RegExp(r"^([a-zA-Z0-9’'.,:;()@#-]+\s)*[a-zA-Z0-9''.,:;()@#-]{0,70}$");

/// Check if the provided value matches the criteria of town or city name.
final RegExp townOrCityRegexp =
    RegExp(r"^\p{L}[\p{L}\s'.-]{0,99}$", unicode: true);

/// Check if the provided value matches the criteria of postal or zipcode.
final RegExp postalOrZipcodeRegexp =
    RegExp(r'^[a-zA-Z0-9\s-]{0,20}$', unicode: true);

/// Matches phone numbers with the following characteristics:
///
/// - Phone number can start with up to 3 occurrences of '-', '.', ',', '\s' (whitespace),
///   '+', '(', ')'.
/// - The remaining part should consist of 9 to 35 occurrences of a digit (\d) followed
///   by up to 3 occurrences of the characters mentioned above.
/// - The phone number should not contain any other characters outside the specified set.
///
/// See <https://wikijs.deriv.cloud/en/squad/deriv-go/misc/phone-validation>
/// for the specification of phone validation used across Backend, Web, and Mobile.
final RegExp validPhoneNumberRegex =
    RegExp(r'^[-.,\s+()]{0,3}(?:\d[-.,\s+()]{0,3}){9,35}$');

/// Matches any sequence of characters that does not contain digits.
final RegExp nonDigitSequenceRegex = RegExp(r'\D+');

/// Matches any sequence of repeated digits.
final RegExp repeatedNumberRegex = RegExp(r'^(.)\1*$');
