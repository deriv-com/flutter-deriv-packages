import 'package:equatable/equatable.dart';

/// [DerivPasskeysOptionsEntity] represents a DerivPasskeysOptions entity.
final class DerivPasskeysOptionsEntity extends Equatable {
  /// Creates a [DerivPasskeysOptionsEntity].
  /// [challenge] is the challenge string.
  /// [rpId] is the relying party ID.
  /// [timeout] is the timeout in seconds.
  /// [userVerification] is the user verification method.
  const DerivPasskeysOptionsEntity({
    required this.challenge,
    required this.rpId,
    required this.timeout,
    required this.userVerification,
    required this.allowCredentials,
  });

  /// Creates a [DerivPasskeysOptionsEntity] from a JSON object.
  factory DerivPasskeysOptionsEntity.fromJson(Map<String, dynamic> json) =>
      DerivPasskeysOptionsEntity(
        challenge: json['challenge'] as String,
        rpId: json['rpId'] as String,
        timeout: json['timeout'] as int,
        userVerification: json['userVerification'] as String,
        allowCredentials: json['allowCredentials'] as List<dynamic>,
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

  /// Creates a JSON object from a [DerivPasskeysOptionsEntity].
  Map<String, dynamic> toJson() => <String, dynamic>{
        'challenge': challenge,
        'rpId': rpId,
        'timeout': timeout,
        'userVerification': userVerification,
        'allowCredentials': allowCredentials,
      };

  @override
  List<Object?> get props => <Object?>[
        challenge,
        rpId,
        timeout,
        userVerification,
        allowCredentials,
      ];
}
