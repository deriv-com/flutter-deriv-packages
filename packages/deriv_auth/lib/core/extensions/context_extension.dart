import 'package:deriv_auth/generated/l10n.dart';
import 'package:flutter/material.dart';

/// Extension methods for [BuildContext].
extension ContextExtension on BuildContext {
  /// Gets [DerivAuthUILocalization].
  DerivAuthLocalization get derivAuthLocalization =>
      DerivAuthLocalization.of(this);
}
