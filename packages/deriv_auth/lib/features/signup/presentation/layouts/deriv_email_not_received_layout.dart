import 'package:deriv_auth/core/extensions/context_extension.dart';
import 'package:deriv_auth/core/helpers/assets.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// Page to show when email is not received
class DerivEmailNotReceivedLayout extends StatelessWidget {
  /// Initializes the email not received page.
  const DerivEmailNotReceivedLayout({
    required this.onReEnterEmailPressed,
    Key? key,
  }) : super(key: key);

  /// Callback to be called when re-enter email button is pressed.
  final VoidCallback onReEnterEmailPressed;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: context.theme.colors.primary,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: _buildUpperPage(context),
              ),
              Padding(
                padding: const EdgeInsets.all(
                  ThemeProvider.margin16,
                ),
                child: _buildLowerPage(context),
              ),
            ],
          ),
        ),
      );

  Widget _buildUpperPage(BuildContext context) => Padding(
        padding: const EdgeInsets.all(ThemeProvider.margin24),
        child: Column(
          children: <Widget>[
            Text(
              context.derivAuthLocalization.labelEmailIssueHeader,
              style: context.theme.textStyle(
                textStyle: TextStyles.body2,
                color: context.theme.colors.general,
              ),
            ),
            const SizedBox(height: ThemeProvider.margin24),
            Row(
              children: <Widget>[
                SvgPicture.asset(Assets.emailIssue1, package: 'deriv_auth'),
                const SizedBox(width: ThemeProvider.margin24),
                Flexible(
                  child: Text(
                    context.derivAuthLocalization.labelEmailIssueSpam,
                    style: context.theme.textStyle(
                      textStyle: TextStyles.body1,
                      color: context.theme.colors.general,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: ThemeProvider.margin24),
            Row(
              children: <Widget>[
                SvgPicture.asset(Assets.emailIssue2, package: 'deriv_auth'),
                const SizedBox(width: ThemeProvider.margin24),
                Flexible(
                  child: Text(
                    context.derivAuthLocalization.labelEmailIssueWrongEmail,
                    style: context.theme.textStyle(
                      textStyle: TextStyles.body1,
                      color: context.theme.colors.general,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: ThemeProvider.margin24),
            Row(
              children: <Widget>[
                SvgPicture.asset(Assets.emailIssue3, package: 'deriv_auth'),
                const SizedBox(width: ThemeProvider.margin24),
                Flexible(
                  child: Text(
                    context.derivAuthLocalization.labelEmailIssueTypo,
                    style: context.theme.textStyle(
                      textStyle: TextStyles.body1,
                      color: context.theme.colors.general,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: ThemeProvider.margin24),
            Row(
              children: <Widget>[
                SvgPicture.asset(Assets.emailIssue4, package: 'deriv_auth'),
                const SizedBox(width: ThemeProvider.margin24),
                Flexible(
                  child: Text(
                    context.derivAuthLocalization.labelEmailIssueFirewall,
                    style: context.theme.textStyle(
                      textStyle: TextStyles.body1,
                      color: context.theme.colors.general,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  Widget _buildLowerPage(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          _buildReEnterEmailButton(context),
        ],
      );

  Widget _buildReEnterEmailButton(BuildContext context) => PrimaryButton(
        onPressed: onReEnterEmailPressed,
        child: Center(
          child: Text(
            context.derivAuthLocalization.actionReenterEmail,
            style: context.theme.textStyle(
              textStyle: TextStyles.button
                  .copyWith(color: context.theme.colors.prominent),
            ),
          ),
        ),
      );
}
