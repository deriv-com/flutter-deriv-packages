import 'package:deriv_auth/core/connection_info.dart';

import 'package:deriv_auth/features/social_auth/models/social_auth_provider_model.dart';
import 'package:deriv_http_client/deriv_http_client.dart';

import 'package:http/http.dart';

import 'base_social_auth_service.dart';
import 'dart:convert' as convert;

/// Deriv implementation of [BaseSocialAuthService].
class DerivSocialAuthService implements BaseSocialAuthService {
  /// Initialize a [DerivSocialAuthService].
  DerivSocialAuthService({required this.client, required this.connectionInfo});

  /// Client implementation of [BaseHttpClient].
  final BaseHttpClient client;

  /// Client connection info.
  final AuthConnectionInfo connectionInfo;

  @override
  Future<List<SocialAuthProviderModel>> getSocialAuthProviders() async {
    final String baseUrl = 'https://${connectionInfo.endpoint}/oauth2/api/v1';
    final String socialSignupProvidersUrl =
        '$baseUrl/social-login/providers/${connectionInfo.appId}';

    final Response response = await client.get(
      socialSignupProvidersUrl,
    );

    final Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);

    if (response.statusCode ~/ 100 != 2) {
      throw HTTPClientException(
        errorCode: jsonResponse['error_code'],
        statusCode: response.statusCode,
        message: jsonResponse.containsKey('message')
            ? jsonResponse['message']
            : 'Server Error',
      );
    }

    return (jsonResponse['data'] as List<dynamic>)
        .map<SocialAuthProviderModel>(
            (dynamic provider) => SocialAuthProviderModel.fromJson(provider))
        .toList();
  }
}
