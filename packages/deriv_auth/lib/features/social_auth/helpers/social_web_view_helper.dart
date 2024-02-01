import 'dart:async';

import 'package:deriv_auth/core/services/token/models/enums.dart';
import 'package:deriv_auth/features/social_auth/models/social_auth_provider_model.dart';
import 'package:deriv_web_view/web_view.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deriv_api/helpers/miscellaneous_helper.dart';
import 'package:uni_links2/uni_links.dart';
import 'package:uuid/uuid.dart';

StreamSubscription<Uri?>? _uriLinkStream;

/// Handle One-All social auth. Will be removed in the future.
Future<void> handleOneAllSocialAuth({
  required SocialAuthProvider socialAuthProvider,
  required Function(Uri) uriHandler,
  required VoidCallback onClosed,
  required String redirectURL,
}) async {
  await _openBrowser(
    url: getSocialAuthUrl(socialAuthProvider),
    uriHandler: uriHandler,
    onClosed: onClosed,
    redirectURL: redirectURL,
  );

  _setupLinkStream(uriHandler);
}

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

/// Fetch connection token from One-All redirect uri.
String fetchConnectionToken({required Uri oneAllRedirectUri}) =>
    oneAllRedirectUri.queryParameters['connection_token'] ?? '';

/// Fetch social auth callback state from redirect uri.
Map<String, String> fetchCallbackState({required Uri redirectUri}) =>
    <String, String>{
      'code': redirectUri.queryParameters['code'].toString(),
      'callbackState': redirectUri.queryParameters['state'].toString()
    };

/// Gets `OneAll` Api url for social authentication.
String getSocialAuthUrl(SocialAuthProvider socialLoginType) {
  const String baseUrl =
      'https://deriv.api.oneall.com/socialize/connect/mobile/';
  const String callbackUrl = '&callback_uri=deriv://dp2p';

  final String uuid = const Uuid().v1();
  final String socialLoginTypeName = socialLoginType.name;

  return '$baseUrl$socialLoginTypeName/?nonce=$uuid$callbackUrl';
}
