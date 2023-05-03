// import 'package:deriv_numpad/generated/l10n.dart';
import 'package:flutter/material.dart';

/// Extension methods for [BuildContext].
extension ContextExtension on BuildContext {
  /// Gets the device's screen size.
  Size get screenSize => MediaQuery.of(this).size;

  /// A shortcut to access [T] from the ancestor's context.
  ///
  /// This does the same thing as the `InheritedWidget.of(context)` static method.
  T provide<T extends InheritedWidget>() {
    final T? widget = dependOnInheritedWidgetOfExactType<T>();

    assert(widget != null, '$T not found in context');

    return widget!;
  }
}
