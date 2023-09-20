import 'package:deriv_auth_ui/src/core/extensions/context_extension.dart';
import 'package:deriv_auth_ui/src/core/helpers/assets.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:deriv_ui/models/custom_icon_data_model.dart';
import 'package:flutter/material.dart';

/// A page to display not available country message with an icon.
class DerivUnavailableCountryLayout extends StatelessWidget {
  /// This page is shown to users from countries that are not supported.
  const DerivUnavailableCountryLayout({
    required this.onLiveChatPressed,
    required this.appName,
    Key? key,
  }) : super(key: key);

  /// Callback to be called when live chat button is pressed.
  final VoidCallback onLiveChatPressed;

  /// Client app name.
  final String appName;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          elevation: ThemeProvider.zeroMargin,
          title: Text(context.localization.labelNotAvailable),
        ),
        body: Container(
          padding:
              const EdgeInsets.symmetric(horizontal: ThemeProvider.margin16),
          color: context.theme.colors.primary,
          child: FullscreenMessage(
            titleWidget: _buildFullscreenTitle(context),
            iconData: CustomIconData(
              icon: Assets.unsupportedCountry,
              width: ThemeProvider.iconSize96,
              height: ThemeProvider.iconSize96,
            ),
          ),
        ),
      );

  Widget _buildFullscreenTitle(BuildContext context) => Column(
        children: <Widget>[
          const SizedBox(height: ThemeProvider.margin16),
          Text(
            context.localization.warnNotAvailableCountriesTitle(appName),
            style: TextStyles.title,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: ThemeProvider.margin08),
          RichText(
            text: TextSpan(
              text: context.localization.warnNotAvailableCountries,
              style: context.theme.textStyle(
                textStyle: TextStyles.body1,
                color: context.theme.colors.general,
              ),
              children: <InlineSpan>[
                buildTextSpanHyperlink(
                  context: context,
                  label: context.localization.labelLiveChat,
                  onTap: onLiveChatPressed,
                  style: context.theme.textStyle(
                    textStyle: TextStyles.body1Bold,
                    color: context.theme.colors.coral,
                  ),
                ),
                TextSpan(
                  text: '.',
                  style: context.theme.textStyle(
                    textStyle: TextStyles.body1,
                    color: context.theme.colors.general,
                  ),
                )
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      );
}
