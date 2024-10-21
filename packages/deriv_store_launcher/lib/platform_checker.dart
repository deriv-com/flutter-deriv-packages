import 'dart:io';

/// A class to check the platform the app is running on.
class PlatformChecker {
  /// Returns true if the platform is iOS.
  bool get isIOS => Platform.isIOS;

  /// Returns true if the platform is Android.
  bool get isAndroid => Platform.isAndroid;
}
