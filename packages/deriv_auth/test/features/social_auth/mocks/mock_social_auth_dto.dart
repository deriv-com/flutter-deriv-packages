import 'package:deriv_auth/deriv_auth.dart';

final SocialAuthDto mockSocialAuthDto = SocialAuthDto(
  nonce: 'nonce',
  state: 'state',
  codeVerifier: 'codeVerifier',
  code: 'code',
  callbackState: 'callbackState',
  provider: SocialAuthProvider.google,
);

final Map<String, dynamic> mockSocialAuthDtoJson = <String, dynamic>{
  'nonce': 'nonce',
  'state': 'state',
  'code_verifier': 'codeVerifier',
  'code': 'code',
  'callback_state': 'callbackState',
  'provider': 'google',
};
