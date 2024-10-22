import 'package:deriv_auth/core/services/jwt/models/app_auth_challenge/app_auth_challenge_response.dart';
import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_http_client/deriv_http_client.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../mock/mock_auth_challenge_response.dart';

class MockHttpClient extends Mock implements BaseHttpClient {}

class MockConnectionInfo extends Mock implements AuthConnectionInfo {
  @override
  String get appId => '123456';

  @override
  String get endpoint => 'endpoint';
}

void main() {
  late final MockHttpClient _client;
  late final MockConnectionInfo _connectionInfo;
  late final DerivJwtRepository _repository;

  setUpAll(() {
    _client = MockHttpClient();
    _connectionInfo = MockConnectionInfo();
    _repository = DerivJwtRepository(
      client: _client,
      connectionInfo: _connectionInfo,
      getAppToken: ()=> 'appToken',
    );
  });

  group('DerivJwtRepository', () {
    test('.authorizeApp should return the token.', () async {
      const String validToken = 'validToken';

      when(() => _client.post(
            url: any(named: 'url', that: contains('authorize')),
            jsonBody: any(named: 'jsonBody'),
            headers: any(named: 'headers'),
          )).thenAnswer(
        (_) async => <String, dynamic>{'token': validToken},
      );

      final String result = await _repository.authorizeApp(
        solution: 'solution',
        expire: 123456,
      );

      expect(result, 'validToken');
    });

    test(
        '.getAppAuthorizationChallenge should return [AppAuthorizationChallengeResponseModel].',
        () async {
      when(() => _client.post(
            url: any(named: 'url', that: contains('verify')),
            jsonBody: any(named: 'jsonBody'),
            headers: any(named: 'headers'),
          )).thenAnswer(
        (_) async => mockAuthChallengeData,
      );

      final AppAuthorizationChallengeResponseModel result =
          await _repository.getAppAuthorizationChallenge();

      expect(result, isA<AppAuthorizationChallengeResponseModel>());
    });
  });
}
