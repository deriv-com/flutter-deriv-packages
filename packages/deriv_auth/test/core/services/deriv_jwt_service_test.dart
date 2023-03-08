import 'package:deriv_auth/core/services/jwt/repository/base_jwt_repository.dart';
import 'package:deriv_auth/deriv_auth.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import 'mock/response_mock.dart';

class MockJwtRepository extends Mock implements BaseJwtRepository {}

void main() {
  late final BaseJwtRepository _jwtRepository;
  late final DerivJwtService _jwtService;
  late final String jwtToken;

  setUpAll(() {
    _jwtRepository = MockJwtRepository();
    _jwtService = DerivJwtService(repository: _jwtRepository);
    jwtToken = 'jwtToken';
    when(() => _jwtRepository.getAppAuthorizationChallenge())
        .thenAnswer((_) async => mockAuthChallengeModel);

    when(() => _jwtRepository.authorizeApp(
        solution: any(named: 'solution'),
        expire: any(named: 'expire'))).thenAnswer((_) async => jwtToken);
  });

  group('deriv jwt service test', () {
    test('returns jwt token that is received after authorising app', () async {
      final String token = await _jwtService.getJwtToken();
      expect(token, jwtToken);
    });
  });
}
