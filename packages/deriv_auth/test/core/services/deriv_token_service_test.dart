import 'package:deriv_auth/core/services/api_client/base_client.dart';
import 'package:deriv_auth/core/services/token/models/login_response.dart';
import 'package:deriv_auth/deriv_auth.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import 'mock/get_tokens_request_mock.dart';
import 'mock/get_tokens_response_mock.dart';

class MockHttpClient extends Mock implements BaseHttpClient {}

class MockConnectionInfo implements AuthConnectionInfo {
  @override
  String get appId => '1000';

  @override
  String get endpoint => 'endpoint';
}

void main() {
  late final BaseHttpClient _client;
  late final DerivTokenService _tokenService;
  late final String _jwtToken;
  late final AuthConnectionInfo _connectionInfo;

  setUpAll(() {
    _client = MockHttpClient();
    _tokenService = DerivTokenService();
    _jwtToken = 'jwtToken';
    _connectionInfo = MockConnectionInfo();
    when(() => _client.post(
          url: any(named: 'url'),
          jsonBody: any(named: 'jsonBody'),
          headers: any(named: 'headers'),
        )).thenAnswer((_) async => mockGetTokenResponse);
  });
  group('deriv token service test', () {
    test('returns `GetTokensResponseModel` object', () async {
      final GetTokensResponseModel response = await _tokenService.getUserTokens(
          request: mockGetTokensRequestModel,
          client: _client,
          jwtToken: _jwtToken,
          connectionInfo: _connectionInfo);
      expect(response, isA<GetTokensResponseModel>());
    });
  });
}
