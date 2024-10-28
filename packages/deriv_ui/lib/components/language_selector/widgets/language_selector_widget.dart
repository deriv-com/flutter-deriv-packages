import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// {@template language_selector_widget}
/// Acts as a button to choose language. Has locale flag and locale name.
/// {@endtemplate}
class LanguageSelectorWidget extends StatelessWidget {
  /// {@macro language_selector_widget}
  const LanguageSelectorWidget({
    required this.languageItem,
    required this.onPressed,
    this.package,
    this.showFlag = false,
    super.key,
  });

  /// [LanguageModel] to show as button.
  final LanguageModel languageItem;

  /// Callback function for on pressed.
  final VoidCallback onPressed;

  /// Name of the package where the flag image is located.
  final String? package;

  /// Conditionally display flag icon based on the value
  final bool showFlag;

  @override
  Widget build(BuildContext context) => TextButton(
        clipBehavior: Clip.antiAlias,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              ThemeProvider.margin04,
            ),
            side: BorderSide(
              color: context.theme.colors.active,
            ),
          ),
          padding: const EdgeInsets.all(ThemeProvider.margin08),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            showFlag || languageItem.flag.isEmpty
                ? SvgPicture.asset(
                    languageIcon,
                    semanticsLabel: languageItem.code.toUpperCase(),
                  )
                : Image(
                    image: AssetImage(
                      languageItem.flag,
                      package: package,
                    ),
                    width: ThemeProvider.margin24,
                    height: ThemeProvider.margin16,
                  ),
            const SizedBox(width: ThemeProvider.margin08),
            Text(
              languageItem.code.toUpperCase(),
              style: context.theme.textStyle(
                textStyle: TextStyles.subheading,
              ),
            ),
          ],
        ),
        onPressed: onPressed,
      );
}
