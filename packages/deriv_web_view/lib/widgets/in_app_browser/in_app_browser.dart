import 'dart:developer' as logger;

import 'package:flutter_inappwebview/flutter_inappwebview.dart';

/// The browser that is used to launch deriv's login web page
class AppInAppBrowser extends InAppBrowser {
  /// It takes the following requires parameters
  /// [onUrlChanged] function that is called when the url passed has changed,
  /// for a redirect link in this case.
  /// [onAccountsFetched] function which is called when accounts are fetched.
  AppInAppBrowser({
    required this.onUrlChanged,
    required this.onError,
    required this.redirectURLs,
  });

  /// A Function callback to url change.
  void Function(Uri) onUrlChanged;

  /// A Function callback to error.
  void Function(String) onError;

  /// List of redirect urls.
  List<String> redirectURLs;

  @override
  void onBrowserCreated() => logger.log('\n\nBrowser Created!\n\n');

  @override
  void onLoadStart(Uri? url) {
    logger.log('\n\nStarted\n\n');

    for (final String redirectURL in redirectURLs) {
      if (url.toString().startsWith(redirectURL)) {
        close();
        onUrlChanged(url!);
      }
    }
  }

  @override
  void onLoadStop(Uri? url) => logger.log('\n\nStopped\n\n');

  @override
  void onLoadError(Uri? url, int code, String message) {
    onError(message);

    logger.log('Can\'t load the url: $message');
  }

  @override
  void onProgressChanged(int progress) => logger.log('Progress: $progress');

  @override
  void onExit() => logger.log('\n\nBrowser closed!\n\n');

  @override
  Future<NavigationActionPolicy> shouldOverrideUrlLoading(
    NavigationAction navigationAction,
  ) async =>
      NavigationActionPolicy.ALLOW;

  @override
  void onLoadResource(LoadedResource resource) =>
      logger.log('ms -> duration: ${resource.duration}');

  @override
  void onConsoleMessage(ConsoleMessage consoleMessage) =>
      logger.log('message: ${consoleMessage.message}');
}
