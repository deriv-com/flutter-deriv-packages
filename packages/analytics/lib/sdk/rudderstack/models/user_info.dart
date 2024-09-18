/// User Info model.
class UserInfo {
  /// Constructor for User Info model.
  UserInfo({
    required this.userId,
    this.countryResidence,
    this.language,
    this.accountType,
  });

  /// User id.
  final int userId;

  /// Country of residence.
  final String? countryResidence;

  /// User language.
  final String? language;

  /// Account type.
  final String? accountType;
}
