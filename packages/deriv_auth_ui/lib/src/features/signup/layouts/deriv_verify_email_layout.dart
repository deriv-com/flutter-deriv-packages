import 'package:deriv_auth_ui/src/core/helpers/assets.dart';
import 'package:deriv_auth_ui/src/core/helpers/extensions.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// Once user has provided the email for signup, we show this page.
class DerivVerifyEmailLayout extends StatelessWidget {
  /// Constructor for VerifyEmailPage
  const DerivVerifyEmailLayout({
    required this.email,
    required this.onEmailNotReceivedPressed,
    Key? key,
  }) : super(key: key);

  /// Email address to show in message
  final String? email;

  final VoidCallback onEmailNotReceivedPressed;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: context.theme.colors.primary,
        appBar: AppBar(
          elevation: ThemeProvider.zeroMargin,
          title: Text(
            context.localization.labelVerifyYourEmail,
            style: TextStyles.title,
          ),
          backgroundColor: context.theme.colors.secondary,
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
            SvgPicture.asset(emailUnreadIcon),
            const SizedBox(height: ThemeProvider.margin16),
            Text(
              context.localization.labelCheckEmail,
              style: TextStyles.title,
            ),
            const SizedBox(height: ThemeProvider.margin08),
            Text(
              context.localization.informVerificationEmailSent(email!),
              style: context.theme.textStyle(
                textStyle: TextStyles.body1,
                color: context.theme.colors.lessProminent,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );

  Widget _buildLowerPage(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[_buildNotReceivedButton(context)],
      );

  Widget _buildNotReceivedButton(BuildContext context) => SecondaryButton(
        onPressed: onEmailNotReceivedPressed,
        child: Center(
          child: Text(
            context.localization.actionEmailNotReceived,
            style: context.theme.textStyle(
              textStyle: TextStyles.button,
            ),
          ),
        ),
      );
}
