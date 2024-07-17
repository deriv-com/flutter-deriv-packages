import 'package:deriv_localizations/l10n/generated/deriv_auth/deriv_auth_localizations.dart';
import 'package:flutter/material.dart';

/// Extension methods for [BuildContext].
extension ContextExtension on BuildContext {
  /// Gets [DerivAuthLocalizations].
  DerivAuthLocalizations get derivAuthLocalization =>
      DerivAuthLocalizations.of(this)!;
}
