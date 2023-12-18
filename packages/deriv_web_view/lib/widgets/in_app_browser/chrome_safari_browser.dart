import 'dart:developer' as logger;

import 'package:flutter/foundation.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

/// This class uses native Chrome Custom Tabs on Android SFSafariViewController on iOS.
class AppChromeSafariBrowser extends ChromeSafariBrowser {
  /// Returns the singleton instance of [AppChromeSafariBrowser].
  factory AppChromeSafariBrowser() {
    return _instance ??= AppChromeSafariBrowser._();
  }

  AppChromeSafariBrowser._();

  static AppChromeSafariBrowser? _instance;

  /// Is called when the browser is closed.
  VoidCallback? onBrowserClosed;

  @override
  void onOpened() => logger.log('ChromeSafari browser opened.');

  @override
  void onCompletedInitialLoad() =>
      logger.log('ChromeSafari browser initial load completed.');

  @override
  void onClosed() {
    onBrowserClosed?.call();

    super.onClosed();
  }
}
