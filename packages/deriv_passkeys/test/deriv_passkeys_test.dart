import 'package:deriv_passkeys/deriv_passkeys_method_channel.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:deriv_passkeys/deriv_passkeys.dart';
import 'package:deriv_passkeys/deriv_passkeys_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockDerivPasskeysPlatform
    with MockPlatformInterfaceMixin
    implements DerivPasskeysPlatform {
  Future<String?> Function(String options)? mockCreateCredential;
  Future<String?> Function(String options)? mockGetCredential;

  String mockPlatformVersion = 'iOS 15';

  @override
  Future<String?> getPlatformVersion() => Future.value(mockPlatformVersion);

  @override
  Future<String?> createCredential(String options) {
    return mockCreateCredential != null
        ? mockCreateCredential!(options)
        : Future.value('42');
  }

  @override
  Future<String?> getCredential(String options) {
    return mockGetCredential != null
        ? mockGetCredential!(options)
        : Future.value('42');
  }
}

void main() {
  final DerivPasskeysPlatform initialPlatform = DerivPasskeysPlatform.instance;

  test('$MethodChannelDerivPasskeys is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelDerivPasskeys>());
  });

  group('DerivPasskeys', () {
    late DerivPasskeys derivPasskeys;

    setUp(() {
      derivPasskeys = DerivPasskeys();
      DerivPasskeysPlatform.instance = MockDerivPasskeysPlatform();
    });

    tearDown(() {
      DerivPasskeysPlatform.instance = initialPlatform;
    });

    test('isSupported returns true for iOS 15 or newer', () async {
      DerivPasskeysPlatform.instance = MockDerivPasskeysPlatform()
        ..mockPlatformVersion = 'iOS 15';
      final isSupported = await derivPasskeys.isSupported();
      expect(isSupported, true);
    });

    test('isSupported returns false for iOS versions older than 15', () async {
      DerivPasskeysPlatform.instance = MockDerivPasskeysPlatform()
        ..mockPlatformVersion = 'iOS 14';
      final isSupported = await derivPasskeys.isSupported();
      expect(isSupported, false);
    });

    test('isSupported returns true for Android 9 or newer', () async {
      DerivPasskeysPlatform.instance = MockDerivPasskeysPlatform()
        ..mockPlatformVersion = 'Android 9';
      final isSupported = await derivPasskeys.isSupported();
      expect(isSupported, true);
    });

    test(
        'isSupported returns false for unexpected platform string or malformed version',
        () async {
      DerivPasskeysPlatform.instance = MockDerivPasskeysPlatform()
        ..mockPlatformVersion = 'Unknown 1';
      final isSupported = await derivPasskeys.isSupported();
      expect(isSupported, false);
    });

    test('createCredential returns response if not null', () async {
      final response = await derivPasskeys.createCredential('options');
      expect(response, '42');
    });

    test('createCredential throws PlatformException if response is null',
        () async {
      DerivPasskeysPlatform.instance = MockDerivPasskeysPlatform()
        ..mockCreateCredential = (options) => Future.value(null);

      expect(() => derivPasskeys.createCredential('options'),
          throwsA(isInstanceOf<PlatformException>()));
    });

    test('getCredential returns response if not null', () async {
      final response = await derivPasskeys.getCredential('options');
      expect(response, '42');
    });

    test('getCredential throws PlatformException if response is null',
        () async {
      DerivPasskeysPlatform.instance = MockDerivPasskeysPlatform()
        ..mockGetCredential = (options) => Future.value(null);

      expect(() => derivPasskeys.getCredential('options'),
          throwsA(isInstanceOf<PlatformException>()));
    });
  });
}
