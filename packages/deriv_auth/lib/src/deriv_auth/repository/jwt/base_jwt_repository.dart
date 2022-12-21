import '../../../../deriv_auth.dart';

/// Interface for client side JWT token functionality.
abstract class BaseJwtRepository {
  /// Gets the Authorization challenge.
  Future<AppAuthorizationChallengeResponseModel> getAppAuthorizationChallenge();

  /// Authorize the app with the solution.
  Future<String> authorizeApp({
    required String solution,
    required int expire,
  });
}
