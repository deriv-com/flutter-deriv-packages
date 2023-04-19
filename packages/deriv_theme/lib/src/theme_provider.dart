import 'package:flutter/material.dart';
import 'package:deriv_theme/deriv_theme.dart';

/// Applies a theme to descendant widgets.
///
/// A theme describes the colors and typographic choices of an application.
///  Descendant widgets obtain the current theme's [DerivTheme] object using
/// [ThemeProvider.of].
class ThemeProvider extends InheritedWidget {
  /// Applies the given theme [brightness] to [child].
  ///
  /// The [brightness] and [child] arguments must not be null.
  const ThemeProvider({
    required this.brightness,
    required Widget child,
    Key? key,
  }) : super(child: child, key: key);

  static const DerivTheme _darkTheme = DerivTheme(Brightness.dark);
  static const DerivTheme _lightTheme = DerivTheme(Brightness.light);

  /// The brightness of the theme to apply to descendant widgets.
  final Brightness brightness;

  /// Gets a [DerivTheme] based on the [brightness].
  DerivTheme get theme =>
      brightness == Brightness.light ? _lightTheme : _darkTheme;

  /// The data from the closest [DerivThemeProvider] instance that encloses the given
  /// context.
  static DerivTheme of(BuildContext? context) =>
      context?.dependOnInheritedWidgetOfExactType<ThemeProvider>()?.theme ??
      _darkTheme;

  @override
  bool updateShouldNotify(ThemeProvider oldWidget) =>
      brightness != oldWidget.brightness;
}
