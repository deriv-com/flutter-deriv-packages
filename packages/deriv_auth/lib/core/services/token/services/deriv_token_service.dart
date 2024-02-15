import 'package:deriv_auth/core/connection_info.dart';
import 'package:deriv_auth/core/services/token/models/login_request.dart';
import 'package:deriv_auth/core/services/token/models/login_response.dart';
import 'package:deriv_auth/core/services/token/services/base_token_service.dart';
import 'package:deriv_http_client/deriv_http_client.dart';
import 'dart:io' as io;
import 'package:flutter_system_proxy/flutter_system_proxy.dart';
import 'package:http/io_client.dart';

/// Deriv Implementation of a [BaseTokenService].
class DerivTokenService implements BaseTokenService {
  @override
  Future<GetTokensResponseModel> getUserTokens({
    required GetTokensRequestModel request,
    required String jwtToken,
    required AuthConnectionInfo connectionInfo,
    String? userAgent,
  }) async {
    /// Extract login url from connection info.
    final String baseUrl = 'https://${connectionInfo.endpoint}/oauth2/api/v1';
    final String loginUrl = '$baseUrl/login';

    final String proxy =
        await FlutterSystemProxy.findProxyFromEnvironment(baseUrl);

    final io.HttpClient httpClient = io.HttpClient();
    httpClient.findProxy = (uri) => proxy;

    final HttpClient client = HttpClient(IOClient(httpClient));

    /// Call API.
    final Map<String, dynamic> jsonResponse = await client.post(
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
