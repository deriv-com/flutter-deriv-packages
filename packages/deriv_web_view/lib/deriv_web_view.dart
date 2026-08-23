import 'dart:async';
import 'dart:developer' as dev;

import 'package:deriv_http_client/deriv_http_client.dart';
import 'package:deriv_web_view/helper.dart';
import 'package:deriv_web_view/widgets/in_app_browser/chrome_safari_browser.dart';
import 'package:deriv_web_view/widgets/in_app_browser/in_app_browser.dart';
import 'package:deriv_web_view/widgets/web_view_page/web_view_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher_string.dart';

/// A callback to resolve http client
typedef HttpClientPredicate = Future<BaseHttpClient> Function(String url);

/// Opens a url in a browser.
Future<void> openWebPage({
  required BuildContext context,
  required String url,
  required String userAgent,
  bool rootNavigator = false,
  LaunchMode launchMode = LaunchMode.externalApplication,
}) async {
  final bool isLaunchable = await canLaunchUrlString(url);

  if (isLaunchable) {
    await launchUrlString(url, mode: launchMode);
  } else {
    await Navigator.of(context, rootNavigator: rootNavigator).push(
      MaterialPageRoute<Widget>(
        builder: (BuildContext context) => WebViewPage(
          url: url,
          userAgent: userAgent,
        ),
      ),
    );
  }
}

final AppChromeSafariBrowser appSafariBrowser = AppChromeSafariBrowser();

/// Opens in-app tab activity webview.
Future<void> openInAppTabActivityWebView({
  required BuildContext context,
  required String url,
  required VoidCallback onClosed,
  String? title,
  bool extendBodyBehindAppBar = false,
  bool setEndpoint = false,
  bool rootNavigator = false,
  String? endpoint,
  String? appId,
}) async {
  try {
    await _openInAppTabView(url, onClosed);
  } on PlatformException catch (_) {
    await InAppBrowser().openUrlRequest(
      urlRequest: URLRequest(url: WebUri(url)),
    );
  }
}

/// Opens in-app tab activity web view.
/// Uses [AppChromeSafariBrowser] if available, otherwise uses [AppInAppBrowser]
/// which takes [uriHandler] to handle redirect uri.
Future<void> openInAppWebViewWithUriHandler({
  required String url,
  required String userAgent,
  required Function(Uri) uriHandler,
  required Function(String) onError,
  required VoidCallback onClosed,
  required List<String> redirectURLs,
}) async {
  try {
    await _openInAppTabView(url, onClosed);
  } on PlatformException catch (_) {
    final AppInAppBrowser browser = AppInAppBrowser(
      onUrlChanged: (Uri uri) => uriHandler(uri),
      onError: (String message) => onError(message),
      redirectURLs: redirectURLs,
    );

    await browser.openUrlRequest(
      urlRequest: URLRequest(url: WebUri(url)),
      settings: InAppBrowserClassSettings(
          webViewSettings: InAppWebViewSettings(
        userAgent: userAgent,
        clearCache: true,
      )),
    );
  }
}

bool get isInAppTabActivityWebViewOpen => appSafariBrowser.isOpened();

Future<void> closeInAppTabActivityWebView() => appSafariBrowser.close();

Future<void> _openInAppTabView(String url, VoidCallback onClosed) async {
  // Because relying on returned Future from browser `open` method is inconsistent
  // we went with using a callback and call in `onClosed` method of the browser.
  appSafariBrowser.onBrowserClosed = onClosed;

  return appSafariBrowser.open(
    url: WebUri(url),
    settings: ChromeSafariBrowserSettings(
      shareState: CustomTabsShareState.SHARE_STATE_OFF,
      dismissButtonStyle: DismissButtonStyle.CLOSE,
      presentationStyle: ModalPresentationStyle.OVER_FULL_SCREEN,
      transitionStyle: ModalTransitionStyle.CROSS_DISSOLVE,
    ),
  );
}

/// Opens in-app webview.
Future<void> openInAppWebView({
  required BuildContext context,
  required String url,
  required String userAgent,
  String? title,
  bool extendBodyBehindAppBar = false,
  bool setEndpoint = false,
  bool rootNavigator = false,
  String? endpoint,
  String? appId,
  VoidCallback? onClosed,
}) async =>
    Navigator.of(context, rootNavigator: rootNavigator).push(
      MaterialPageRoute<Widget>(
        builder: (BuildContext context) => WebViewPage(
          userAgent: userAgent,
          url: url,
          title: title,
          extendBodyBehindAppBar: extendBodyBehindAppBar,
          setEndpoint: setEndpoint,
          endpoint: endpoint,
          appId: appId,
          onClosed: onClosed,
        ),
      ),
    );

/// Opens deriv app  page with authentication.
Future<void> openLoggedInWebPage({
  required BuildContext context,
  required String redirectPath,
  required String endpoint,
  required String appId,
  required String? refreshToken,
  required String? defaultAccount,
  required void Function(BuildContext context) loadingDialog,
  required Future<void> Function(BuildContext context) tokenExpiredDialog,
  required bool rootNavigator,
  required String appToken,
  required String userAgent,
  required String platform,
  String? languageCode,
  HttpClientPredicate? getHttpClient,
  String destinationAppId = '16929',
  String? action,
  String? code,
  String title = '',
  bool validateCredentialsOnClosed = false,
  VoidCallback? onClosed,
  bool inAppBrowser = true,
}) async {
  final String? oneTimeToken = await _validateCredentials(
    context: context,
    redirectPath: redirectPath,
    endpoint: endpoint,
    appId: appId,
    destinationAppId: destinationAppId,
    refreshToken: refreshToken,
    defaultAccount: defaultAccount,
    loadingDialog: loadingDialog,
    tokenExpiredDialog: tokenExpiredDialog,
    rootNavigator: rootNavigator,
    appToken: appToken,
    getHttpClient: getHttpClient,
    action: action,
    code: code,
    platform: platform,
    languageCode: languageCode
  );

  if (oneTimeToken == null) {
    return;
  }

  final String ptaLoginUrl =
    '${getPtaLoginUrl(host: endpoint, token: oneTimeToken)}?lang=$languageCode';

  if (inAppBrowser) {
    await openInAppTabActivityWebView(
      context: context,
      url: ptaLoginUrl,
      title: title,
      setEndpoint: true,
      rootNavigator: rootNavigator,
      endpoint: endpoint,
      appId: appId,
      onClosed: () {
        // We're doing validate credentials only on opening inside InAppTabActivity.
        // the other option we have is in external browser which we can't know
        // when it's closed. because user can comeback to the app even without
        // closing the browser.
        if (validateCredentialsOnClosed) {
          _validateCredentials(
            context: context,
            redirectPath: redirectPath,
            endpoint: endpoint,
            appId: appId,
            destinationAppId: destinationAppId,
            refreshToken: refreshToken,
            defaultAccount: defaultAccount,
            loadingDialog: loadingDialog,
            tokenExpiredDialog: tokenExpiredDialog,
            rootNavigator: rootNavigator,
            appToken: appToken,
            getHttpClient: getHttpClient,
            action: action,
            code: code,
            platform: platform,
            languageCode: languageCode,
          );
        }

        onClosed?.call();
      },
    );
  } else {
    await openWebPage(
      context: context,
      url: ptaLoginUrl,
      rootNavigator: rootNavigator,
      userAgent: userAgent,
    );
  }
}

// Getting one-time token from the server needs to be done and it takes some time,
// so we need to show a loading screen while we wait for the code.
Future<String?> _fetchOneTimeToken({
  required BuildContext context,
  required String redirectPath,
  required String endpoint,
  required String appId,
  required String destinationAppId,
  required String? refreshToken,
  required String? defaultAccount,
  required void Function(BuildContext context) loadingDialog,
  required bool rootNavigator,
  required String appToken,
  required String platform,
  HttpClientPredicate? getHttpClient,
  String? action,
  String? code,
  String? languageCode,
}) async {
  loadingDialog(context);

  final String? oneTimeToken = await _getOneTimeToken(
    redirectPath: redirectPath,
    appId: appId,
    destinationAppId: destinationAppId,
    endpoint: endpoint,
    refreshToken: refreshToken,
    defaultAccount: defaultAccount,
    appToken: appToken,
    action: action,
    code: code,
    getHttpClient: getHttpClient,
    platform: platform,
    languageCode: languageCode,
  );

  Navigator.of(context, rootNavigator: rootNavigator).pop();

  return oneTimeToken;
}

/// Gets one-time token for pass-through authentication.
Future<String?> _getOneTimeToken({
  required String redirectPath,
  required String endpoint,
  required String appId,
  required String destinationAppId,
  required String? refreshToken,
  required String? defaultAccount,
  required String appToken,
  required String platform,
  HttpClientPredicate? getHttpClient,
  String? action,
  String? code,
  String? languageCode,
}) async {
  try {
    final String? token = await performPassThroughAuthentication(
      redirectPath: redirectPath,
      destinationAppId: destinationAppId,
      endpoint: endpoint,
      appId: appId,
      refreshToken: refreshToken,
      defaultAccount: defaultAccount,
      appToken: appToken,
      action: action,
      code: code,
      getHttpClient: getHttpClient,
      platform: platform,
      languageCode: languageCode,
    );

    return token;
  } on Exception catch (e) {
    dev.log('Navigation Helper getOneTimeToken() error: $e');

    return null;
  }
}

Future<String?> _validateCredentials({
  required BuildContext context,
  required String redirectPath,
  required String endpoint,
  required String appId,
  required String destinationAppId,
  required String? refreshToken,
  required String platform,
  required String? defaultAccount,
  required void Function(BuildContext context) loadingDialog,
  required Future<void> Function(BuildContext context) tokenExpiredDialog,
  required bool rootNavigator,
  required String appToken,
  HttpClientPredicate? getHttpClient,
  String? action,
  String? code,
  String? languageCode,
}) async {
  final String? oneTimeToken = await _fetchOneTimeToken(
    context: context,
    redirectPath: redirectPath,
    appId: appId,
    destinationAppId: destinationAppId,
    endpoint: endpoint,
    refreshToken: refreshToken,
    defaultAccount: defaultAccount,
    loadingDialog: loadingDialog,
    rootNavigator: rootNavigator,
    appToken: appToken,
    getHttpClient: getHttpClient,
    action: action,
    code: code,
    platform: platform,
    languageCode: languageCode,
  );

  if (oneTimeToken == null) {
    await tokenExpiredDialog(context);
  }

  return oneTimeToken;
}
