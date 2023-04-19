// ignore_for_file: prefer_mixin

import 'package:flutter/material.dart';

import 'theme_provider.dart';
import 'deriv_theme.dart';

/// Provides a [DerivTheme] to its descendants which can be accessed using [DerivThemeProvider.getTheme].
///
/// It also provides a [changeThemeMode] method to change the theme mode.
/// You can pass optional [initialTheme] parameter to set the initial theme mode.
class DerivThemeProvider extends StatefulWidget {
  /// Creates a [DerivThemeProvider] instance.
  const DerivThemeProvider({
    required this.child,
    this.initialTheme,
  });

  static const DerivTheme _defaultDerivTheme = DerivTheme(Brightness.dark);

  /// The widget below this widget in the tree.
  final Widget child;

  /// The initial theme mode.
  final ThemeMode? initialTheme;

  /// Changes the theme mode.
  static void changeThemeMode(BuildContext context, ThemeMode mode) => context
      .findAncestorStateOfType<_DerivThemeProviderState>()
      ?.changeThemeMode(mode);

  /// Returns the [DerivTheme] of the closest ancestor [ThemeProvider].
  static DerivTheme getTheme(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ThemeProvider>()?.theme ??
      _defaultDerivTheme;

  @override
  State<DerivThemeProvider> createState() => _DerivThemeProviderState();
}

class _DerivThemeProviderState extends State<DerivThemeProvider>
    with WidgetsBindingObserver {
  static const ThemeMode _defaultTheme = ThemeMode.system;
  late Brightness _systemBrightness;
  late ThemeMode _themeMode;

  @override
  void initState() {
    WidgetsBinding.instance?.addObserver(this);
    _systemBrightness =
        WidgetsBinding.instance?.window.platformBrightness ?? Brightness.light;

    _themeMode = widget.initialTheme ?? _defaultTheme;

    super.initState();
  }

  @override
  Widget build(BuildContext context) => ThemeProvider(
        brightness: brightness,
        child: widget.child,
      );

  void changeThemeMode(ThemeMode mode) {
    setState(() => _themeMode = mode);
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    if (mounted) {
      setState(() {
        _systemBrightness =
            WidgetsBinding.instance?.window.platformBrightness ??
                _systemBrightness;
      });
    }

    super.didChangePlatformBrightness();
  }

  Brightness get brightness {
    switch (_themeMode) {
      case ThemeMode.light:
        return Brightness.light;
      case ThemeMode.dark:
        return Brightness.dark;
      case ThemeMode.system:
        return _systemBrightness;
    }
  }
}
