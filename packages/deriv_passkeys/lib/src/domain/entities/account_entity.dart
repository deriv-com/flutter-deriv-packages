import 'package:equatable/equatable.dart';

/// A Dart class that contains the account entity.
final class AccountEntity extends Equatable {
  /// Creates a [AccountEntity].
  const AccountEntity({
    required this.loginId,
    required this.token,
  });

  /// Account login ID.
  final String loginId;

  /// Account token.
  final String token;

  @override
  List<Object?> get props => <Object?>[loginId, token];
}
