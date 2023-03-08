import 'package:deriv_auth/core/services/jwt/repository/base_jwt_repository.dart';
import 'package:deriv_auth/deriv_auth.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../mock/mock_auth_challenge_response.dart';

class MockJwtRepository extends Mock implements BaseJwtRepository {}

void main() {
  const String jwtToken = 'jwtToken';
  late final BaseJwtRepository jwtRepository;
  late final DerivJwtService jwtService;

  setUpAll(() {
    jwtRepository = MockJwtRepository();
    jwtService = DerivJwtService(repository: jwtRepository);

    when(() => jwtRepository.getAppAuthorizationChallenge())
        .thenAnswer((_) async => mockAuthChallengeModel);

    // mock the authorizeApp method to return `jwtToken`
    when(() => jwtRepository.authorizeApp(
        solution: any(named: 'solution'),
        expire: any(named: 'expire'))).thenAnswer((_) async => jwtToken);
  });

  group('DerivJwtService', () {
    test('getJwtToken', () async {
      final String token = await jwtService.getJwtToken();
      expect(token, jwtToken);
    });
  });
}
