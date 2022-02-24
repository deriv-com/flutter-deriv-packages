import 'dart:async';
import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter_deriv_api/state/connection/connection_cubit.dart';

import 'package:flutter_multipliers/core/helpers/helpers.dart';
import 'package:flutter_multipliers/core/helpers/popup_dialogs_helper.dart';
import 'package:flutter_multipliers/core/presentation/widgets/web_view_page/web_view_page.dart';
import 'package:flutter_multipliers/core/states/auth/auth_cubit.dart';

/// Opens a url in a browser.
Future<void> openWebPage({
  required BuildContext context,
  required String url,
}) async {
  final bool? isLaunchable = await canLaunch(url);

  if (isLaunchable ?? false) {
    await launch(url);
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
}) async {
  await Navigator.push(
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
}

/// Opens deriv app  page with authentication.
Future<void> openLoggedInWebPage({
  required BuildContext context,
  required String redirectPath,
  String? action,
  String? code,
  String title = '',
  bool validateCredentialsOnClosed = false,
  VoidCallback? onClosed,
}) async {
  final String? oneTimeToken = await _validateCredentials(
    context: context,
    redirectPath: redirectPath,
    action: action,
    code: code,
  );

  if (oneTimeToken == null) {
    return;
  }

  await openInAppWebView(
    context: context,
    url: getPtaLoginUrl(host: ConnectionCubit.endpoint, token: oneTimeToken),
    title: title,
    setEndpoint: true,
    endpoint: ConnectionCubit.endpoint,
    appId: ConnectionCubit.appId,
    onClosed: onClosed,
  );

  if (validateCredentialsOnClosed) {
    await _validateCredentials(
      context: context,
      redirectPath: redirectPath,
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
  String? action,
  String? code,
}) async {
  unawaited(showSimpleLoadingDialog(context));

  final String? oneTimeToken = await _getOneTimeToken(
    redirectPath: redirectPath,
    action: action,
    code: code,
  );

  Navigator.pop(context);

  return oneTimeToken;
}

/// Gets one-time token for pass-through authentication.
Future<String?> _getOneTimeToken({
  required String redirectPath,
  String? action,
  String? code,
}) async {
  try {
    final String? token = await AuthCubit.performPassThroughAuthentication(
      redirectPath: redirectPath,
      destinationAppId: '16929',
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
  String? action,
  String? code,
}) async {
  final String? oneTimeToken = await _fetchOneTimeToken(
    context: context,
    redirectPath: redirectPath,
    action: action,
    code: code,
  );

  if (oneTimeToken == null) {
    await showTokenExpiredDialog(context);
  }

  return oneTimeToken;
}
