import 'package:deriv_passkeys/data/data_sources/base_deriv_passkeys_data_source.dart';
import 'package:deriv_passkeys/data/mappers/deriv_passkeys_mapper.dart';
import 'package:deriv_passkeys/data/models/deriv_passkeys_options_model.dart';
import 'package:deriv_passkeys/data/repositories/deriv_passkeys_repository.dart';
import 'package:deriv_passkeys/data/platform/deriv_passkeys_method_channel.dart';
import 'package:deriv_passkeys/domain/platform/base_deriv_passkeys_method_channel.dart';
import 'package:deriv_passkeys/interactor/services/deriv_passkeys_service.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBaseDerivPasskeysMethodChannel
    with MockPlatformInterfaceMixin
    implements BaseDerivPasskeysMethodChannel {
  Future<String?> Function(String options)? mockCreateCredential;
  Future<String?> Function(String options)? mockGetCredential;

  String mockPlatformVersion = 'iOS 15';

  @override
  Future<String?> getPlatformVersion() =>
      Future<String?>.value(mockPlatformVersion);

  @override
  Future<String?> createCredential(String options) =>
      mockCreateCredential != null
          ? mockCreateCredential!(options)
          : Future<String?>.value('42');

  @override
  Future<String?> getCredential(String options) => mockGetCredential != null
      ? mockGetCredential!(options)
      : Future<String?>.value('42');
}

final class MockDerivPasskeysDataSource extends BaseDerivPasskeysDataSource {
  MockDerivPasskeysDataSource(super.mapper);

  @override
  Future<DerivPasskeysOptionsModel> getOptions() =>
      Future<DerivPasskeysOptionsModel>.value(DerivPasskeysOptionsModel(
        challenge: 'challenge',
        rpId: 'rpId',
        allowCredentials: <dynamic>[],
        userVerification: 'userVerification',
        timeout: 18000,
      ));
}

void main() {
  final BaseDerivPasskeysMethodChannel initialPlatform =
      BaseDerivPasskeysMethodChannel.instance;

  test('$MethodChannelDerivPasskeys is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelDerivPasskeys>());
  });

  group('DerivPasskeys', () {
    late DerivPasskeysService derivPasskeysService;

    setUp(() {
      derivPasskeysService = DerivPasskeysService(
        DerivPasskeysRepository(
          MockDerivPasskeysDataSource(
            DerivPasskeysMapper(),
          ),
        ),
      );
      BaseDerivPasskeysMethodChannel.instance =
          MockBaseDerivPasskeysMethodChannel();
    });

    tearDown(() {
      BaseDerivPasskeysMethodChannel.instance = initialPlatform;
    });

    test('isSupported returns true for iOS 15 or newer', () async {
      BaseDerivPasskeysMethodChannel.instance =
          MockBaseDerivPasskeysMethodChannel()..mockPlatformVersion = 'iOS 15';
      final bool isSupported = await derivPasskeysService.isSupported();
      expect(isSupported, true);
    });

    test('isSupported returns false for iOS versions older than 15', () async {
      BaseDerivPasskeysMethodChannel.instance =
          MockBaseDerivPasskeysMethodChannel()..mockPlatformVersion = 'iOS 14';
      final bool isSupported = await derivPasskeysService.isSupported();
      expect(isSupported, false);
    });

    test('isSupported returns true for Android 9 or newer', () async {
      BaseDerivPasskeysMethodChannel.instance =
          MockBaseDerivPasskeysMethodChannel()
            ..mockPlatformVersion = 'Android 9';
      final bool isSupported = await derivPasskeysService.isSupported();
      expect(isSupported, true);
    });

    test(
        'isSupported returns false for unexpected platform string or malformed version',
        () async {
      BaseDerivPasskeysMethodChannel.instance =
          MockBaseDerivPasskeysMethodChannel()
            ..mockPlatformVersion = 'Unknown 1';
      final bool isSupported = await derivPasskeysService.isSupported();
      expect(isSupported, false);
    });

    test('createCredential returns response if not null', () async {
      final String response =
          await derivPasskeysService.createCredential('options');
      expect(response, '42');
    });

    test('createCredential throws PlatformException if response is null',
        () async {
      BaseDerivPasskeysMethodChannel
          .instance = MockBaseDerivPasskeysMethodChannel()
        ..mockCreateCredential = (String options) => Future<String?>.value();

      expect(() => derivPasskeysService.createCredential('options'),
          throwsA(isInstanceOf<PlatformException>()));
    });

    test('getCredential returns response if not null', () async {
      final String response = await derivPasskeysService.getCredential();
      expect(response, '42');
    });

    test('getCredential throws PlatformException if response is null',
        () async {
      BaseDerivPasskeysMethodChannel.instance =
          MockBaseDerivPasskeysMethodChannel()
            ..mockGetCredential = (String options) => Future<String?>.value();

      expect(() => derivPasskeysService.getCredential(),
          throwsA(isInstanceOf<PlatformException>()));
    });
  });
}
