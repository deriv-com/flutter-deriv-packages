import 'package:deriv_passkeys/presentation/constants/assets.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

///
class PasskeyCreatedPage extends StatelessWidget {
  /// Creates a [PasskeyCreatedPage].
  const PasskeyCreatedPage({
    required this.platformName,
    required this.onPageClose,
    super.key,
  });

  /// The name of the platform.
  final String platformName;

  /// A callback function that will be called when the user clicks on the 'Continue' button.
  final void Function(BuildContext context) onPageClose;

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
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          child: SvgPicture.asset(
                            Assets.passkeyCreatedSuccessIcon,
                            package: 'deriv_passkeys',
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 24),
                          child: Text(
                            'Success!',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Text(
                          'Your account is now secured with a passkey. Manage your passkey through your ${platformName} account settings.',
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
                Container(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: PrimaryButton(
                      onPressed: () => onPageClose(context),
                      child: const Text('Continue'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
