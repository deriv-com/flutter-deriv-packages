import 'package:deriv_ui/theme/theme_provider.dart';
import 'package:flutter/material.dart';

/// Applies a theme to descendant widgets.
///
/// A theme describes the colors and typographic choices of an application.
///  Descendant widgets obtain the current theme's [ThemeProvider] object using
/// [AppThemeProvider.of].
class AppThemeProvider extends InheritedWidget {
  /// Applies the given theme [theme] to [child].
  ///
  /// The [theme] and [child] arguments must not be null.
  const AppThemeProvider({
    required this.theme,
    required Widget child,
    Key? key,
  })  : assert(theme != null),
        super(
          child: child,
          key: key,
        );

  /// Specifies the color and typography values for descendant widgets.
  final ThemeProvider? theme;

  /// The data from the closest [ThemeProvider] instance that encloses the given
  /// context.
  static ThemeProvider of(BuildContext? context) =>
      context?.findAncestorWidgetOfExactType<AppThemeProvider>()?.theme ??
      ThemeProvider();

  @override
  bool updateShouldNotify(AppThemeProvider oldWidget) => false;
}
