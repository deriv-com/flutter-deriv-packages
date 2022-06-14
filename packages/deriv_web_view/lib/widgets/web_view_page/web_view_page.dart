import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';

import 'states/web_view_page_cubit.dart';

/// Web view widget to launch urls in an in-app web page.
class WebViewPage extends StatefulWidget {
  /// Starts an in-app web view to launch a [url].
  const WebViewPage({
    Key? key,
    this.url,
    this.title,
    this.showProgressIndicator = true,
    this.extendBodyBehindAppBar = false,
    this.setEndpoint = false,
    this.endpoint,
    this.appId,
    this.onClosed,
  }) : super(key: key);

  /// Web view route name.
  static const String routeName = 'web_view_page';

  /// The url to be launched.
  final String? url;

  /// Label for title in App Bar.
  final String? title;

  /// If `true`, show a progress indicator while the web view is loading. Default to `true`.
  final bool showProgressIndicator;

  /// If true, and an [appBar] is specified, then the height of the [body] is
  /// extended to include the height of the app bar and the top of the body
  /// is aligned with the top of the app bar.
  final bool extendBodyBehindAppBar;

  /// if `true`, setup endpoint for the the web view. Default to `false`.
  final bool setEndpoint;

  /// The endpoint to be set.
  final String? endpoint;

  /// The app id to be set.
  final String? appId;

  /// Callback when web view is closed.
  final Function? onClosed;

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  WebViewController? _webViewController;
  final WebViewPageCubit _webViewPageCubit = WebViewPageCubit();

  @override
  void initState() {
    super.initState();

    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: Platform.isIOS,
          backgroundColor: const Color(0xFF151717),
          title: Text(widget.title ?? ''),
          bottom:
              widget.showProgressIndicator ? _buildAppBarProgressBar() : null,
        ),
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: widget.extendBodyBehindAppBar,
        body: FutureBuilder<String?>(
          future: getUserAgent(),
          builder: (BuildContext context, AsyncSnapshot<String?> snapshot) =>
              snapshot.connectionState == ConnectionState.done
                  ? WillPopScope(
                      onWillPop: _onWillPop,
                      child: WebView(
                        initialUrl: widget.url,
                        userAgent: snapshot.data,
                        javascriptMode: JavascriptMode.unrestricted,
                        onWebViewCreated:
                            (WebViewController webViewController) =>
                                _webViewController = webViewController,
                        onPageStarted: (_) => _onPageStarted(),
                        onProgress: _onProgress,
                      ),
                    )
                  : const SizedBox(),
        ),
      );

  PreferredSize _buildAppBarProgressBar() => PreferredSize(
        preferredSize: const Size(double.infinity, 1),
        child: BlocBuilder<WebViewPageCubit, WebViewPageState>(
          bloc: _webViewPageCubit,
          builder: (BuildContext context, WebViewPageState state) =>
              LinearProgressIndicator(
            value: state.progress,
            backgroundColor: Colors.transparent,
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFCC2E3D)),
          ),
        ),
      );

  Future<bool> _onWillPop() async {
    await _webViewController?.clearCache();
    await CookieManager().clearCookies();

    widget.onClosed?.call();

    return true;
  }

  void _onPageStarted() {
    if (widget.setEndpoint) {
      _setUpEndpoint();
    }
  }

  void _onProgress(int progress) {
    if (widget.showProgressIndicator) {
      _webViewPageCubit.updateProgressState(progress / 100);

      if (progress == 100) {
        _webViewPageCubit.updateProgressState(0);
      }
    }
  }

  void _setUpEndpoint() => _webViewController?.evaluateJavascript(
        '''
          (() => {
            try {
              window.localStorage.setItem(
                "config.server_url",
                "${widget.endpoint}"
              );

              window.localStorage.setItem(
                "config.app_id",
                "${widget.appId}"
              );
            } catch (e) {}
          })();
        ''',
      );
}
