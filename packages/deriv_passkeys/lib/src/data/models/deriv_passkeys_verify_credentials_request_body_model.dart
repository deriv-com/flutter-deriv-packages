/// A dart class that serves as a request body for the `DerivPasskeysVerifyCredentials` request.
final class DerivPasskeysVerifyCredentialsRequest {
  /// Creates a [DerivPasskeysVerifyCredentialsRequest].
  DerivPasskeysVerifyCredentialsRequest({
    required this.appId,
    required this.publicKeyCredential,
    required this.type,
  });

  /// Creates a [DerivPasskeysVerifyCredentialsRequest] from a JSON object.
  factory DerivPasskeysVerifyCredentialsRequest.fromJson(
    Map<String, dynamic> json,
  ) =>
      DerivPasskeysVerifyCredentialsRequest(
        appId: json['app_id'] as String,
        publicKeyCredential:
            json['publicKeyCredential'] as Map<String, dynamic>,
        type: json['type'] as String,
      );

  /// The app ID.
  final String appId;

  /// The public key credential returned by the authenticator.
  final Map<String, dynamic> publicKeyCredential;

  /// The type.
  final String type;

  /// Converts the [DerivPasskeysVerifyCredentialsRequest] to a JSON object.
  Map<String, dynamic> toJson() => <String, dynamic>{
        'app_id': appId,
        'publicKeyCredential': publicKeyCredential,
        'type': type,
      };

  /// Copies the [DerivPasskeysVerifyCredentialsRequest] with some new values.
  DerivPasskeysVerifyCredentialsRequest copyWith({
    String? appId,
    Map<String, dynamic>? publicKeyCredential,
    String? type,
  }) =>
      DerivPasskeysVerifyCredentialsRequest(
        appId: appId ?? this.appId,
        publicKeyCredential: publicKeyCredential ?? this.publicKeyCredential,
        type: type ?? this.type,
      );
}
