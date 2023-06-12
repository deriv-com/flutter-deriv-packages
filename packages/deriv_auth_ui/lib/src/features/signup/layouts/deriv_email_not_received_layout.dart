import 'package:deriv_auth_ui/src/core/helpers/assets.dart';
import 'package:deriv_auth_ui/src/core/helpers/extensions.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// Page to show when email is not received
class DerivEmailNotReceivedLayout extends StatelessWidget {
  const DerivEmailNotReceivedLayout({
    required this.onReEnterEmailPressed,
    Key? key,
  }) : super(key: key);

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
              context.localization.labelEmailIssueHeader,
              style: context.theme.textStyle(
                textStyle: TextStyles.body2,
                color: context.theme.colors.lessProminent,
              ),
            ),
            const SizedBox(height: ThemeProvider.margin24),
            Row(
              children: <Widget>[
                SvgPicture.asset(emailIssue1),
                const SizedBox(width: ThemeProvider.margin24),
                Flexible(
                  child: Text(
                    context.localization.labelEmailIssueSpam,
                    style: context.theme.textStyle(
                      textStyle: TextStyles.body1,
                      color: context.theme.colors.lessProminent,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: ThemeProvider.margin24),
            Row(
              children: <Widget>[
                SvgPicture.asset(emailIssue2),
                const SizedBox(width: ThemeProvider.margin24),
                Flexible(
                  child: Text(
                    context.localization.labelEmailIssueWrongEmail,
                    style: context.theme.textStyle(
                      textStyle: TextStyles.body1,
                      color: context.theme.colors.lessProminent,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: ThemeProvider.margin24),
            Row(
              children: <Widget>[
                SvgPicture.asset(emailIssue3),
                const SizedBox(width: ThemeProvider.margin24),
                Flexible(
                  child: Text(
                    context.localization.labelEmailIssueTypo,
                    style: context.theme.textStyle(
                      textStyle: TextStyles.body1,
                      color: context.theme.colors.lessProminent,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: ThemeProvider.margin24),
            Row(
              children: <Widget>[
                SvgPicture.asset(emailIssue4),
                const SizedBox(width: ThemeProvider.margin24),
                Flexible(
                  child: Text(
                    context.localization.labelEmailIssueFirewall,
                    style: context.theme.textStyle(
                      textStyle: TextStyles.body1,
                      color: context.theme.colors.lessProminent,
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
            context.localization.actionReenterEmail,
            style: context.theme.textStyle(
              textStyle: TextStyles.button
                  .copyWith(color: context.theme.colors.prominent),
            ),
          ),
        ),
      );
}
