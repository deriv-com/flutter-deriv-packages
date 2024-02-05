import 'dart:async';

import 'package:deriv_auth/features/social_auth/models/social_auth_provider_model.dart';
import 'package:deriv_web_view/web_view.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deriv_api/helpers/miscellaneous_helper.dart';
import 'package:uni_links2/uni_links.dart';

StreamSubscription<Uri?>? _uriLinkStream;

/// Handle in-house social auth.
Future<void> handleSocialAuth({
  required SocialAuthProviderModel socialAuthProviderModel,
  required Function(Uri) socialAuthUriHandler,
  required VoidCallback onClosed,
  required String redirectURL,
}) async {
  await _openBrowser(
    url: socialAuthProviderModel.authUrl,
    uriHandler: socialAuthUriHandler,
    onClosed: onClosed,
    redirectURL: redirectURL,
  );

  _setupLinkStream(socialAuthUriHandler);
}

Future<void> _openBrowser({
  required String url,
  required Function(Uri) uriHandler,
  required VoidCallback onClosed,
  required String redirectURL,
}) async {
  await openInAppWebViewWithUriHandler(
      url: url,
      userAgent: await getUserAgent(),
      uriHandler: uriHandler,
      onError: (String message) => FirebaseCrashlytics.instance.log(message),
      onClosed: () {
        onClosed();
        _uriLinkStream?.cancel();
      },
      redirectURLs: <String>[redirectURL]);
}

void _setupLinkStream(Function(Uri) uriHandler) {
  _uriLinkStream = uriLinkStream.listen(
    (Uri? uri) {
      _uriLinkStream?.cancel();

      if (uri != null) {
        closeInAppTabActivityWebView();

        uriHandler(uri);
      }
    },
    onError: (dynamic error) async => closeInAppTabActivityWebView(),
  );
}

/// Fetch social auth callback state from redirect uri.
Map<String, String> fetchCallbackState({required Uri redirectUri}) =>
    <String, String>{
      'code': redirectUri.queryParameters['code'].toString(),
      'callbackState': redirectUri.queryParameters['state'].toString()
    };
