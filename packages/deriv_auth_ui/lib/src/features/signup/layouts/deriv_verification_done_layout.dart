import 'package:deriv_auth_ui/src/core/extensions/context_extension.dart';
import 'package:deriv_auth_ui/src/core/helpers/assets.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// Once user has verified the email, we show this page.
class DerivVerificationDoneLayout extends StatelessWidget {
  /// Constructor for VerificationDonePage
  const DerivVerificationDoneLayout({
    required this.verificationCode,
    required this.onContinuePressed,
    this.affiliateToken,
    Key? key,
  }) : super(key: key);

  /// Verification Code
  final String verificationCode;

  /// Affiliate token.
  final String? affiliateToken;

  /// Callback to be called when continue button is tapped.
  final VoidCallback onContinuePressed;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: context.theme.colors.primary,
        appBar: AppBar(
          elevation: ThemeProvider.zeroMargin,
          title: Text(context.localization.labelVerifyYourEmail),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(child: _buildUpperPage(context)),
              Padding(
                padding: const EdgeInsets.all(ThemeProvider.margin16),
                child: _buildLowerPage(context),
              ),
            ],
          ),
        ),
      );

  Widget _buildUpperPage(BuildContext context) => Padding(
        padding: const EdgeInsets.all(ThemeProvider.margin16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              Assets.emailReadIcon,
              package: 'deriv_auth_ui',
            ),
            const SizedBox(height: ThemeProvider.margin16),
            Text(
              context.localization.labelThanksEmail,
              style: TextStyles.title,
            ),
            const SizedBox(height: ThemeProvider.margin08),
            Text(
              context.localization.informLetsContinue,
              style: context.theme.textStyle(
                textStyle: TextStyles.body1,
                color: context.theme.colors.lessProminent,
              ),
            ),
          ],
        ),
      );

  Widget _buildLowerPage(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[_buildContinueButton(context)],
      );

  Widget _buildContinueButton(BuildContext context) => PrimaryButton(
        onPressed: onContinuePressed,
        child: Center(
          child: Text(
            context.localization.actionContinue,
            style: context.theme.textStyle(
              textStyle: TextStyles.button
                  .copyWith(color: context.theme.colors.prominent),
            ),
          ),
        ),
      );
}
