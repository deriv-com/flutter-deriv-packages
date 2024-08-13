import 'package:deriv_passkeys/deriv_passkeys.dart';
import 'package:deriv_passkeys/src/data/models/deriv_passkey_model.dart';
import 'package:deriv_passkeys/src/data/platform/deriv_passkeys_method_channel.dart';
import 'package:deriv_passkeys/src/domain/platform/base_deriv_passkeys_method_channel.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import '../data/deriv_passkeys_data_source_mock_setup.dart';

class MockBaseDerivPasskeysMethodChannel
    with MockPlatformInterfaceMixin
    implements BaseDerivPasskeysMethodChannel {
  Future<String?> Function(String options)? mockCreateCredential;
  Future<String?> Function(String options)? mockGetCredential;

  @override
  Future<bool?> isPlatformSupported() => Future<bool?>.value(true);

  @override
  Future<String?> createCredential(String options) =>
      mockCreateCredential != null
          ? mockCreateCredential!(options)
          : Future<String?>.value('{}');

  @override
  Future<String?> getCredential(String options) => mockGetCredential != null
      ? mockGetCredential!(options)
      : Future<String?>.value('{}');
}

void main() {
  final BaseDerivPasskeysMethodChannel initialPlatform =
      BaseDerivPasskeysMethodChannel.instance;

  test('$MethodChannelDerivPasskeys is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelDerivPasskeys>());
  });

  group('DerivPasskeys', () {
    late DerivPasskeysService derivPasskeysService;
    final MockDerivPasskeysDataSource mockDerivPasskeysDataSource =
        MockDerivPasskeysDataSource();

    setUp(() {
      derivPasskeysDataSourceMockSetup();
      derivPasskeysService = DerivPasskeysService(
        DerivPasskeysRepository(
          mockDerivPasskeysDataSource,
        ),
      );
      BaseDerivPasskeysMethodChannel.instance =
          MockBaseDerivPasskeysMethodChannel();
    });

    tearDown(() {
      BaseDerivPasskeysMethodChannel.instance = initialPlatform;
    });

    test('isSupported returns true', () async {
      final bool isSupported = await derivPasskeysService.isSupported();
      expect(isSupported, true);
    });

    test('createCredential returns response if not null', () async {
      when(() => mockDerivPasskeysDataSource.getRegisterOptions())
          .thenAnswer((_) async => derivPasskeysRegisterOptionsModel);
      when(() => mockDerivPasskeysDataSource.registerCredentials(
            any(),
          )).thenAnswer((_) async => derivPasskeyModel);
      final DerivPasskeyEntity response =
          await derivPasskeysService.createCredential();
      expect(response, isNotNull);
      expect(response, isA<DerivPasskeyEntity>());
    });

    test('createCredential throws PlatformException if response is null',
        () async {
      when(() => mockDerivPasskeysDataSource.getRegisterOptions())
          .thenAnswer((_) async => derivPasskeysRegisterOptionsModel);

      BaseDerivPasskeysMethodChannel
          .instance = MockBaseDerivPasskeysMethodChannel()
        ..mockCreateCredential = (String options) => Future<String?>.value();
      expect(
        () => derivPasskeysService.createCredential(),
        throwsA(isA<PlatformException>()),
      );
    });

    test('verifyCredential returns response if not null', () async {
      when(() => mockDerivPasskeysDataSource.getOptions(
            passkeysConnectionInfoModel:
                any(named: 'passkeysConnectionInfoModel'),
          )).thenAnswer(
        (_) async => derivPasskeysOptionsModel,
      );
      when(() => mockDerivPasskeysDataSource.verifyCredentials(
                requestBodyModel: any(named: 'requestBodyModel'),
                jwtToken: any(named: 'jwtToken'),
                passkeysConnectionInfoModel:
                    any(named: 'passkeysConnectionInfoModel'),
                userAgent: any(named: 'userAgent'),
              ))
          .thenAnswer((_) async => derivPasskeysVerifyCredentialsResponseModel);
      final DerivPasskeysVerifyCredentialsResponseEntity response =
          await derivPasskeysService.verifyCredential(
        jwtToken: jwtToken,
        passkeysConnectionInfoEntity: passkeysConnectionInfoEntity,
      );
      expect(response, isNotNull);
      expect(response, isA<DerivPasskeysVerifyCredentialsResponseEntity>());
    });

    test('verifyCredential throws PlatformException if response is null',
        () async {
      when(() => mockDerivPasskeysDataSource.getOptions(
            passkeysConnectionInfoModel:
                any(named: 'passkeysConnectionInfoModel'),
          )).thenAnswer(
        (_) async => derivPasskeysOptionsModel,
      );
      BaseDerivPasskeysMethodChannel.instance =
          MockBaseDerivPasskeysMethodChannel()
            ..mockGetCredential = (String options) => Future<String?>.value();

      expect(
          () => derivPasskeysService.verifyCredential(
                jwtToken: jwtToken,
                passkeysConnectionInfoEntity: passkeysConnectionInfoEntity,
              ),
          throwsA(isInstanceOf<PlatformException>()));
    });
    test('getPasskeysList returns response if not null', () async {
      when(() => mockDerivPasskeysDataSource.getPasskeysList())
          .thenAnswer((_) async => <DerivPasskeyModel>[derivPasskeyModel]);
      final List<DerivPasskeyEntity> response = await DerivPasskeysService(
        DerivPasskeysRepository(
          mockDerivPasskeysDataSource,
        ),
      ).getPasskeysList();
      expect(response, isNotNull);
      expect(response, isA<List<DerivPasskeyEntity>>());
    });
  });
}
