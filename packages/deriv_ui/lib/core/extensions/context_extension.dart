import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

/// Extension methods for [BuildContext].
extension ContextExtension on BuildContext {
  /// Gets for app localization.
  S get localization => S.of(this);


  /// Gets the device's screen size.
  Size get screenSize => MediaQuery.of(this).size;
}
