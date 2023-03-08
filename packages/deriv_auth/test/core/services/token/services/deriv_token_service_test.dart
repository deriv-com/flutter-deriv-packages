import 'package:deriv_auth/core/services/api_client/base_client.dart';
import 'package:deriv_auth/core/services/token/models/login_request.dart';
import 'package:deriv_auth/core/services/token/models/login_response.dart';
import 'package:deriv_auth/deriv_auth.dart';
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
  late final BaseHttpClient client;
  late final DerivTokenService tokenService;
  late final String jwtToken;
  late final AuthConnectionInfo connectionInfo;

  setUpAll(() {
    client = MockHttpClient();
    tokenService = DerivTokenService();
    jwtToken = 'jwtToken';
    connectionInfo = MockConnectionInfo();

    when(() => client.post(
          url: any(named: 'url'),
          jsonBody: any(named: 'jsonBody'),
          headers: any(named: 'headers'),
        )).thenAnswer((_) async => mockGetTokenResponse);
  });
  group('DerivTokenService', () {
    test('getUserTokens', () async {
      final GetTokensResponseModel response = await tokenService.getUserTokens(
          request: GetTokensRequestModel(),
          client: client,
          jwtToken: jwtToken,
          connectionInfo: connectionInfo);
      expect(response, isA<GetTokensResponseModel>());
    });
  });
}
