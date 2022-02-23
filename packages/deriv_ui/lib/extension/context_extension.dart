import 'package:deriv_ui/theme/app_theme_provider.dart';
import 'package:deriv_ui/theme/theme_provider.dart';
import 'package:flutter/material.dart';

import '../generated/l10n.dart';

/// Extension methods for [BuildContext].
extension ContextExtension on BuildContext {
  /// Gets for app localization.
  S get localization => S.of(this);

  /// Gets [ThemeProvider].
  ThemeProvider get theme => AppThemeProvider.of(this);

  /// Gets the device's screen size.
  Size get screenSize => MediaQuery.of(this).size;
}
