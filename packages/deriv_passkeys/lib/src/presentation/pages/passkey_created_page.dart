import 'package:deriv_passkeys/src/extensions/context_extensions.dart';
import 'package:deriv_passkeys/src/presentation/constants/assets.dart';
import 'package:deriv_passkeys/src/presentation/utils/platform_utils.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// A stateless widget to build the passkey created successfully page.
class PasskeyCreatedPage extends StatelessWidget {
  /// Creates a [PasskeyCreatedPage].
  const PasskeyCreatedPage({
    required this.onPageClose,
    required this.bottomCallToAction,
    super.key,
  });

  /// A callback function that will be called when the user clicks on the 'Continue' button.
  final void Function(BuildContext context) onPageClose;

  /// The widget to be displayed at the bottom of the page.
  final Widget bottomCallToAction;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => onPageClose(context),
          ),
        ),
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          child: SvgPicture.asset(
                            Assets.passkeyCreatedSuccessIcon,
                            package: 'deriv_passkeys',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24),
                          child: Text(
                            context.derivPasskeysLocalizations
                                .passkeyCreatedSuccessTitle,
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                        Text(
                          context.derivPasskeysLocalizations
                              .passkeyCreatedSuccessMessage(
                                  platformName(context)),
                          style: TextStyle(
                            fontSize: 14,
                            color: context.theme.colors.general,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                bottomCallToAction,
              ],
            ),
          ),
        ),
      );
}
