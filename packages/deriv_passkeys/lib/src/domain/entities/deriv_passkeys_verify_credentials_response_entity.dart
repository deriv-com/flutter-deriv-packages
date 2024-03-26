import 'package:equatable/equatable.dart';

/// A Dart class that contains the response to verify credentials.
final class DerivPasskeysVerifyCredentialsResponseEntity extends Equatable {
  /// Creates a [DerivPasskeysVerifyCredentialsResponseEntity].
  const DerivPasskeysVerifyCredentialsResponseEntity({
    required this.token,
  });

  /// contains the token from the REST API to verify credentials.
  final String token;

  @override
  List<Object?> get props => <Object?>[token];
}
