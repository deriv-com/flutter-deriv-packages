import 'package:deriv_passkeys/src/domain/entities/account_entity.dart';
import 'package:equatable/equatable.dart';

/// A Dart class that contains the response to verify credentials.
final class DerivPasskeysVerifyCredentialsResponseEntity extends Equatable {
  /// Creates a [DerivPasskeysVerifyCredentialsResponseEntity].
  const DerivPasskeysVerifyCredentialsResponseEntity({
    required this.accounts,
    required this.refreshToken,
  });

  /// List of accounts.
  final List<AccountEntity> accounts;

  /// Refresh token from the REST API to verify credentials.
  final String refreshToken;

  @override
  List<Object?> get props => <Object?>[accounts, refreshToken];
}
