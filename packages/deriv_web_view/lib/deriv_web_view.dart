import 'dart:async';
import 'dart:developer' as dev;

import 'package:deriv_web_view/widgets/in_app_browser/chrome_safari_browser.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'package:deriv_web_view/helper.dart';
import 'package:deriv_web_view/widgets/web_view_page/web_view_page.dart';

/// Opens a url in a browser.
Future<void> openWebPage({
  required BuildContext context,
  required String url,
  bool rootNavigator = false,
  LaunchMode launchMode = LaunchMode.externalApplication,
}) async {
  final bool? isLaunchable = await canLaunchUrlString(url);

  if (isLaunchable ?? false) {
    await launchUrlString(url, mode: launchMode);
  } else {
    await Navigator.of(context, rootNavigator: rootNavigator).push(
      MaterialPageRoute<Widget>(
        builder: (BuildContext context) => WebViewPage(url: url),
      ),
    );
  }
}

final AppChromeSafariBrowser appSafariBrowser = AppChromeSafariBrowser();

/// Opens in-app tab activity webview.
Future<void> openInAppTabActivityWebView({
  required BuildContext context,
  required String url,
  String? title,
  bool extendBodyBehindAppBar = false,
  bool setEndpoint = false,
  bool rootNavigator = false,
  String? endpoint,
  String? appId,
  VoidCallback? onClosed,
}) async {
  try {
    await _openInAppTabView(url);
  } on PlatformException catch (_) {
    await InAppBrowser().openUrlRequest(
      urlRequest: URLRequest(url: Uri.parse(url)),
    );
  }
}

bool get isInAppTabActivityWebViewOpen => appSafariBrowser.isOpened();

Future<void> closeInAppTabActivityWebView() => appSafariBrowser.close();

Future<void> _openInAppTabView(String url) async => appSafariBrowser.open(
      url: Uri.parse(url),
      options: ChromeSafariBrowserClassOptions(
        android: AndroidChromeCustomTabsOptions(
          shareState: CustomTabsShareState.SHARE_STATE_OFF,
        ),
        ios: IOSSafariOptions(
          dismissButtonStyle: IOSSafariDismissButtonStyle.CLOSE,
          presentationStyle: IOSUIModalPresentationStyle.OVER_FULL_SCREEN,
          transitionStyle: IOSUIModalTransitionStyle.CROSS_DISSOLVE,
        ),
      ),
    );

/// Opens in-app webview.
Future<void> openInAppWebView({
  required BuildContext context,
  required String url,
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
    action: action,
    code: code,
  );

  if (oneTimeToken == null) {
    return;
  }

  final String ptaLoginUrl =
      getPtaLoginUrl(host: endpoint, token: oneTimeToken);

  if (inAppBrowser) {
    // TODO(Ramin): we put this here temporarily because validate credentials
    //  should be done after closing the web page but when it's opening inside
    //  web browser or in-app tab activity the await on opening is not working.
    // until we find-out how to call validate after the web page on those 2
    // cases we open those that their validate is true inside in-app WebView.
    if (validateCredentialsOnClosed) {
      await openInAppWebView(
        context: context,
        url: ptaLoginUrl,
        title: title,
        setEndpoint: true,
        rootNavigator: rootNavigator,
        endpoint: endpoint,
        appId: appId,
        onClosed: onClosed,
      );
    } else {
      await openInAppTabActivityWebView(
        context: context,
        url: ptaLoginUrl,
        title: title,
        setEndpoint: true,
        rootNavigator: rootNavigator,
        endpoint: endpoint,
        appId: appId,
        onClosed: onClosed,
      );
    }
  } else {
    await openWebPage(
      context: context,
      url: ptaLoginUrl,
      rootNavigator: rootNavigator,
    );
  }

  if (validateCredentialsOnClosed) {
    await _validateCredentials(
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
      action: action,
      code: code,
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
  String? action,
  String? code,
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
  String? action,
  String? code,
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
  required String? defaultAccount,
  required void Function(BuildContext context) loadingDialog,
  required Future<void> Function(BuildContext context) tokenExpiredDialog,
  required bool rootNavigator,
  required String appToken,
  String? action,
  String? code,
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
    action: action,
    code: code,
  );

  if (oneTimeToken == null) {
    await tokenExpiredDialog(context);
  }

  return oneTimeToken;
}
