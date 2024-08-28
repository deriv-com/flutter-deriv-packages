import 'package:deriv_auth/core/extensions/context_extension.dart';
import 'package:deriv_auth/core/helpers/assets.dart';
import 'package:deriv_auth/features/signup/models/deriv_residence_model.dart';
import 'package:deriv_auth/features/signup/presentation/layouts/deriv_country_selection_layout.dart';
import 'package:deriv_auth/features/single_entry/core/auth_data.dart';
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
    this.residences,
    Key? key,
  }) : super(key: key);

  /// Verification Code
  final String verificationCode;

  /// Affiliate token.
  final String? affiliateToken;

  /// Callback to be called when continue button is tapped.
  final VoidCallback onContinuePressed;

  /// List of residences to be shown.
  final Future<List<DerivResidenceModel>>? residences;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: context.theme.colors.primary,
        appBar: AppBar(
          elevation: ThemeProvider.zeroMargin,
          title: Text(context.derivAuthLocalization.labelVerifyYourEmail),
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
              package: 'deriv_auth',
            ),
            const SizedBox(height: ThemeProvider.margin16),
            Text(
              context.derivAuthLocalization.labelThanksEmail,
              style: TextStyles.title,
            ),
            const SizedBox(height: ThemeProvider.margin08),
            Text(
              context.derivAuthLocalization.informLetsContinue,
              style: context.theme.textStyle(
                textStyle: TextStyles.body1,
                color: context.theme.colors.general,
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
        onPressed: AuthData().data.signupPageModel.handleFlowFromPackage
            ? () async {
                final List<DerivResidenceModel> residencesList =
                    await residences!;

                // Navigate to the new page once the residences are loaded
                await Navigator.pushReplacement<BuildContext,
                    Route<DerivCountrySelectionLayout>>(
                  context,
                  MaterialPageRoute<BuildContext>(
                    builder: (BuildContext context) =>
                        DerivCountrySelectionLayout(
                      affiliateToken: affiliateToken,
                      verificationCode: verificationCode,
                      onNextPressed: () {},
                      residences: Future<List<DerivResidenceModel>>.value(
                          residencesList),
                    ),
                  ),
                );
              }
            : onContinuePressed,
        child: Center(
          child: Text(
            context.derivAuthLocalization.actionContinue,
            style: context.theme.textStyle(
              textStyle: TextStyles.button
                  .copyWith(color: context.theme.colors.prominent),
            ),
          ),
        ),
      );
}
