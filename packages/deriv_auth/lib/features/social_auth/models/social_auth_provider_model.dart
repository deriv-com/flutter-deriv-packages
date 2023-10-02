import 'package:deriv_auth/deriv_auth.dart';
import 'package:equatable/equatable.dart';

/// A class that contains the data of a social auth provider.
class SocialAuthProviderModel with EquatableMixin {
  /// Initialize a [SocialAuthProviderModel].
  SocialAuthProviderModel({
    required this.authUrl,
    required this.codeChallenge,
    required this.codeVerifier,
    required this.name,
    required this.nonce,
    required this.state,
  });

  /// Initialize a [SocialAuthProviderModel] from a JSON.
  factory SocialAuthProviderModel.fromJson(Map<String, dynamic> json) =>
      SocialAuthProviderModel(
        authUrl: json['auth_url'],
        codeChallenge: json['code_challenge'],
        codeVerifier: json['code_verifier'],
        name: SocialAuthProvider.values.byName(json['name']),
        nonce: json['nonce'],
        state: json['state'],
      );

  /// Url to social auth provider.
  final String authUrl;

  /// Code challenge.
  final String codeChallenge;

  /// Code verifier.
  final String codeVerifier;

  /// Name of social auth provider.
  final SocialAuthProvider name;

  /// Nonce.
  final String nonce;

  /// State.
  final String state;

  @override
  List<Object?> get props => <Object?>[
        authUrl,
        codeChallenge,
        codeVerifier,
        name,
        nonce,
        state,
      ];
}
