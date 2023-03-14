import 'package:deriv_auth/core/services/jwt/models/app_auth_challenge/app_auth_challenge_response.dart';

AppAuthorizationChallengeResponseModel mockAuthChallengeModel =
    AppAuthorizationChallengeResponseModel(
  challenge: 'challenge',
  expire: 2023,
  appToken: 'appToken',
);
Map<String, dynamic> mockAuthChallengeData = <String, dynamic>{
  'challenge': 'challenge',
  'expire': 2023,
};
