import 'package:equatable/equatable.dart';

/// [DerivPasskeyModel] DTO for DerivPasskey data coming from the WebsocketAPI.
class DerivPasskeyModel extends Equatable {
  /// Creates a [DerivPasskeyModel].
  const DerivPasskeyModel({
    required this.createdAt,
    required this.id,
    required this.lastUsed,
    required this.name,
    required this.passkeyId,
    required this.storedOn,
  });

  /// Creates a [DerivPasskeyModel] from a JSON object.
  factory DerivPasskeyModel.fromJson(Map<String, dynamic> json) =>
      DerivPasskeyModel(
        createdAt: json['created_at'] as int,
        id: json['id'] as int,
        lastUsed: json['last_used'] as int,
        name: json['name'] as String,
        passkeyId: json['passkey_id'] as String,
        storedOn: json['stored_on'] as String,
      );

  /// [createdAt] is the creation date.
  final int createdAt;

  /// [id] is the passkey ID.
  final int id;

  /// [lastUsed] is the last used date.
  final int lastUsed;

  /// [name] is the passkey name.
  final String name;

  /// [passkeyId] is the passkey ID.
  final String passkeyId;

  /// [storedOn] is the device the passkey is stored on.
  final String storedOn;

  @override
  List<Object> get props => <Object>[
        createdAt,
        id,
        lastUsed,
        name,
        passkeyId,
        storedOn,
      ];
}
