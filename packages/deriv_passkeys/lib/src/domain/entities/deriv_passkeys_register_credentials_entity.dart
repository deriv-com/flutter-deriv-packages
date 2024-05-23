import 'package:equatable/equatable.dart';

/// [DerivPasskeysRegisterCredentialsEntity] is the entity class for the register credentials.
final class DerivPasskeysRegisterCredentialsEntity extends Equatable {
  /// Creates a [DerivPasskeysRegisterCredentialsEntity].
  const DerivPasskeysRegisterCredentialsEntity({
    required this.publicKeyCredential,
    required this.name,
  });

  /// [publicKeyCredential] is the challenge string.
  final Map<String, dynamic> publicKeyCredential;

  /// [name] is the name of the passkey.
  final String name;

  /// Creates a JSON object from a [DerivPasskeysRegisterCredentialsEntity].
  Map<String, dynamic> toJson() => <String, dynamic>{
        'publicKeyCredential': publicKeyCredential,
        'name': name,
      };

  @override
  List<Object?> get props => <Object?>[publicKeyCredential, name];
}
