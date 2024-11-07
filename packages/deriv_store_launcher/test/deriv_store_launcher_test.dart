import 'package:deriv_store_launcher/deriv_store_launcher.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mock_platform_checker.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const MethodChannel channel = MethodChannel('deriv_store_launcher');
  final List<MethodCall> methodCalls = <MethodCall>[];

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
      methodCalls.add(methodCall);
      return null;
    });
  });

  tearDown(() {
    methodCalls.clear();
  });

  group('Platform Android Tests', () {
    setUp(() {
      // Mock platform to be Android
      final MockPlatformChecker mockPlatformChecker =
          MockPlatformChecker(isIOS: false);
      DerivStoreLauncher.platformChecker = mockPlatformChecker;
    });

    test('openStoreListing launches the app store on Android', () async {
      await DerivStoreLauncher.openStoreListing(
        androidPackageName: 'android_package_name',
        iosUrlScheme: 'ios_url_scheme',
        iosAppStoreId: 'ios_app_store_id',
      );

      expect(methodCalls, <Matcher>[
        isMethodCall('openStore', arguments: <String, String>{
          'package_name': 'android_package_name',
          'ios_app_store_id': 'ios_app_store_id',
        }),
      ]);
    });

    test('isAppInstalled checks if the app is installed', () async {
      await DerivStoreLauncher.isAppInstalled(
        androidPackageName: 'android_package_name',
        iosUrlScheme: 'ios_url_scheme',
      );

      expect(methodCalls, <Matcher>[
        isMethodCall('isAppInstalled', arguments: <String, String>{
          'package_name': 'android_package_name',
        }),
      ]);
    });

    test('openApp launches the app or store when app is installed', () async {
      await DerivStoreLauncher.openApp(
        androidPackageName: 'android_package_name',
        iosUrlScheme: 'ios_url_scheme',
        iosAppStoreId: 'ios_app_store_id',
      );

      expect(methodCalls, <Matcher>[
        isMethodCall('openApp', arguments: <String, String>{
          'package_name': 'android_package_name',
          'ios_app_store_id': 'ios_app_store_id',
          'open_store': 'false',
        }),
      ]);
    });

    test('openApp launches the store if app is not installed', () async {
      await DerivStoreLauncher.openApp(
        androidPackageName: 'android_package_name',
        iosUrlScheme: 'ios_url_scheme',
        iosAppStoreId: 'ios_app_store_id',
        openStore: true,
      );

      expect(methodCalls, <Matcher>[
        isMethodCall('openApp', arguments: <String, String>{
          'package_name': 'android_package_name',
          'ios_app_store_id': 'ios_app_store_id',
          'open_store': 'true',
        }),
      ]);
    });

    test('openApp throws error for empty package name', () async {
      expect(
        () async => DerivStoreLauncher.openApp(
          androidPackageName: '',
          iosUrlScheme: 'ios_url_scheme',
          iosAppStoreId: 'ios_app_store_id',
        ),
        throwsA(isA<ArgumentError>()),
      );
    });

    test('openStoreListing throws error for empty package name', () async {
      expect(
        () async => DerivStoreLauncher.openStoreListing(
          androidPackageName: '',
          iosUrlScheme: 'ios_url_scheme',
          iosAppStoreId: 'ios_app_store_id',
        ),
        throwsA(isA<ArgumentError>()),
      );
    });
  });

  group('Platform iOS Tests', () {
    setUp(() {
      // Mock platform to be iOS
      final MockPlatformChecker mockPlatformChecker =
          MockPlatformChecker(isIOS: true);
      DerivStoreLauncher.platformChecker = mockPlatformChecker;
    });

    test('openStoreListing launches the app store on iOS', () async {
      await DerivStoreLauncher.openStoreListing(
        androidPackageName: 'android_package_name',
        iosUrlScheme: 'ios_url_scheme',
        iosAppStoreId: 'ios_app_store_id',
      );

      expect(methodCalls, <Matcher>[
        isMethodCall('openStore', arguments: <String, String>{
          'package_name': 'ios_url_scheme',
          'ios_app_store_id': 'ios_app_store_id',
        }),
      ]);
    });

    test('openApp throws error for empty iosUrlScheme', () async {
      expect(
        () async => DerivStoreLauncher.openApp(
          androidPackageName: 'android_package_name',
          iosUrlScheme: '',
          iosAppStoreId: 'ios_app_store_id',
        ),
        throwsA(isA<ArgumentError>()),
      );
    });

    test('openStoreListing throws error for empty app store id on iOS',
        () async {
      expect(
        () async => DerivStoreLauncher.openStoreListing(
          androidPackageName: 'android_package_name',
          iosUrlScheme: 'ios_url_scheme',
          iosAppStoreId: '',
        ),
        throwsA(isA<ArgumentError>()),
      );

      expect(
        () async => DerivStoreLauncher.openStoreListing(
          androidPackageName: 'android_package_name',
          iosUrlScheme: 'ios_url_scheme',
          iosAppStoreId: '',
        ),
        throwsA(isA<ArgumentError>()),
      );
    });
  });
}
