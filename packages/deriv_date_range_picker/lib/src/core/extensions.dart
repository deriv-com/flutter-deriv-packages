import 'package:deriv_date_range_picker/l10n/generated/date_range_localizations.dart';
import 'package:flutter/material.dart';

/// Extension for [BuildContext] to get localization.
extension ContextExtension on BuildContext {
  /// Get localization.
  DateRangeLocalizations? get localization => DateRangeLocalizations.of(this);
}
