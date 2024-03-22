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
        id: json['id'].toString(),
        lastUsed:
            (json['last_used'] as int?) == 0 ? null : json['last_used'] as int?,
        name: json['name'] as String,
        passkeyId: json['passkey_id'] as String,
        storedOn: json['stored_on'] as String,
      );

  /// Creates a JSON object from a [DerivPasskeyModel].
  Map<String, dynamic> toJson() => <String, dynamic>{
        'created_at': createdAt,
        'id': id,
        'last_used': lastUsed,
        'name': name,
        'passkey_id': passkeyId,
        'stored_on': storedOn,
      };

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
  List<Object?> get props =>
      <Object?>[createdAt, id, lastUsed, name, passkeyId, storedOn];
}
