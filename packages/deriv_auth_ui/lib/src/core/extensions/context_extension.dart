import 'package:deriv_auth_ui/generated/l10n.dart';
import 'package:flutter/material.dart';

/// Extension methods for [BuildContext].
extension ContextExtension on BuildContext {
  /// Gets [DerivAuthUILocalization].
  DerivAuthUILocalization get localization => DerivAuthUILocalization.of(this);
}
