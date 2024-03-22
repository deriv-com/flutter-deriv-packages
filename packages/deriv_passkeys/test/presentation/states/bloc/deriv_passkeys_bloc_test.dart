import 'package:deriv_passkeys/src/domain/entities/deriv_passkey_entity.dart';
import 'package:deriv_passkeys/src/domain/entities/deriv_passkeys_verify_credentials_response_entity.dart';
import 'package:deriv_passkeys/src/exceptions/platform_exceptions.dart';
import 'package:deriv_passkeys/src/exceptions/server_exceptions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:deriv_passkeys/deriv_passkeys.dart';

class _MockDerivPasskeysService extends Mock implements DerivPasskeysService {}

class _MockPasskeysConnectionInfoEntity extends Mock
    implements PasskeysConnectionInfoEntity {}

void main() {
  late DerivPasskeysBloc derivPasskeysBloc;
  late _MockDerivPasskeysService mockDerivPasskeysService;
  late _MockPasskeysConnectionInfoEntity mockConnectionInfoEntity;

  setUp(() {
    mockDerivPasskeysService = _MockDerivPasskeysService();
    mockConnectionInfoEntity = _MockPasskeysConnectionInfoEntity();
    when(() => mockDerivPasskeysService.isSupported())
        .thenAnswer((_) async => true);
    derivPasskeysBloc = DerivPasskeysBloc(
      derivPasskeysService: mockDerivPasskeysService,
      connectionInfo: mockConnectionInfoEntity,
      getJwtToken: () async => 'jwtToken',
    );
    registerFallbackValue(mockConnectionInfoEntity);
  });

  group('DerivPasskeysBloc', () {
    test('initial state should be DerivPasskeysInitializedState', () {
      expect(derivPasskeysBloc.state, isA<DerivPasskeysInitializedState>());
    });

    test(
        'initial state should be SetDerivPasskeysNotSupportedEvent if not supported',
        () {
      when(() => mockDerivPasskeysService.isSupported())
          .thenAnswer((_) async => false);
      expect(derivPasskeysBloc.state, isA<DerivPasskeysInitializedState>());
    });

    test(
        'SetDerivPasskeysNotSupportedEvent should emit DerivPasskeysNotSupportedState',
        () {
      expectLater(
        derivPasskeysBloc.stream,
        emits(isA<DerivPasskeysNotSupportedState>()),
      );

      derivPasskeysBloc.add(const SetDerivPasskeysNotSupportedEvent());
    });

    test(
        'DerivPasskeysVerifyCredentialEvent should emit DerivPasskeysCredentialVerifiedState',
        () {
      const DerivPasskeysVerifyCredentialsResponseEntity mockResponseEntity =
          DerivPasskeysVerifyCredentialsResponseEntity(token: 'token');

      when(() => mockDerivPasskeysService.verifyCredential(
            jwtToken: any(named: 'jwtToken'),
            passkeysConnectionInfoEntity:
                any(named: 'passkeysConnectionInfoEntity'),
          )).thenAnswer((_) async => mockResponseEntity);

      expectLater(
        derivPasskeysBloc.stream,
        emitsInOrder(<TypeMatcher<DerivPasskeysState>>[
          isA<DerivPasskeysLoadingState>(),
          isA<DerivPasskeysCredentialVerifiedState>(),
        ]),
      );

      derivPasskeysBloc.add(DerivPasskeysVerifyCredentialEvent());
    });

    test(
        'DerivPasskeysVerifyCredentialEvent should emit DerivPasskeysLoadedState if CanceledPlatformException is thrown',
        () {
      when(() => mockDerivPasskeysService.verifyCredential(
            jwtToken: any(named: 'jwtToken'),
            passkeysConnectionInfoEntity:
                any(named: 'passkeysConnectionInfoEntity'),
          )).thenAnswer((_) async => throw CanceledPlatformException(
            code: '',
            message: '',
            details: '',
          ));

      expectLater(
        derivPasskeysBloc.stream,
        emitsInOrder(<TypeMatcher<DerivPasskeysState>>[
          isA<DerivPasskeysLoadingState>(),
          isA<DerivPasskeysLoadedState>(),
        ]),
      );

      derivPasskeysBloc.add(DerivPasskeysVerifyCredentialEvent());
    });

    test(
        'DerivPasskeysVerifyCredentialEvent should emit NoCredentialErrorState if NoCredentialPlatformException is thrown',
        () {
      when(() => mockDerivPasskeysService.verifyCredential(
            jwtToken: any(named: 'jwtToken'),
            passkeysConnectionInfoEntity:
                any(named: 'passkeysConnectionInfoEntity'),
          )).thenAnswer((_) async => throw NoCredentialPlatformException(
            code: '',
            message: '',
            details: '',
          ));

      expectLater(
        derivPasskeysBloc.stream,
        emitsInOrder(<TypeMatcher<DerivPasskeysState>>[
          isA<DerivPasskeysLoadingState>(),
          isA<NoCredentialErrorState>(),
        ]),
      );

      derivPasskeysBloc.add(DerivPasskeysVerifyCredentialEvent());
    });

    test(
        'DerivPasskeysVerifyCredentialEvent should emit DerivPasskeysErrorState if ServerException is thrown',
        () {
      when(() => mockDerivPasskeysService.verifyCredential(
            jwtToken: any(named: 'jwtToken'),
            passkeysConnectionInfoEntity:
                any(named: 'passkeysConnectionInfoEntity'),
          )).thenAnswer((_) async => throw ServerException(
            errorCode: '',
            message: '',
          ));

      expectLater(
        derivPasskeysBloc.stream,
        emitsInOrder(<TypeMatcher<DerivPasskeysState>>[
          isA<DerivPasskeysLoadingState>(),
          isA<DerivPasskeysErrorState>(),
        ]),
      );

      derivPasskeysBloc.add(DerivPasskeysVerifyCredentialEvent());
    });

    test(
        'DerivPasskeysVerifyCredentialEvent should emit DerivPasskeysErrorState if any other error is thrown',
        () {
      when(() => mockDerivPasskeysService.verifyCredential(
            jwtToken: any(named: 'jwtToken'),
            passkeysConnectionInfoEntity:
                any(named: 'passkeysConnectionInfoEntity'),
          )).thenAnswer((_) async => throw Exception());

      expectLater(
        derivPasskeysBloc.stream,
        emitsInOrder(<TypeMatcher<DerivPasskeysState>>[
          isA<DerivPasskeysLoadingState>(),
          isA<DerivPasskeysErrorState>(),
        ]),
      );

      derivPasskeysBloc.add(DerivPasskeysVerifyCredentialEvent());
    });

    test(
        'DerivPasskeysCreateCredentialEvent should emit DerivPasskeysCreatedSuccessfullyState',
        () {
      const DerivPasskeyEntity mockCredential = DerivPasskeyEntity(
        id: 'id',
        name: 'name',
        createdAt: 1234,
        lastUsed: null,
        passkeyId: '',
        storedOn: '',
      );

      when(() => mockDerivPasskeysService.createCredential())
          .thenAnswer((_) async => mockCredential);

      expectLater(
        derivPasskeysBloc.stream,
        emitsInOrder(<TypeMatcher<DerivPasskeysState>>[
          isA<DerivPasskeysCreatedSuccessfullyState>(),
          isA<DerivPasskeysLoadedState>(),
        ]),
      );

      derivPasskeysBloc.add(DerivPasskeysCreateCredentialEvent());
    });

    test(
        'DerivPasskeysCreateCredentialEvent should emit DerivPasskeysLoadedState if CanceledPlatformException is thrown',
        () {
      when(() => mockDerivPasskeysService.createCredential())
          .thenAnswer((_) async => throw CanceledPlatformException(
                code: '',
                message: '',
                details: '',
              ));

      expectLater(
        derivPasskeysBloc.stream,
        emits(
          isA<DerivPasskeysLoadedState>(),
        ),
      );

      derivPasskeysBloc.add(DerivPasskeysCreateCredentialEvent());
    });

    test(
        'DerivPasskeysCreateCredentialEvent should emit DerivPasskeysErrorState if any other error is thrown',
        () {
      when(() => mockDerivPasskeysService.createCredential())
          .thenAnswer((_) async => throw Exception());

      expectLater(
        derivPasskeysBloc.stream,
        emits(
          isA<DerivPasskeysErrorState>(),
        ),
      );

      derivPasskeysBloc.add(DerivPasskeysCreateCredentialEvent());
    });

    test(
        'DerivPasskeysGetPasskeysListEvent should emit DerivPasskeysLoadedState',
        () {
      final List<DerivPasskeyEntity> mockPasskeys = <DerivPasskeyEntity>[
        const DerivPasskeyEntity(
          id: 'id',
          name: 'name',
          createdAt: 1234,
          lastUsed: null,
          passkeyId: '',
          storedOn: '',
        ),
      ];

      when(() => mockDerivPasskeysService.getPasskeysList())
          .thenAnswer((_) async => mockPasskeys);

      expectLater(
        derivPasskeysBloc.stream,
        emitsInOrder(<TypeMatcher<DerivPasskeysState>>[
          isA<DerivPasskeysLoadingState>(),
          isA<DerivPasskeysLoadedState>(),
        ]),
      );

      derivPasskeysBloc.add(const DerivPasskeysGetPasskeysListEvent());
    });

    test(
        'DerivPasskeysGetPasskeysListEvent should emit DerivPasskeysErrorState if any error is thrown',
        () {
      when(() => mockDerivPasskeysService.getPasskeysList())
          .thenAnswer((_) async => throw Exception());

      expectLater(
        derivPasskeysBloc.stream,
        emitsInOrder(<TypeMatcher<DerivPasskeysState>>[
          isA<DerivPasskeysLoadingState>(),
          isA<DerivPasskeysErrorState>(),
        ]),
      );

      derivPasskeysBloc.add(const DerivPasskeysGetPasskeysListEvent());
    });
  });
}
