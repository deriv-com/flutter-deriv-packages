import 'package:deriv_auth/core/connection_info.dart';
import 'package:deriv_auth/core/shared/api_client/base_client.dart';
import 'package:deriv_auth/core/shared/api_client/http_client.dart';
import 'package:deriv_auth/features/auth/models/login/login_request.dart';
import 'package:deriv_auth/features/auth/models/login/login_response.dart';

/// Helper class for all REST API functionality.
class RestAPIHelpers {
  /// Http client.
  final BaseHttpClient _client = HttpClient();

  /// Perform REST API call to log user in.
  Future<LoginResponseModel> getLoginResponse(
    LoginRequestModel request, {
    required String jwtToken,
    required AuthConnectionInfo connectionInfo,
  }) async {
    /// Extract login url from connection info.
    final String baseUrl = 'https://${connectionInfo.endpoint}/oauth2/api/v1';
    final String loginUrl = '$baseUrl/login';

    /// Call API.
    final Map<String, dynamic> jsonResponse = await _client.post(
      url: loginUrl,
      jsonBody:
          request.copyWith(appId: int.parse(connectionInfo.appId)).toJson(),
      headers: <String, String>{'Authorization': 'Bearer $jwtToken'},
    );

    return LoginResponseModel.fromJson(jsonResponse);
  }
}
