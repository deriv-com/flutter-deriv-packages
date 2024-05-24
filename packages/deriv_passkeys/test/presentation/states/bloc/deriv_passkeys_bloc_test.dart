import 'package:deriv_passkeys/src/domain/entities/deriv_passkey_entity.dart';
import 'package:deriv_passkeys/src/exceptions/platform_exceptions.dart';
import 'package:deriv_passkeys/src/exceptions/server_exceptions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:deriv_passkeys/deriv_passkeys.dart';

import 'deriv_passkeys_bloc_setup.dart';

void main() {
  setUp(() {
    setupDerivPasskeysBloc();
  });

  group('DerivPasskeysBloc', () {
    test('initial state should be DerivPasskeysInitializedState', () {
      expect(derivPasskeysBloc.state, isA<DerivPasskeysInitializedState>());
    });

    test(
        'initial state should be DerivPasskeysNotSupportedState if not supported',
        () async {
      when(() => mockDerivPasskeysService.isSupported())
          .thenAnswer((_) async => Future<bool>(() => false));
      final DerivPasskeysBloc unsupportedDerivPasskeysBloc = DerivPasskeysBloc(
        derivPasskeysService: mockDerivPasskeysService,
        connectionInfo: mockPasskeysConnectionInfoEntity,
        getJwtToken: () async => 'jwtToken',
      );
      await expectLater(
        unsupportedDerivPasskeysBloc.stream,
        emits(
          isA<DerivPasskeysNotSupportedState>(),
        ),
      );
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
      setupSuccessDerivPasskeysVerifyCredentialEvent();

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
            userAgent: any(named: 'userAgent'),
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
            userAgent: any(named: 'userAgent'),
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
            userAgent: any(named: 'userAgent'),
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
            userAgent: any(named: 'userAgent'),
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
          isA<DerivPasskeysLoadingState>(),
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
        emitsInOrder(<TypeMatcher<DerivPasskeysState>>[
          isA<DerivPasskeysLoadingState>(),
          isA<DerivPasskeysErrorState>(),
          isA<DerivPasskeysLoadedState>(),
        ]),
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
        emitsInOrder(<TypeMatcher<DerivPasskeysState>>[
          isA<DerivPasskeysLoadingState>(),
          isA<DerivPasskeysErrorState>(),
        ]),
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
