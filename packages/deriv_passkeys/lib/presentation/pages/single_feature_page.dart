import 'package:deriv_passkeys/presentation/widgets/continue_with_passkey_button.dart';
import 'package:flutter/material.dart';

/// Main singleFeature flow in wallets.
///
/// This is the landing page after a user clicks on the singleFeature button.
class SingleFeaturePage extends StatelessWidget {
  /// Creates a [SingleFeaturePage].
  const SingleFeaturePage({super.key});

  /// SingleFeature Page route name.
  static const String routeName = 'single_feature_page';

  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: ContinueWithPasskeyButton());
}
