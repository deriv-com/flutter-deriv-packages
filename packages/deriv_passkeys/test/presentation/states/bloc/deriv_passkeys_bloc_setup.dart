import 'package:deriv_passkeys/deriv_passkeys.dart';
import 'package:deriv_passkeys/src/domain/entities/account_entity.dart';
import 'package:mocktail/mocktail.dart';

class MockDerivPasskeysService extends Mock implements DerivPasskeysService {}

class MockPasskeysConnectionInfoEntity extends PasskeysConnectionInfoEntity {
  MockPasskeysConnectionInfoEntity(
      {required super.endpoint, required super.appId});
}

late DerivPasskeysBloc derivPasskeysBloc;
late MockDerivPasskeysService mockDerivPasskeysService;
late MockPasskeysConnectionInfoEntity mockPasskeysConnectionInfoEntity;

void setupDerivPasskeysBloc() {
  mockDerivPasskeysService = MockDerivPasskeysService();
  mockPasskeysConnectionInfoEntity = MockPasskeysConnectionInfoEntity(
    appId: 'appId',
    endpoint: '',
  );
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
      DerivPasskeysVerifyCredentialsResponseEntity(
    accounts: <AccountEntity>[
      AccountEntity(loginId: 'VRTC1234', token: 'token'),
    ],
    refreshToken: 'refresh_token',
  );

  when(() => mockDerivPasskeysService.verifyCredential(
        jwtToken: any(named: 'jwtToken'),
        passkeysConnectionInfoEntity:
            any(named: 'passkeysConnectionInfoEntity'),
        userAgent: any(named: 'userAgent'),
      )).thenAnswer((_) async => mockResponseEntity);
}
