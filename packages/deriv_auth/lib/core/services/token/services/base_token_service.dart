import 'package:deriv_auth/core/connection_info.dart';
import 'package:deriv_auth/core/services/token/models/login_request.dart';
import 'package:deriv_auth/core/services/token/models/login_response.dart';
import 'package:deriv_http_client/deriv_http_client.dart';

/// An interface for functionalities which a token service should provide.
abstract class BaseTokenService {
  /// Fetches all account tokens of a single user + his single refresh token.
  Future<GetTokensResponseModel> getUserTokens({
    required GetTokensRequestModel request,
    required String jwtToken,
    required AuthConnectionInfo connectionInfo,
    String? userAgent,
  });
}
