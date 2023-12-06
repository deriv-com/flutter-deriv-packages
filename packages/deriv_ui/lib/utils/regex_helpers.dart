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
