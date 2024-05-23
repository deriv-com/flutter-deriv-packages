import 'package:deriv_localizations/l10n/generated/deriv_passkeys/deriv_passkeys_localizations.dart';
import 'package:flutter/widgets.dart';

/// Extension for [BuildContext]
extension ContextExtension on BuildContext {
  /// Get derivPasskeysLocalizations.
  DerivPasskeysLocalizations get derivPasskeysLocalizations =>
      DerivPasskeysLocalizations.of(this)!;
}
