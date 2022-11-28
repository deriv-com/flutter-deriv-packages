import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:deriv_auth/src/deriv_auth/jwt_repository.dart';
import 'package:deriv_auth/src/models/app_auth_challenge/app_auth_challenge_response.dart';

abstract class BaseJwtService {
  Future<String> getJwtToken();
  void clearJwtToken();
}

class DerivJwtService implements BaseJwtService {
  DerivJwtService(this.repository);
  final BaseJwtRepository repository;

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

    return jwtToken!;
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
