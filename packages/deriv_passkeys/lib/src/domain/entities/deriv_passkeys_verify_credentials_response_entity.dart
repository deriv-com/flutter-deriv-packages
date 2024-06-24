import 'package:equatable/equatable.dart';

/// A Dart class that contains the response to verify credentials.
final class DerivPasskeysVerifyCredentialsResponseEntity extends Equatable {
  /// Creates a [DerivPasskeysVerifyCredentialsResponseEntity].
  const DerivPasskeysVerifyCredentialsResponseEntity({
    required this.token,
    required this.refreshToken,
  });

  /// contains the token from the REST API to verify credentials.
  final String token;

  /// contains the refresh token from the REST API to verify credentials.
  final String refreshToken;

  @override
  List<Object?> get props => <Object?>[token, refreshToken];
}
