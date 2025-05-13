import 'package:deriv_passkeys/deriv_passkeys.dart';
import 'package:deriv_passkeys/src/core/extensions/context_extensions.dart';
import 'package:deriv_passkeys/src/presentation/constants/assets.dart';
import 'package:deriv_passkeys/src/presentation/mixins/passkey_event_tracking_mixin.dart';
import 'package:deriv_passkeys/src/presentation/pages/passkey_created_page.dart';
import 'package:deriv_passkeys/src/presentation/widgets/passkey_created_call_to_action.dart';
import 'package:deriv_passkeys/src/presentation/widgets/section_title_and_content.dart';
import 'package:deriv_passkeys/src/presentation/widgets/unordered_list_widget.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A stateless widget to build the Learn More Passkeys page.
class LearnMorePasskeysPage extends StatelessWidget
    with PasskeyEventTrackingMixin {
  /// Creates a [LearnMorePasskeysPage].
  LearnMorePasskeysPage({
    required this.onPageClosed,
    required this.addMorePasskeysNavigationCallback,
    required this.continueTradingNavigationCallback,
    this.onExitPasskeysFlow,
    super.key,
  }) {
    trackOpenLearnMorePage();
  }

  /// Callback to be called when the flow is complete.
  final void Function(BuildContext context) onPageClosed;

  /// Callback to be called when the user wants to add more passkeys.
  final void Function(BuildContext context) addMorePasskeysNavigationCallback;

  /// Callback to be called when the user wants to continue trading.
  final void Function(BuildContext context) continueTradingNavigationCallback;

  /// Callback to be called when user exits the passkey flow and continues working with the app.
  final void Function()? onExitPasskeysFlow;

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () async {
          trackCloseLearnMorePage();
          return true;
        },
        child: BlocListener<DerivPasskeysBloc, DerivPasskeysState>(
          listener: (BuildContext context, DerivPasskeysState state) {
            if (state is DerivPasskeysCreatedSuccessfullyState) {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute<Widget>(
                  builder: (BuildContext context) => PasskeyCreatedPage(
                    onPageClose: onPageClosed,
                    onExitPasskeysFlow: onExitPasskeysFlow,
                    bottomCallToAction: PasskeysCreatedCallToAction(
                      addMorePasskeysNavigationCallback:
                          addMorePasskeysNavigationCallback,
                      continueTradingNavigationCallback:
                          (BuildContext context) {
                        continueTradingNavigationCallback(context);
                        if (onExitPasskeysFlow != null) {
                          onExitPasskeysFlow!.call();
                        }
                      },
                    ),
                  ),
                ),
              );
            }
          },
          child: Scaffold(
            appBar: AppBar(),
            body: Column(
              children: <Widget>[
                Expanded(
                  child: SingleChildScrollView(
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 14),
                              child: SvgPicture.asset(
                                Assets.effortlessPasskeysIcon,
                                package: 'deriv_passkeys',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 24),
                              child: Text(
                                context
                                    .derivPasskeysLocalizations.effortlessLogin,
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                            SectionTitleAndContent(
                              title: context
                                  .derivPasskeysLocalizations.whatArePasskeys,
                              texts: <String>[
                                context.derivPasskeysLocalizations
                                    .whatArePasskeysDescriptionPoint1,
                                context.derivPasskeysLocalizations
                                    .whatArePasskeysDescriptionPoint2
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Divider(
                                color: context.theme.colors.hover,
                              ),
                            ),
                            SectionTitleAndContent(
                              title: context
                                  .derivPasskeysLocalizations.whyPasskeys,
                              texts: <String>[
                                context.derivPasskeysLocalizations
                                    .whyPasskeysDescription1,
                                context.derivPasskeysLocalizations
                                    .whyPasskeysDescription2
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Divider(
                                color: context.theme.colors.hover,
                              ),
                            ),
                            SectionTitleAndContent(
                              title: context.read<DerivPasskeysBloc>().isDp2p
                                  ? context.derivPasskeysLocalizations
                                      .p2pHowToCreatePasskey
                                  : context.derivPasskeysLocalizations
                                      .howToCreatePasskey,
                              texts: <String>[
                                context.read<DerivPasskeysBloc>().isDp2p
                                    ? context.derivPasskeysLocalizations
                                        .p2pHowToCreatePasskeyDescription1
                                    : context.derivPasskeysLocalizations
                                        .howToCreatePasskeyDescription1,
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Divider(
                                color: context.theme.colors.hover,
                              ),
                            ),
                            SectionTitleAndContent(
                              title: context.derivPasskeysLocalizations
                                  .whereArePasskeysSaved,
                              texts: <String>[
                                context.derivPasskeysLocalizations
                                    .whereArePasskeysSavedDescriptionAndroid,
                                context.derivPasskeysLocalizations
                                    .whereArePasskeysSavedDescriptionIOS
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Divider(
                                color: context.theme.colors.hover,
                              ),
                            ),
                            SectionTitleAndContent(
                              title: context.derivPasskeysLocalizations
                                  .whatHappensIfEmailChanged,
                              texts: <String>[
                                context.derivPasskeysLocalizations
                                    .whatHappensIfEmailChangedDescription2
                              ],
                            ),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(16),
                              margin: const EdgeInsets.only(top: 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: context.theme.colors.active,
                                ),
                              ),
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SvgPicture.asset(
                                      Assets.lightBulbIcon,
                                      package: 'deriv_passkeys',
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          '${context.derivPasskeysLocalizations.tips}:',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color:
                                                context.theme.colors.prominent,
                                          ),
                                        ),
                                        Text(
                                          '${context.derivPasskeysLocalizations.beforeUsingPasskeys}:',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: context.theme.colors.general,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        UnorderedList(
                                          texts: <String>[
                                            context.derivPasskeysLocalizations
                                                .enableScreenLock,
                                            context.derivPasskeysLocalizations
                                                .signInGoogleOrIcloud,
                                            context.derivPasskeysLocalizations
                                                .enableBluetooth
                                          ],
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: context.theme.colors.general,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  color: context.theme.colors.secondary,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 24, right: 24, bottom: 24, top: 16),
                    child: PrimaryButton(
                      onPressed: () {
                        context
                            .read<DerivPasskeysBloc>()
                            .add(DerivPasskeysCreateCredentialEvent());
                      },
                      child: Text(
                        context.derivPasskeysLocalizations.createPasskey,
                        style: TextStyle(
                          color: context.theme.colors.prominent,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
