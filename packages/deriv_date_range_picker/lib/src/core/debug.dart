import 'package:deriv_date_range_picker/l10n/generated/date_range_localizations.dart';
import 'package:flutter/material.dart';

/// Asserts that the given context has a [Localizations] ancestor that contains
/// a [DateRangeLocalizations] delegate.
///
/// Used to make sure that they are
/// only used in contexts where they have access to localizations.
///
/// To call this function, use the following pattern, typically in the
/// relevant Widget's build method:
///
/// ```dart
/// assert(debugCheckHasDateRangeLocalizations(context));
/// ```
///
/// Always place this before any early returns, so that the invariant is checked
/// in all cases. This prevents bugs from hiding until a particular codepath is
/// hit.
///
/// This function has the side-effect of establishing an inheritance
/// relationship with the nearest [Localizations] widget (see
/// [BuildContext.dependOnInheritedWidgetOfExactType]). This is ok if the caller
/// always also calls [Localizations.of] or [Localizations.localeOf].
///
/// Does nothing if asserts are disabled. Always returns true.
bool debugCheckHasDateRangeLocalizations(BuildContext context) {
  assert(() {
    if (Localizations.of<DateRangeLocalizations>(
            context, DateRangeLocalizations) ==
        null) {
      throw FlutterError.fromParts(<DiagnosticsNode>[
        ErrorSummary('No DateRangeLocalizations found.'),
        ErrorDescription(
          '${context.widget.runtimeType} widgets require DateRangeLocalizations '
          'to be provided by a Localizations widget ancestor.',
        ),
        ErrorHint(
          'To introduce a DateRangeLocalizations, '
          'add a Localization widget with a '
          'DateRangeLocalizations delegate.',
        ),
        ...context.describeMissingAncestor(
            expectedAncestorType: DateRangeLocalizations),
      ]);
    }
    return true;
  }());
  return true;
}
