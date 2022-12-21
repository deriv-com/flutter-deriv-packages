import 'package:deriv_auth/deriv_auth.dart';

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
    final String _baseUrl = 'https://${connectionInfo.endpoint}/oauth2/api/v1';
    final String _loginUrl = '$_baseUrl/login';

    /// Call API.
    final Map<String, dynamic> jsonResponse = await _client.post(
      url: _loginUrl,
      jsonBody:
          request.copyWith(appId: int.parse(connectionInfo.appId)).toJson(),
      headers: <String, String>{'Authorization': 'Bearer $jwtToken'},
    );

    return LoginResponseModel.fromJson(jsonResponse);
  }
}
