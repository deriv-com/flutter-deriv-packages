import 'dart:async';
import 'package:flutter/services.dart';
import 'package:deriv_store_launcher/platform_checker.dart';

/// A plugin to launch apps and their respective store listings on Android and
/// iOS.
class DerivStoreLauncher {
  static const MethodChannel _channel = MethodChannel('deriv_store_launcher');

  /// PlatformChecker instance
  static PlatformChecker platformChecker = PlatformChecker();

  /// Opens the app's store listing on the appropriate platform.
  ///
  /// [androidPackageName] is the package name for Android
  /// (e.g., com.example.app).
  /// [iosAppStoreId] is the App Store ID for iOS (e.g., 123456789).
  /// [iosUrlScheme] is the custom URL scheme for iOS (e.g., myapp://).
  /// It's used to check if the app is installed.
  static Future<void> openStoreListing({
    required String androidPackageName,
    required String iosAppStoreId,
    required String iosUrlScheme,
  }) async {
    final String packageName =
        platformChecker.isIOS ? iosUrlScheme : androidPackageName;
    _validatePackageName(packageName);

    if (platformChecker.isIOS) {
      _validateAppStoreId(iosAppStoreId);
    }

    await _channel.invokeMethod<void>('openStore', <String, String>{
      'package_name': packageName,
      'ios_app_store_id': iosAppStoreId,
    });
  }

  /// Checks if the app is installed on the device.
  ///
  /// Provides the package name for Android ([androidPackageName]) or the URL
  /// scheme for iOS ([iosUrlScheme]).
  static Future<bool> isAppInstalled({
    required String androidPackageName,
    required String iosUrlScheme,
  }) async {
    final String packageName =
        platformChecker.isIOS ? iosUrlScheme : androidPackageName;
    _validatePackageName(packageName);

    final bool isInstalled = await _channel.invokeMethod<bool>(
          'isAppInstalled',
          <String, String>{'package_name': packageName},
        ) ??
        false;

    return isInstalled;
  }

  /// Opens the app if installed, otherwise opens the app store listing if
  /// [openStore] is true.
  ///
  /// [androidPackageName] is the package name for Android.
  /// [iosUrlScheme] is the URL scheme for iOS.
  /// [iosAppStoreId] is the App Store ID for iOS (required if [openStore] is
  /// true on iOS).
  /// [openStore] determines whether to open the store listing if the app isn't
  /// installed.
  static Future<bool> openApp({
    required String androidPackageName,
    required String iosUrlScheme,
    required String iosAppStoreId, // Required for iOS if openStore is true
    bool openStore = false,
  }) async {
    final String packageName =
        platformChecker.isIOS ? iosUrlScheme : androidPackageName;
    _validatePackageName(packageName);

    if (platformChecker.isIOS && openStore) {
      _validateAppStoreId(
          iosAppStoreId); // Only validate if openStore is true and it's iOS
    }

    final bool isOpened =
        await _channel.invokeMethod<bool>('openApp', <String, String>{
              'package_name': packageName,
              'ios_app_store_id': iosAppStoreId,
              'open_store': openStore.toString(),
            }) ??
            false;

    return isOpened;
  }

  static void _validatePackageName(String packageName) {
    if (packageName.isEmpty) {
      throw ArgumentError('The package name/URL scheme cannot be empty.');
    }
  }

  static void _validateAppStoreId(String iosAppStoreId) {
    if (iosAppStoreId.isEmpty) {
      throw ArgumentError('The iosAppStoreId cannot be empty.');
    }
  }
}
