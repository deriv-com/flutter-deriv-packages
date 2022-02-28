import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// A widget for clickable texts.
TextSpan buildTextSpanHyperlink({
  required BuildContext context,
  required String label,
  required String url,
  required Function(BuildContext, String) openWebPage,
  TextStyle? style,
}) =>
    TextSpan(
      text: label,
      style: style,
      recognizer: TapGestureRecognizer()
        ..onTap = () => openWebPage(context, url),
    );
