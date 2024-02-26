/// A dart class that serves as a request body for the `DerivPasskeysVerifyCredentials` request.
final class DerivPasskeysVerifyCredentialsRequestBody {
  /// Creates a [DerivPasskeysVerifyCredentialsRequestBody].
  DerivPasskeysVerifyCredentialsRequestBody({
    required this.appId,
    required this.publicKeyCredential,
    required this.type,
  });

  factory DerivPasskeysVerifyCredentialsRequestBody.fromJson(
          Map<String, dynamic> json) =>
      DerivPasskeysVerifyCredentialsRequestBody(
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

  Map<String, dynamic> toJson() => <String, dynamic>{
        'app_id': appId,
        'publicKeyCredential': publicKeyCredential,
        'type': type,
      };
}
