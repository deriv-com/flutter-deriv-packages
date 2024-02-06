import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_web_view/deriv_web_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// A widget for clickable texts.
///
/// - [openInAppWebview] Whether to open the [url] in in-app webview or external browser.
TextSpan buildTextSpanHyperlink({
  required BuildContext context,
  required String label,
  required String userAgent,
  String? url,
  VoidCallback? onTap,
  bool openInAppWebview = true,
  TextStyle? style,
}) =>
    TextSpan(
      text: label,
      style: style ??
          context.theme.textStyle(
            textStyle: TextStyles.body1,
            color: context.theme.colors.coral,
          ),
      recognizer: TapGestureRecognizer()
        ..onTap = () => onTap == null
            ? openInAppWebview
                ? openInAppWebView(
                    context: context,
                    url: url!,
                    userAgent: userAgent,
                  )
                : openWebPage(
                    context: context,
                    url: url!,
                    userAgent: userAgent,
                  )
            : onTap(),
    );
