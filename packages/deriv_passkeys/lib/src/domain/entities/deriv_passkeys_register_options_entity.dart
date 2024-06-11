import 'package:equatable/equatable.dart';

/// [DerivPasskeysRegisterOptionsEntity] DTO for DerivPasskeysOptions data coming from the WebsocketAPI.
final class DerivPasskeysRegisterOptionsEntity extends Equatable {
  /// Creates a [DerivPasskeysRegisterOptionsEntity].
  const DerivPasskeysRegisterOptionsEntity({
    required this.options,
  });

  /// Creates a [DerivPasskeysRegisterOptionsEntity] from a JSON object.
  factory DerivPasskeysRegisterOptionsEntity.fromJson(
          Map<String, dynamic> json) =>
      DerivPasskeysRegisterOptionsEntity(options: json);

  /// [options] is the challenge string.
  final Map<String, dynamic> options;

  /// Creates a JSON object from a [DerivPasskeysRegisterOptionsEntity].
  Map<String, dynamic> toJson() => options;

  @override
  List<Object?> get props => <Object?>[options];
}
