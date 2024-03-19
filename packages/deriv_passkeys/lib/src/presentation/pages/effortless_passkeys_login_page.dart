import 'dart:io';

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
    super.key,
  });

  /// Callback to be called when the flow is complete.
  final void Function(BuildContext context) onFlowComplete;

  @override
  Widget build(BuildContext context) =>
      BlocListener<DerivPasskeysBloc, DerivPasskeysState>(
        listener: (BuildContext context, DerivPasskeysState state) {
          if (state is DerivPasskeysCreatedSuccessfullyState) {
            String platformName = 'Unsupported Platform';
            //get if device is android or ios
            if (Platform.isIOS) {
              // TODO(bassam): replace with localized string if needed
              platformName = 'IOS';
            }
            if (Platform.isAndroid) {
              // TODO(bassam): replace with localized string if needed
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
          } else if (state is DerivPasskeysErrorState) {
            // TODO(bassam): Handle error state if needed, e.g., show a Snackbar
          }
        },
        child: Scaffold(
          // TODO(bassam): localize all the strings in this page
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
                        'MAYBE LATER',
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
                        const Text(
                          'Effortless login with passkeys',
                          style: TextStyle(fontSize: 20),
                        ),
                        const IconTextRowWidget(
                          assetName: Assets.fingerPrintIcon,
                          text: 'No need to remember a password',
                        ),
                        Divider(
                          color: context.theme.colors.hover,
                        ),
                        const IconTextRowWidget(
                          assetName: Assets.syncIcon,
                          text: 'Sync across all devices',
                        ),
                        Divider(
                          color: context.theme.colors.hover,
                        ),
                        const IconTextRowWidget(
                          assetName: Assets.lockIcon,
                          text:
                              'Enhanced security with biometrics or screen lock',
                        ),
                        Divider(
                          color: context.theme.colors.hover,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: RichText(
                            text: TextSpan(
                              children: <InlineSpan>[
                                const TextSpan(
                                    text: 'Learn more about passkeys '),
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
                                      'here.',
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
                      // TODO(bassam): replace with localized string
                      child: const Text('Create Passkey'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
