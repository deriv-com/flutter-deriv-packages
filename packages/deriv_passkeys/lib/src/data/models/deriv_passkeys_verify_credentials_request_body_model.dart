/// A dart class that serves as a request body for the `DerivPasskeysVerifyCredentials` request.
final class DerivPasskeysVerifyCredentialsRequestBodyModel {
  /// Creates a [DerivPasskeysVerifyCredentialsRequestBodyModel].
  DerivPasskeysVerifyCredentialsRequestBodyModel({
    required this.appId,
    required this.publicKeyCredential,
    required this.type,
  });

  /// Creates a [DerivPasskeysVerifyCredentialsRequestBodyModel] from a JSON object.
  factory DerivPasskeysVerifyCredentialsRequestBodyModel.fromJson(
          Map<String, dynamic> json) =>
      DerivPasskeysVerifyCredentialsRequestBodyModel(
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

  /// Converts the [DerivPasskeysVerifyCredentialsRequestBodyModel] to a JSON object.
  Map<String, dynamic> toJson() => <String, dynamic>{
        'app_id': appId,
        'publicKeyCredential': publicKeyCredential,
        'type': type,
      };

  /// Copies the [DerivPasskeysVerifyCredentialsRequestBodyModel] with some new values.
  DerivPasskeysVerifyCredentialsRequestBodyModel copyWith({
    String? appId,
    Map<String, dynamic>? publicKeyCredential,
    String? type,
  }) =>
      DerivPasskeysVerifyCredentialsRequestBodyModel(
        appId: appId ?? this.appId,
        publicKeyCredential: publicKeyCredential ?? this.publicKeyCredential,
        type: type ?? this.type,
      );
}
