import 'dart:io';

import 'package:deriv_passkeys/src/extensions/context_extensions.dart';
import 'package:deriv_passkeys/src/presentation/constants/assets.dart';
import 'package:deriv_passkeys/src/presentation/pages/learn_more_passkeys_page.dart';
import 'package:deriv_passkeys/src/presentation/pages/passkey_created_page.dart';
import 'package:deriv_passkeys/src/presentation/states/bloc/deriv_passkeys_bloc.dart';
import 'package:deriv_passkeys/src/presentation/widgets/icon_text_row_widget.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

/// A stateless widget to build the Effortless Passkeys page.
class EffortlessPasskeysPage extends StatelessWidget {
  /// Creates a [EffortlessPasskeysPage].
  const EffortlessPasskeysPage({
    required this.onFlowComplete,
    required this.derivPasskeysBloc,
    super.key,
  });

  /// The route name for the effortless passkeys page.
  static const String routeName = 'effortless_passkeys_page';

  /// The bloc to handle the passkey state
  final DerivPasskeysBloc derivPasskeysBloc;

  /// Callback to be called when the flow is complete.
  final void Function(BuildContext context) onFlowComplete;

  @override
  Widget build(BuildContext context) =>
      BlocListener<DerivPasskeysBloc, DerivPasskeysState>(
        bloc: derivPasskeysBloc,
        listener: (BuildContext context, DerivPasskeysState state) {
          if (state is DerivPasskeysCreatedSuccessfullyState) {
            String platformName =
                context.derivPasskeysLocalizations.unsupportedPlatform;
            if (Platform.isIOS) {
              platformName = 'IOS';
            }
            if (Platform.isAndroid) {
              platformName = 'Android';
            }
            Navigator.push(
              context,
              MaterialPageRoute<Widget>(
                  builder: (BuildContext context) => PasskeyCreatedPage(
                        platformName: platformName,
                        onPageClose: onFlowComplete,
                      )),
            );
          }
        },
        child: Scaffold(
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextButton(
                      onPressed: () => onFlowComplete(context),
                      child: Text(
                        context.derivPasskeysLocalizations.maybeLater,
                        style: TextStyle(color: context.theme.colors.coral),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 96),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        IconTextRowWidget(
                          assetName: Assets.fingerPrintIcon,
                          text: context.derivPasskeysLocalizations
                              .noNeedToRememberPassword,
                        ),
                        Divider(
                          color: context.theme.colors.hover,
                        ),
                        IconTextRowWidget(
                          assetName: Assets.syncIcon,
                          text: context
                              .derivPasskeysLocalizations.syncAcrossAllDevices,
                        ),
                        Divider(
                          color: context.theme.colors.hover,
                        ),
                        IconTextRowWidget(
                          assetName: Assets.lockIcon,
                          text: context
                              .derivPasskeysLocalizations.useYourBiometrics,
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
                                        '${context.derivPasskeysLocalizations.learnMoreAboutPasskeys} '),
                                WidgetSpan(
                                  alignment: PlaceholderAlignment.middle,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute<Widget>(
                                          builder: (_) =>
                                              const LearnMorePasskeysPage(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      '${context.derivPasskeysLocalizations.here}.',
                                      style: TextStyle(
                                          color: context.theme.colors.coral),
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
                        context
                            .read<DerivPasskeysBloc>()
                            .add(DerivPasskeysCreateCredentialEvent());
                      },
                      child: Text(
                        context.derivPasskeysLocalizations.createPasskey,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
