import 'dart:convert';
import 'package:crypto/crypto.dart';

import '../../../../deriv_auth.dart';

/// Implementation of JWT Interface.
class DerivJwtService implements BaseJwtService {
  /// Initialize a [DerivJwtService].
  DerivJwtService({required this.jwtRepository});

  /// JWT repository,
  final BaseJwtRepository jwtRepository;

  @override
  String? jwtToken;

  @override
  Future<String> getJwtToken() async {
    if (jwtToken != null) {
      return jwtToken!;
    }

    final AppAuthorizationChallengeResponseModel challenge =
        await jwtRepository.getAppAuthorizationChallenge();

    final String solution = _solveLoginChallenge(
      appToken: challenge.appToken,
      challenge: challenge.challenge,
    );

    final String token = await jwtRepository.authorizeApp(
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
