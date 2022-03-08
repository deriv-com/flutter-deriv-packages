/// Valid Email Regex.
RegExp validEmailRegex =
    RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,63}$');

/// Valid Password Regex.
RegExp validPasswordRegex =
    RegExp(r'^(?=.*[a-z])(?=.*[0-9])(?=.*[A-Z])[ -~]{8,25}$');

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

/// Returns the account's broker code from the passed [loginId].
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
    RegExp(r"^(?! )[\w \'\.\,\:\;\(\)\@\#\/\-]{1,69}$");

/// Check if the provided value matches the criteria of second line of address.
final RegExp secondLineOfAddressRegexp =
    RegExp(r"^(?! )[\w \'\.\,\:\;\(\)\@\#\/\-]{1,69}$");

/// Check if the provided value matches the criteria of town or city name.
final RegExp townOrCityRegexp =
    RegExp(r"^\p{L}[\p{L}\s'.-]{0,99}$", unicode: true);

/// Check if the provided value matches the criteria of postal or zipcode.
final RegExp postalOrZipcodeRegexp =
    RegExp(r'^([A-Za-z0-9][A-Za-z0-9\s-]{0,20})?$', unicode: true);
