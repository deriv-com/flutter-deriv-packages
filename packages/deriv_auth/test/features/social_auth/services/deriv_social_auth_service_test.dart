import 'dart:convert';

import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_http_client/deriv_http_client.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../mocks/mock_social_auth_provider_response.dart';
import '../mocks/mock_social_provider_model.dart';

class MockHttpClient extends Mock implements BaseHttpClient {}

class MockConnectionInfo implements AuthConnectionInfo {
  @override
  String get appId => 'appId';

  @override
  String get endpoint => 'endpoint';
}

void main() {
  late final BaseSocialAuthService _socialAuthService;
  late final MockHttpClient _client;
  late final MockConnectionInfo _connectionInfo;

  setUpAll(() {
    _client = MockHttpClient();
    _connectionInfo = MockConnectionInfo();
    _socialAuthService = DerivSocialAuthService(
      client: _client,
      connectionInfo: _connectionInfo,
    );
  });

  group('DerivSocialAuthService', () {
    test('returns a list of social auth providers.', () async {
      when(() => _client.get(any())).thenAnswer((_) async =>
          Response(jsonEncode(mockSocialAuthProviderResponse), 200));

      final List<SocialAuthProviderModel> response =
          await _socialAuthService.getSocialAuthProviders();

      expect(response, mockSocialAuthProviders);
    });
  });
}
