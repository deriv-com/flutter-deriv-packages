import 'package:deriv_auth/core/services/jwt/models/app_auth_challenge/app_auth_challenge_response.dart';

Map<String, dynamic> mockGetTokenResponse = <String, dynamic>{
  'tokens': <Map<String, String>>[
    <String, String>{'loginid': 'CR123', 'token': 'ACCESS_TOKEN_1'},
    <String, String>{'loginid': 'CR124', 'token': 'ACCESS_TOKEN_2'},
  ],
  'refresh_token': 'REFRESH_TOKEN',
  'social_type': 'login',
};

AppAuthorizationChallengeResponseModel mockAuthChallengeModel =
    AppAuthorizationChallengeResponseModel(
        challenge: 'challenge', expire: 2023, appToken: 'appToken');
