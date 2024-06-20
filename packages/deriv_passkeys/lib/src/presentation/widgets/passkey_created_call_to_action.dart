import 'package:deriv_passkeys/src/core/extensions/context_extensions.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';

/// A stateless widget to build the passkeys created call to action.
class PasskeysCreatedCallToAction extends StatelessWidget {
  /// Creates a [PasskeysCreatedCallToAction].
  const PasskeysCreatedCallToAction({
    required this.addMorePasskeysNavigationCallback,
    required this.continueTradingNavigationCallback,
    super.key,
  });

  /// Callback to be called when the user wants to add more passkeys.
  final void Function(BuildContext context) addMorePasskeysNavigationCallback;

  /// Callback to be called when the user wants to continue trading.
  final void Function(BuildContext context) continueTradingNavigationCallback;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: <Widget>[
            Expanded(
              child: SecondaryButton(
                onPressed: () => addMorePasskeysNavigationCallback(context),
                child: Text(
                  context.derivPasskeysLocalizations.addMorePasskeysButtonText,
                  style: TextStyle(
                    color: context.theme.colors.prominent,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: PrimaryButton(
                onPressed: () => continueTradingNavigationCallback(context),
                child: Text(
                  context.derivPasskeysLocalizations.continueTradingButtonText,
                  style: TextStyle(
                    color: context.theme.colors.prominent,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
