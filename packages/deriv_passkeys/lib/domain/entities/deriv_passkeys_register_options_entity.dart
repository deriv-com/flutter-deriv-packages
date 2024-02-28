import 'package:deriv_passkeys/core/domain/base_entity.dart';

/// [DerivPasskeysRegisterOptionsEntity] DTO for DerivPasskeysOptions data coming from the WebsocketAPI.
final class DerivPasskeysRegisterOptionsEntity extends BaseEntity {
  /// Creates a [DerivPasskeysRegisterOptionsEntity].
  DerivPasskeysRegisterOptionsEntity({
    required this.options,
  });

  /// Creates a [DerivPasskeysRegisterOptionsEntity] from a JSON object.
  factory DerivPasskeysRegisterOptionsEntity.fromJson(
          Map<String, dynamic> json) =>
      DerivPasskeysRegisterOptionsEntity(options: json);

  /// [options] is the challenge string.
  final Map<String, dynamic> options;

  /// Creates a JSON object from a [DerivPasskeysRegisterOptionsEntity].
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'passkeys_register_options': options};
}
