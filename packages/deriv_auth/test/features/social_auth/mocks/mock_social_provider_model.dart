import 'package:deriv_auth/deriv_auth.dart';

SocialAuthProviderModel mockSocialAuthProvider = SocialAuthProviderModel(
  authUrl: 'https://mock.com/auth',
  codeChallenge: 'codeChallenge',
  codeVerifier: 'codeVerifier',
  name: SocialAuthProvider.google,
  nonce: 'nonce',
  state: 'state',
);

List<SocialAuthProviderModel> mockSocialAuthProviders =
    <SocialAuthProviderModel>[
  mockSocialAuthProvider,
];
