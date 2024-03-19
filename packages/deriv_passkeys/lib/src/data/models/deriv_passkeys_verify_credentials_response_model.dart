/// A Dart class that contains the response from the REST API to verify credentials.
final class DerivPasskeysVerifyCredentialsResponseModel {
  /// Creates a [DerivPasskeysVerifyCredentialsResponseModel].
  DerivPasskeysVerifyCredentialsResponseModel({
    required this.response,
    required this.success,
  });

  /// contains the response from the REST API to verify credentials.
  final Map<String, dynamic> response;

  /// contains the success status of the response from the REST API to verify credentials.
  final bool success;
}
