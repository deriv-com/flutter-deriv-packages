import 'package:deriv_auth/core/services/token/models/login_request.dart';
import 'package:deriv_auth/core/services/token/models/login_response.dart';
import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_http_client/deriv_http_client.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../mock/mock_token_response.dart';

class MockHttpClient extends Mock implements BaseHttpClient {}

class MockConnectionInfo implements AuthConnectionInfo {
  @override
  String get appId => '1000';

  @override
  String get endpoint => 'endpoint';
}

void main() {
  late final MockHttpClient _client;
  late final DerivTokenService _tokenService;
  late final String _jwtToken;
  late final MockConnectionInfo _connectionInfo;

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

  group('DerivTokenService', () {
    test('getUserTokens', () async {
      final GetTokensResponseModel response = await _tokenService.getUserTokens(
        request: GetTokensRequestModel(),
        jwtToken: _jwtToken,
        connectionInfo: _connectionInfo,
      );

      expect(response, isA<GetTokensResponseModel>());

      verify(
        () => _client.post(
          url: any(named: 'url'),
          jsonBody: any(named: 'jsonBody'),
          headers: any(named: 'headers'),
        ),
      ).called(1);
    });
  });
}
