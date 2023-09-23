import 'package:deriv_auth/features/social_auth/models/social_auth_provider_model.dart';
import 'package:test/test.dart';

void main() {
  group('SocialAuthProviderModel', () {
    test('is equatable', () {
      final SocialAuthProviderModel provider1 = SocialAuthProviderModel(
        authUrl: 'https://example.com/oauth2/google',
        codeChallenge: 'abc123',
        codeVerifier: 'def456',
        name: 'Google',
        nonce: 'xyz789',
        state: '123abc',
      );
      final SocialAuthProviderModel provider2 = SocialAuthProviderModel(
        authUrl: 'https://example.com/oauth2/google',
        codeChallenge: 'abc123',
        codeVerifier: 'def456',
        name: 'Google',
        nonce: 'xyz789',
        state: '123abc',
      );

      expect(provider1, equals(provider2));
    });

    test(
        'supports fromJson',
        () => expect(
              SocialAuthProviderModel.fromJson(<String, dynamic>{
                'auth_url': 'https://example.com/oauth2/google',
                'code_challenge': 'abc123',
                'code_verifier': 'def456',
                'name': 'Google',
                'nonce': 'xyz789',
                'state': '123abc',
              }),
              equals(SocialAuthProviderModel(
                authUrl: 'https://example.com/oauth2/google',
                codeChallenge: 'abc123',
                codeVerifier: 'def456',
                name: 'Google',
                nonce: 'xyz789',
                state: '123abc',
              )),
            ));
  });
}
