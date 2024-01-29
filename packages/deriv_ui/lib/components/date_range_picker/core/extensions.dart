import 'package:deriv_ui/l10n/generated/date_range_localizations.dart';
import 'package:flutter/material.dart';

/// Extension for [BuildContext] to get localization.
extension ContextExtension on BuildContext {
  /// Get localization.
  DateRangeLocalizations? get localization => DateRangeLocalizations.of(this);
}
