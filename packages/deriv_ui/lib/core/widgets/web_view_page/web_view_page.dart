import 'dart:io';

import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
    this.backgroundColor,
    this.heightProgressBar = 1,
    this.valueColorProgressBar = Colors.redAccent,
  }) : super(key: key);

  /// Web view route name.
  static const String routeName = 'web_view_page';

  /// The url to be launched.
  final String? url;

  /// Label for title in App Bar.
  final String? title;

  /// If `true`, show a progress indicator while the web view is loading.
  /// Default to `true`.
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

  /// Background color of web view.
  final Color? backgroundColor;

  /// ProgressBar Height in web view.
  final double heightProgressBar;

  /// ProgressBar value color in web view.
  final Color valueColorProgressBar;

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  WebViewController? _webViewController;
  double progressValue = 0;

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
          backgroundColor: widget.backgroundColor,
          title: Text(widget.title ?? ''),
          bottom: widget.showProgressIndicator
              ? _buildAppBarProgressBar(
                  valueColor: widget.valueColorProgressBar,
                  height: widget.heightProgressBar)
              : null,
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
                  : const SizedBox.shrink(),
        ),
      );

  PreferredSize _buildAppBarProgressBar({
    required Color valueColor,
    double height = 1,
  }) =>
      PreferredSize(
        preferredSize: Size(double.infinity, height),
        child: LinearProgressIndicator(
          value: progressValue,
          backgroundColor: Colors.transparent,
          valueColor: AlwaysStoppedAnimation<Color>(valueColor),
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
      progressValue = progress / 100;

      if (progress == 100) {
        progressValue = 0;
      }

      setState(() {});
    }
  }

  void _setUpEndpoint() => _webViewController?.runJavascript(
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

  /// Generates device specific user agent.
  Future<String> getUserAgent() async {
    String userAgent = '';

    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      final AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

      userAgent =
          'Mozilla/5.0 (Linux; U; Android ${androidInfo.version.release}; ${androidInfo.model} '
          'Build/${androidInfo.id}) '
          '${packageInfo.appName}/${packageInfo.version}+${packageInfo.buildNumber}';
    } else if (Platform.isIOS) {
      final IosDeviceInfo iosInfo = await deviceInfo.iosInfo;

      userAgent = 'Mozilla/5.0 (${iosInfo.utsname.machine} '
          '${iosInfo.systemName}/${iosInfo.systemVersion} '
          'Darwin/${iosInfo.utsname.release}) '
          '${packageInfo.appName}/${packageInfo.version}+${packageInfo.buildNumber}';
    }

    return userAgent;
  }
}
