/// [DerivPasskeysOptionsModel] DTO for DerivPasskeysOptions data coming from the WebsocketAPI.
final class DerivPasskeysOptionsModel {
  /// Creates a [DerivPasskeysOptionsModel].
  /// [challenge] is the challenge string.
  /// [rpId] is the relying party ID.
  /// [timeout] is the timeout in seconds.
  /// [userVerification] is the user verification method.
  DerivPasskeysOptionsModel({
    required this.challenge,
    required this.rpId,
    required this.timeout,
    required this.userVerification,
    required this.allowCredentials,
  });

  /// Creates a [DerivPasskeysOptionsModel] from a JSON object.
  factory DerivPasskeysOptionsModel.fromJson(Map<String, dynamic> json) =>
      DerivPasskeysOptionsModel(
        challenge: json['publicKey']['challenge'] as String,
        rpId: json['publicKey']['rpId'] as String,
        timeout: json['publicKey']['timeout'] as int,
        userVerification: json['publicKey']['userVerification'] as String,
        allowCredentials:
            json['publicKey']['allowCredentials'] as List<dynamic>? ??
                <dynamic>[],
      );

  /// [challenge] is the challenge string.
  final String challenge;

  /// [rpId] is the relying party ID.
  final String rpId;

  /// [timeout] is the timeout in seconds.
  final int timeout;

  /// [userVerification] is the user verification method.
  final String userVerification;

  /// [allowCredentials] is the allowed credentials.
  final List<dynamic> allowCredentials;

  /// Creates a JSON object from a [DerivPasskeysOptionsModel].
  Map<String, dynamic> toJson() => <String, dynamic>{
        'challenge': challenge,
        'rpId': rpId,
        'timeout': timeout,
        'userVerification': userVerification,
        'allowCredentials': allowCredentials,
      };
}
