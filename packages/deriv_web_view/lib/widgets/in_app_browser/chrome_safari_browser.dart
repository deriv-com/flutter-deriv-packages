import 'dart:async';
import 'dart:developer' as logger;

import 'package:flutter_inappwebview/flutter_inappwebview.dart';

/// This class uses native Chrome Custom Tabs on Android SFSafariViewController on iOS.
class AppChromeSafariBrowser extends ChromeSafariBrowser {
  Completer<void>? _onClosingCompleter;

  @override
  Future<void> open({
    required Uri url,
    ChromeSafariBrowserClassOptions? options,
  }) {
    // We're using a Completer to be able to do await on the open method.
    // The Completer gets completed in onClose method.
    _onClosingCompleter = Completer<void>();
    super.open(url: url, options: options);
    return _onClosingCompleter!.future;
  }

  @override
  void onOpened() => logger.log('ChromeSafari browser opened.');

  @override
  void onCompletedInitialLoad() =>
      logger.log('ChromeSafari browser initial load completed.');

  @override
  void onClosed() {
    _onClosingCompleter?.complete();

    super.onClosed();
  }
}
