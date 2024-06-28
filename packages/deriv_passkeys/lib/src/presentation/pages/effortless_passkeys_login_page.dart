import 'package:deriv_passkeys/src/core/extensions/context_extensions.dart';
import 'package:deriv_passkeys/src/presentation/constants/assets.dart';
import 'package:deriv_passkeys/src/presentation/mixins/passkey_event_tracking_mixin.dart';
import 'package:deriv_passkeys/src/presentation/pages/learn_more_passkeys_page.dart';
import 'package:deriv_passkeys/src/presentation/pages/passkey_created_page.dart';
import 'package:deriv_passkeys/src/presentation/states/bloc/deriv_passkeys_bloc.dart';
import 'package:deriv_passkeys/src/presentation/utils/handle_errors_utils.dart';
import 'package:deriv_passkeys/src/presentation/widgets/icon_text_row_widget.dart';
import 'package:deriv_passkeys/src/presentation/widgets/passkey_created_call_to_action.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

/// A stateless widget to build the Effortless Passkeys page.
class EffortlessPasskeysPage extends StatelessWidget
    with PasskeyEventTrackingMixin {
  /// Creates a [EffortlessPasskeysPage].
  EffortlessPasskeysPage({
    required this.onPageClosed,
    required this.addMorePasskeysNavigationCallback,
    required this.continueTradingNavigationCallback,
    super.key,
  }) {
    trackOpenEffortlessLoginPage();
  }

  /// The route name for the effortless passkeys page.
  static const String routeName = 'effortless_passkeys_page';

  /// Callback to be called when the user wants to add more passkeys.
  final void Function(BuildContext context) addMorePasskeysNavigationCallback;

  /// Callback to be called when the user wants to continue trading.
  final void Function(BuildContext context) continueTradingNavigationCallback;

  /// Callback to be called when the flow is complete.
  final void Function(BuildContext context) onPageClosed;

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () async {
          trackCloseEffortlessLoginPage();
          return true;
        },
        child: BlocListener<DerivPasskeysBloc, DerivPasskeysState>(
          listener: (BuildContext context, DerivPasskeysState state) {
            if (state is DerivPasskeysCreatedSuccessfullyState) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute<Widget>(
                    builder: (BuildContext context) => PasskeyCreatedPage(
                          onPageClose: (BuildContext context) {
                            onPageClosed(context);
                          },
                          bottomCallToAction: PasskeysCreatedCallToAction(
                            addMorePasskeysNavigationCallback:
                                (BuildContext context) {
                              trackAddMorePasskeys();
                              addMorePasskeysNavigationCallback(context);
                            },
                            continueTradingNavigationCallback:
                                (BuildContext context) {
                              trackContinueTrading();
                              continueTradingNavigationCallback(context);
                            },
                          ),
                        )),
              );
            } else if (state is DerivPasskeysErrorState) {
              trackPasskeyError('${state.errorCode}: ${state.message}');
              handlePasskeysError(context, state);
            }
          },
          child: Scaffold(
            body: SafeArea(
              child: LayoutBuilder(
                  builder: (_, BoxConstraints constraints) =>
                      SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                              minWidth: constraints.maxWidth,
                              minHeight: constraints.maxHeight),
                          child: IntrinsicHeight(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: TextButton(
                                      onPressed: () {
                                        trackMaybeLater();
                                        onPageClosed(context);
                                      },
                                      child: Text(
                                        context.derivPasskeysLocalizations
                                            .maybeLater
                                            .toUpperCase(),
                                        style: TextStyle(
                                          color: context.theme.colors.coral,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 24, vertical: 96),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        SvgPicture.asset(
                                          Assets.effortlessPasskeysIcon,
                                          package: 'deriv_passkeys',
                                        ),
                                        Text(
                                          context.derivPasskeysLocalizations
                                              .effortlessLoginWithPasskeys,
                                          style: const TextStyle(fontSize: 20),
                                        ),
                                        const SizedBox(
                                          height: 24,
                                        ),
                                        IconTextRowWidget(
                                          assetName: Assets.fingerPrintIcon,
                                          text: context
                                              .derivPasskeysLocalizations
                                              .noNeedToRememberPassword,
                                        ),
                                        Divider(
                                          color: context.theme.colors.hover,
                                        ),
                                        IconTextRowWidget(
                                          assetName: Assets.syncIcon,
                                          text: context
                                              .derivPasskeysLocalizations
                                              .syncAcrossDevices,
                                        ),
                                        Divider(
                                          color: context.theme.colors.hover,
                                        ),
                                        IconTextRowWidget(
                                          assetName: Assets.lockIcon,
                                          text: context
                                              .derivPasskeysLocalizations
                                              .useYourBiometrics,
                                        ),
                                        Divider(
                                          color: context.theme.colors.hover,
                                        ),
                                        SizedBox(
                                          width: double.infinity,
                                          child: RichText(
                                            text: TextSpan(
                                              children: <InlineSpan>[
                                                TextSpan(
                                                    text:
                                                        '${context.derivPasskeysLocalizations.learnMoreAboutPasskeys} ',
                                                    style: TextStyle(
                                                      color: context
                                                          .theme.colors.general,
                                                    )),
                                                WidgetSpan(
                                                  alignment:
                                                      PlaceholderAlignment
                                                          .middle,
                                                  child: InkWell(
                                                    onTap: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute<
                                                            Widget>(
                                                          builder: (_) => LearnMorePasskeysPage(
                                                              onPageClosed:
                                                                  (BuildContext
                                                                      context) {
                                                            Navigator.pop(
                                                                context);
                                                          }, addMorePasskeysNavigationCallback:
                                                                  (BuildContext
                                                                      context) {
                                                            trackAddMorePasskeys();
                                                            addMorePasskeysNavigationCallback(
                                                                context);
                                                          }, continueTradingNavigationCallback:
                                                                  (BuildContext
                                                                      context) {
                                                            trackContinueTrading();
                                                            continueTradingNavigationCallback(
                                                                context);
                                                          }),
                                                        ),
                                                      );
                                                    },
                                                    child: Text(
                                                      '${context.derivPasskeysLocalizations.here}.',
                                                      style: TextStyle(
                                                          color: context.theme
                                                              .colors.coral),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: PrimaryButton(
                                      onPressed: () {
                                        trackCreatePasskey();
                                        context.read<DerivPasskeysBloc>().add(
                                            DerivPasskeysCreateCredentialEvent());
                                      },
                                      child: Text(
                                        context.derivPasskeysLocalizations
                                            .createPasskey,
                                        style: TextStyle(
                                          color: context.theme.colors.prominent,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )),
            ),
          ),
        ),
      );
}
