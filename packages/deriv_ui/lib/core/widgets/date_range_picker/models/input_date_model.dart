/// A data class to represent information after parsing a string to date.
class InputDateModel {
  /// Constructor initializing.
  InputDateModel({
    this.isValidOrNull = true,
    this.dateTime,
  });

  /// Flag to represent whether the input string is in valid format or null.
  ///
  /// Default to `true`.
  bool isValidOrNull;

  /// Valid DateTime generated from the string.
  DateTime? dateTime;
}
