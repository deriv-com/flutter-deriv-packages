import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:deriv_auth/core/services/jwt/models/app_auth_challenge/app_auth_challenge_response.dart';
import 'package:deriv_auth/core/services/jwt/repository/base_jwt_repository.dart';

import 'base_jwt_service.dart';

/// Implementation of JWT Interface.
class DerivJwtService implements BaseJwtService {
  /// Initialize a [DerivJwtService].
  DerivJwtService({required this.repository});

  /// JWT repository,
  final BaseJwtRepository repository;

  @override
  String? jwtToken;

  @override
  Future<String> getJwtToken() async {
    if (jwtToken != null) {
      return jwtToken!;
    }

    final AppAuthorizationChallengeResponseModel challenge =
        await repository.getAppAuthorizationChallenge();

    final String solution = _solveLoginChallenge(
      appToken: challenge.appToken,
      challenge: challenge.challenge,
    );

    final String token = await repository.authorizeApp(
      solution: solution,
      expire: challenge.expire,
    );

    jwtToken = token;

    return token;
  }

  @override
  void clearJwtToken() => jwtToken = null;

  /// This function solves login challenge sent by server.
  String _solveLoginChallenge({
    required String appToken,
    required String challenge,
  }) {
    final List<int> encodedAppToken = utf8.encode(appToken);
    final List<int> encodedChallenge = utf8.encode(challenge);

    final Hmac hmacSHA256 = Hmac(sha256, encodedAppToken);
    final Digest digest = hmacSHA256.convert(encodedChallenge);

    return digest.toString();
  }
}
