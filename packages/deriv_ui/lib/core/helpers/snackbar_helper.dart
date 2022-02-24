import 'package:flutter/material.dart';
import 'package:flutter_deriv_theme/text_styles.dart';
import 'package:flutter_deriv_theme/theme_provider.dart';
import 'package:flutter_multipliers/core/extensions/context_extension.dart';

/// Shows a [SnackBar] that matches the DerivGo design.
void showSnackBar(BuildContext context, String message) {
  // If there is still a [SnackBar] on the screen, hide it first then show the
  // new one.
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: context.theme.base05Color,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(ThemeProvider.borderRadius04),
    ),
    duration: const Duration(seconds: 2),
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.all(ThemeProvider.margin08),
    content: Text(
      message,
      style: context.theme.textStyle(
        textStyle: TextStyles.body2,
        color: context.theme.base01Color,
      ),
    ),
  ));
}
