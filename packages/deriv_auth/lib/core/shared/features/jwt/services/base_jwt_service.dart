/// Interface to define all JWT-related functionality.
abstract class BaseJwtService {
  /// This is where the token is saved.
  String? jwtToken;

  /// Get the JWT token.
  Future<String> getJwtToken();

  /// Delete JWT token.
  void clearJwtToken();
}
