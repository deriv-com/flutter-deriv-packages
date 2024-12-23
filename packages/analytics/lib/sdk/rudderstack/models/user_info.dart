import 'package:equatable/equatable.dart';

/// User Info model.
class UserInfo extends Equatable {
  /// Constructor for User Info model.
  const UserInfo({
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

  @override
  List<Object?> get props => [userId, countryResidence, language, accountType];
}
