import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_web_view/web_view.dart';
import 'package:flutter_deriv_api/helpers/miscellaneous_helper.dart';

/// Service to handle social auth web view.
final class SocialAuthWebViewService implements BaseSocialWebViewService {
  StreamSubscription<Uri?>? _uriLinkStream;

  /// Handle in-house social auth.
  @override
  Future<void> handleSocialAuth({
    required SocialAuthProviderModel socialAuthProviderModel,
    required SocialAuthUriHandler socialAuthUriHandler,
    required String redirectURL,
    required Function(String) onError,
  }) async {
    await openInAppWebViewWithUriHandler(
        url: socialAuthProviderModel.authUrl,
        userAgent: await getUserAgent(),
        uriHandler: (Uri uri) {
          socialAuthUriHandler(
            code: uri.queryParameters['code'].toString(),
            state: uri.queryParameters['state'].toString(),
          );
        },
        onError: onError,
        onClosed: () {
          _uriLinkStream?.cancel();
        },
        redirectURLs: <String>[redirectURL]);

    _setupLinkStream(socialAuthUriHandler);
  }

  void _setupLinkStream(SocialAuthUriHandler uriHandler) {
    _uriLinkStream = AppLinks().uriLinkStream.listen(
      (Uri? uri) {
        _uriLinkStream?.cancel();

        if (uri != null) {
          closeInAppTabActivityWebView();

          uriHandler(
            code: uri.queryParameters['code'].toString(),
            state: uri.queryParameters['state'].toString(),
          );
        }
      },
      onError: (dynamic error) async => closeInAppTabActivityWebView(),
    );
  }
}
