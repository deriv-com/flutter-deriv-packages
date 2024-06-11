import 'package:deriv_passkeys/deriv_passkeys.dart';
import 'package:mocktail/mocktail.dart';

class MockDerivPasskeysService extends Mock implements DerivPasskeysService {}

class MockPasskeysConnectionInfoEntity extends Mock
    implements PasskeysConnectionInfoEntity {}

late DerivPasskeysBloc derivPasskeysBloc;
late MockDerivPasskeysService mockDerivPasskeysService;
late MockPasskeysConnectionInfoEntity mockPasskeysConnectionInfoEntity;

void setupDerivPasskeysBloc() {
  mockDerivPasskeysService = MockDerivPasskeysService();
  mockPasskeysConnectionInfoEntity = MockPasskeysConnectionInfoEntity();
  when(() => mockDerivPasskeysService.isSupported())
      .thenAnswer((_) async => true);
  derivPasskeysBloc = DerivPasskeysBloc(
    derivPasskeysService: mockDerivPasskeysService,
    connectionInfo: mockPasskeysConnectionInfoEntity,
    getJwtToken: () async => 'jwtToken',
  );
  registerFallbackValue(mockPasskeysConnectionInfoEntity);
  registerFallbackValue(() async => 'userAgent');
}

void setupSuccessDerivPasskeysVerifyCredentialEvent() {
  const DerivPasskeysVerifyCredentialsResponseEntity mockResponseEntity =
      DerivPasskeysVerifyCredentialsResponseEntity(token: 'token');

  when(() => mockDerivPasskeysService.verifyCredential(
        jwtToken: any(named: 'jwtToken'),
        passkeysConnectionInfoEntity:
            any(named: 'passkeysConnectionInfoEntity'),
        userAgent: any(named: 'userAgent'),
      )).thenAnswer((_) async => mockResponseEntity);
}
