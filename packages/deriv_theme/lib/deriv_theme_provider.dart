// ignore_for_file: prefer_mixin

import 'package:deriv_theme/text_styles.dart';
import 'package:flutter/material.dart';

import 'theme_provider.dart';

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

  /// Creates a [DerivThemeProvider] instance with updated context.
  factory DerivThemeProvider.builder({
    required WidgetBuilder builder,
    ThemeMode? initialTheme,
  }) =>
      DerivThemeProvider(
        initialTheme: initialTheme,
        child: Builder(builder: builder),
      );

  static const ThemeProvider _defaultDerivTheme =
      ThemeProvider(Brightness.dark);
  static final ThemeData _defaultDerivThemeData =
      ThemeData(brightness: Brightness.dark);

  /// The widget below this widget in the tree.
  final Widget child;

  /// The initial theme mode.
  final ThemeMode? initialTheme;

  /// Changes the theme mode.
  static void changeThemeMode(BuildContext context, ThemeMode mode) => context
      .findAncestorStateOfType<_DerivThemeProviderState>()
      ?.changeThemeMode(mode);

  /// Returns the [DerivTheme] of the closest ancestor [ThemeProvider].
  static ThemeProvider getTheme(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<BrightnessProvider>()?.theme ??
      _defaultDerivTheme;

  /// Returns the [ThemeData] of the closest ancestor [ThemeProvider].
  static ThemeData getThemeData(BuildContext context) =>
      context
          .dependOnInheritedWidgetOfExactType<BrightnessProvider>()
          ?.themeData ??
      _defaultDerivThemeData;

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
    super.initState();

    WidgetsBinding.instance.addObserver(this);
    _themeMode = widget.initialTheme ?? _defaultTheme;
  }

  @override
  void didChangeDependencies() {
    _systemBrightness = MediaQuery.platformBrightnessOf(context);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) => BrightnessProvider(
        brightness: brightness,
        child: widget.child,
      );

  void changeThemeMode(ThemeMode mode) {
    setState(() => _themeMode = mode);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    if (mounted) {
      setState(() {
        _systemBrightness = MediaQuery.platformBrightnessOf(context);
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

/// Applies a brightness to descendant widgets.
///
/// A theme describes the colors and typographic choices of an application.
///  Descendant widgets obtain the current theme's [ThemeProvider] object using
/// [BrightnessProvider.of].
class BrightnessProvider extends InheritedWidget {
  /// Applies the given theme [brightness] to [child].
  ///
  /// The [brightness] and [child] arguments must not be null.
  const BrightnessProvider({
    required this.brightness,
    required Widget child,
    Key? key,
  }) : super(child: child, key: key);

  static const ThemeProvider _darkTheme = ThemeProvider(Brightness.dark);
  static const ThemeProvider _lightTheme = ThemeProvider(Brightness.light);

  /// The brightness of the theme to apply to descendant widgets.
  final Brightness brightness;

  /// Gets a [ThemeProvider] based on the [brightness].
  ThemeProvider get theme =>
      brightness == Brightness.light ? _lightTheme : _darkTheme;

  /// Gets a [ThemeData] based on the [brightness].
  ThemeData get themeData => ThemeData(
        // TODO(mohammad): check real values with design team.
        primaryColor: theme.colors.secondary,
        fontFamily: theme.fontFamily,
        brightness: brightness,
        bottomSheetTheme: BottomSheetThemeData(
          // Needed for bottom sheet, otherwise,
          // sharp edges and different background color will appear at the top of the sheet.
          backgroundColor: Colors.black.withOpacity(0),
        ),
        unselectedWidgetColor: theme.colors.disabled,
        toggleButtonsTheme: ToggleButtonsThemeData(
          textStyle: theme.textStyle(
            textStyle: TextStyles.body2,
          ),
        ),
        colorScheme: const ColorScheme.dark().copyWith(
          primary: theme.colors.prominent,
          secondary: theme.colors.coral,
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: theme.colors.disabled,
          selectionHandleColor: theme.colors.disabled,
          selectionColor: theme.colors.disabled,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: theme.colors.secondary,
          centerTitle: false,
        ),
      );

  /// The data from the closest [DerivThemeProvider] instance that encloses the given
  /// context.
  static ThemeProvider of(BuildContext? context) =>
      context
          ?.dependOnInheritedWidgetOfExactType<BrightnessProvider>()
          ?.theme ??
      _darkTheme;

  @override
  bool updateShouldNotify(BrightnessProvider oldWidget) =>
      brightness != oldWidget.brightness;
}
