import 'package:deriv_auth/core/connection_info.dart';
import 'package:deriv_auth/core/services/token/models/login_request.dart';
import 'package:deriv_auth/core/services/token/models/login_response.dart';
import 'package:deriv_auth/core/services/token/services/base_token_service.dart';
import 'package:deriv_http_client/deriv_http_client.dart';

/// Deriv Implementation of a [BaseTokenService].
class DerivTokenService implements BaseTokenService {
  /// Create a [DerivTokenService] instance.
  DerivTokenService([this.client]);

  /// The client to make the http request.
  final BaseHttpClient? client;

  @override
  Future<GetTokensResponseModel> getUserTokens({
    required GetTokensRequestModel request,
    required String jwtToken,
    required AuthConnectionInfo connectionInfo,
    BaseHttpClient? httpClient,
    String? userAgent,
  }) async {
    /// Extract login url from connection info.
    final String baseUrl = 'https://${connectionInfo.endpoint}/oauth2/api/v1';
    final String loginUrl = '$baseUrl/login';

    final BaseHttpClient httpClient = client ?? HttpClient();

    /// Call API.
    final Map<String, dynamic> jsonResponse = await httpClient.post(
      url: loginUrl,
      jsonBody:
          request.copyWith(appId: int.parse(connectionInfo.appId)).toJson(),
      headers: <String, String>{
        'Authorization': 'Bearer $jwtToken',
        'User-Agent': userAgent ?? 'Dart/3.0 (dart:io)'
      },
    );

    return GetTokensResponseModel.fromJson(jsonResponse);
  }
}
