import 'package:equatable/equatable.dart';

/// A dart class that serves as a request body for the `DerivPasskeysVerifyCredentials` request.
final class DerivPasskeysVerifyCredentialsRequestBodyEntity extends Equatable {
  /// Creates a [DerivPasskeysVerifyCredentialsRequestBodyEntity].
  const DerivPasskeysVerifyCredentialsRequestBodyEntity({
    required this.appId,
    required this.publicKeyCredential,
    required this.type,
  });

  /// Creates a [DerivPasskeysVerifyCredentialsRequestBodyEntity] from a JSON object.
  factory DerivPasskeysVerifyCredentialsRequestBodyEntity.fromJson(
          Map<String, dynamic> json) =>
      DerivPasskeysVerifyCredentialsRequestBodyEntity(
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

  /// Converts the [DerivPasskeysVerifyCredentialsRequestBodyEntity] to a JSON object.
  Map<String, dynamic> toJson() => <String, dynamic>{
        'app_id': appId,
        'publicKeyCredential': publicKeyCredential,
        'type': type,
      };

  @override
  List<Object?> get props => <Object?>[appId, publicKeyCredential, type];
}
