import 'package:deriv_auth/core/services/jwt/repository/base_jwt_repository.dart';
import 'package:deriv_auth/deriv_auth.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../mock/mock_auth_challenge_response.dart';

class MockJwtRepository extends Mock implements BaseJwtRepository {}

void main() {
  const String _jwtToken = 'jwtToken';

  late final MockJwtRepository _jwtRepository;
  late final DerivJwtService _jwtService;

  setUpAll(() {
    _jwtRepository = MockJwtRepository();
    _jwtService = DerivJwtService(repository: _jwtRepository);

    when(() => _jwtRepository.getAppAuthorizationChallenge())
        .thenAnswer((_) async => mockAuthChallengeModel);

    // Mock the authorizeApp method to return `jwtToken`.
    when(() => _jwtRepository.authorizeApp(
          solution: any(named: 'solution'),
          expire: any(named: 'expire'),
        )).thenAnswer((_) async => _jwtToken);
  });

  group('DerivJwtService', () {
    test('getJwtToken', () async {
      final String token = await _jwtService.getJwtToken();

      expect(token, _jwtToken);

      verify(() => _jwtRepository.getAppAuthorizationChallenge()).called(1);
      verify(() => _jwtRepository.authorizeApp(
          solution: any(named: 'solution'),
          expire: any(named: 'expire'))).called(1);
    });
  });
}
