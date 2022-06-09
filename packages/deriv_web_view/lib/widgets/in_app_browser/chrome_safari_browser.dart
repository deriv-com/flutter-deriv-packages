import 'dart:developer' as logger;

import 'package:flutter_inappwebview/flutter_inappwebview.dart';

/// This class uses native Chrome Custom Tabs on Android SFSafariViewController on iOS.
class AppChromeSafariBrowser extends ChromeSafariBrowser {
  @override
  void onOpened() => logger.log('ChromeSafari browser opened.');

  @override
  void onCompletedInitialLoad() =>
      logger.log('ChromeSafari browser initial load completed.');

  @override
  void onClosed() => logger.log('ChromeSafari browser closed.');
}
