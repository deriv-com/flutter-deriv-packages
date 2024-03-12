/// [DerivPasskeysRegisterCredentialsEntity] is the entity class for the register credentials.
final class DerivPasskeysRegisterCredentialsEntity {
  /// Creates a [DerivPasskeysRegisterCredentialsEntity].
  DerivPasskeysRegisterCredentialsEntity({
    required this.publicKeyCredential,
    required this.name,
  });

  /// [publicKeyCredential] is the challenge string.
  final Map<String, dynamic> publicKeyCredential;

  final String name;

  /// Creates a JSON object from a [DerivPasskeysRegisterCredentialsEntity].
  Map<String, dynamic> toJson() => {
        "publicKeyCredential": publicKeyCredential,
        "name": name,
      };
}
