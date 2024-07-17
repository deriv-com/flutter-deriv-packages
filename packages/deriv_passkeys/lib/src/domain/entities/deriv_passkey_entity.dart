import 'package:equatable/equatable.dart';

/// [DerivPasskeyEntity] DTO for DerivPasskey data coming from the WebsocketAPI.
class DerivPasskeyEntity extends Equatable {
  /// Creates a [DerivPasskeyEntity].
  const DerivPasskeyEntity({
    required this.createdAt,
    required this.id,
    required this.lastUsed,
    required this.name,
    required this.passkeyId,
    required this.storedOn,
  });

  /// Creates a [DerivPasskeyEntity] from a JSON object.
  factory DerivPasskeyEntity.fromJson(Map<String, dynamic> json) =>
      DerivPasskeyEntity(
        createdAt: json['created_at'] as int,
        id: json['id'] as String,
        lastUsed: json['last_used'] as int?,
        name: json['name'] as String,
        passkeyId: json['passkey_id'] as String,
        storedOn: json['stored_on'] as String,
      );

  /// [createdAt] is the creation date.
  final int createdAt;

  /// [id] is the passkey ID.
  final String id;

  /// [lastUsed] is the last used date.
  final int? lastUsed;

  /// [name] is the passkey name.
  final String name;

  /// [passkeyId] is the passkey ID.
  final String passkeyId;

  /// [storedOn] is the device the passkey is stored on.
  final String storedOn;

  @override
  List<Object?> get props => <Object?>[
        createdAt,
        id,
        lastUsed,
        name,
        passkeyId,
        storedOn,
      ];
}
