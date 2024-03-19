/// A Dart class that contains the response from the REST API to verify credentials.
final class DerivPasskeysVerifyCredentialsResponseEntity {
  /// Creates a [DerivPasskeysVerifyCredentialsResponseEntity].
  DerivPasskeysVerifyCredentialsResponseEntity({
    required this.token,
    required this.success,
  });

  /// contains the token from the REST API to verify credentials.
  final String token;

  /// contains the success status of the response from the REST API to verify credentials.
  final bool success;
}
