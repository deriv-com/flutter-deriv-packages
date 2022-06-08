import 'dart:async';
import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'package:deriv_web_view/helper.dart';
import 'package:deriv_web_view/widgets/web_view_page/web_view_page.dart';

/// Opens a url in a browser.
Future<void> openWebPage({
  required BuildContext context,
  required String url,
  LaunchMode launchMode = LaunchMode.externalApplication,
}) async {
  final bool? isLaunchable = await canLaunchUrlString(url);

  if (isLaunchable ?? false) {
    await launchUrlString(url, mode: launchMode);
  } else {
    await Navigator.push(
      context,
      MaterialPageRoute<Widget>(
        builder: (BuildContext context) => WebViewPage(url: url),
      ),
    );
  }
}

/// Opens in-app webview.
Future<void> openInAppWebView({
  required BuildContext context,
  required String url,
  String? title,
  bool extendBodyBehindAppBar = false,
  bool setEndpoint = false,
  String? endpoint,
  String? appId,
  VoidCallback? onClosed,
}) async =>
    Navigator.push(
      context,
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
  required String destinationAppId,
  required String? refreshToken,
  required String? defaultAccount,
  required void Function(BuildContext context) loadingDialog,
  required Future<void> Function(BuildContext context) tokenExpiredDialog,
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
    action: action,
    code: code,
  );

  if (oneTimeToken == null) {
    return;
  }

  final String ptaLoginUrl =
      getPtaLoginUrl(host: endpoint, token: oneTimeToken);

  if (inAppBrowser) {
    await openInAppWebView(
      context: context,
      url: ptaLoginUrl,
      title: title,
      setEndpoint: true,
      endpoint: endpoint,
      appId: appId,
      onClosed: onClosed,
    );
  } else {
    await openWebPage(context: context, url: ptaLoginUrl);
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
    action: action,
    code: code,
  );

  Navigator.pop(context);

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
    action: action,
    code: code,
  );

  if (oneTimeToken == null) {
    await tokenExpiredDialog(context);
  }

  return oneTimeToken;
}
