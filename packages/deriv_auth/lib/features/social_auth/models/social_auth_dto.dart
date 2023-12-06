import 'package:deriv_auth/deriv_auth.dart';

/// Represents data to be sent to the server to authenticate a user with social account.
class SocialAuthDto {
  /// Initialize a [SocialAuthDto].
  SocialAuthDto({
    required this.nonce,
    required this.state,
    required this.codeVerifier,
    required this.code,
    required this.callbackState,
    required this.provider,
  });

  /// Nonce received from social auth provider.
  final String nonce;

  /// State received from social auth provider.
  final String state;

  /// Code verifier received from social auth provider.
  final String codeVerifier;

  /// Code received from redirect url.
  final String code;

  /// Callback state received from redirect url.
  final String callbackState;

  /// Social Auth Provider name.
  final SocialAuthProvider provider;

  /// Converts [SocialAuthDto] to JSON.
  Map<String, dynamic> toJson() => <String, dynamic>{
        'nonce': nonce,
        'state': state,
        'code_verifier': codeVerifier,
        'code': code,
        'callback_state': callbackState,
        'provider': provider.name,
      };
}
