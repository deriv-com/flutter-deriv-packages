// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart' hide Colors;

import 'colors/colors.dart';
import 'src/colors.dart';
import 'src/dimens.dart';
import 'text_styles.dart';

/// A class that provides access to theme-related details from anywhere in the
/// app. Through an instance of the [ThemeProvider] class, it is possible to
/// access font family, various app colors, update app theme, and get text style
class ThemeProvider {
  // TODO(mohammad): rename to DerivTheme.
  const ThemeProvider(this.brightness);

  final Brightness brightness;

  /*
  In case of a theme change, use IDE refactoring technique to rename the values
  So they can be reflected wherever they are used in the app with ease.
  */
  static const double zeroMargin = Dimens.zeroMargin;

  static const double margin01 = Dimens.margin01;

  static const double margin02 = Dimens.margin02;

  static const double margin04 = Dimens.margin04;

  static const double margin06 = Dimens.margin06;

  static const double margin08 = Dimens.margin08;

  static const double margin12 = Dimens.margin12;

  static const double margin16 = Dimens.margin16;

  static const double margin18 = Dimens.margin18;

  static const double margin24 = Dimens.margin24;

  static const double margin32 = Dimens.margin32;

  static const double margin36 = Dimens.margin36;

  static const double margin40 = Dimens.margin40;

  static const double margin44 = Dimens.margin44;

  static const double margin48 = Dimens.margin48;

  static const double margin56 = Dimens.margin56;

  static const double margin64 = Dimens.margin64;

  static const double margin72 = Dimens.margin72;

  static const double margin78 = Dimens.margin78;

  static const double margin84 = Dimens.margin84;

  static const double margin96 = Dimens.margin96;

  static const double margin128 = Dimens.margin128;

  static const double borderRadius04 = Dimens.borderRadius04;

  static const double borderRadius08 = Dimens.borderRadius08;

  static const double borderRadius16 = Dimens.borderRadius16;

  static const double borderRadius100 = Dimens.borderRadius100;

  static const double iconSize8 = Dimens.iconSize8;

  static const double iconSize12 = Dimens.iconSize12;

  static const double iconSize16 = Dimens.iconSize16;

  static const double iconSize24 = Dimens.iconSize24;

  static const double iconSize32 = Dimens.iconSize32;

  static const double iconSize40 = Dimens.iconSize40;

  static const double iconSize48 = Dimens.iconSize48;

  static const double iconSize64 = Dimens.iconSize64;

  static const double iconSize72 = Dimens.iconSize72;

  static const double iconSize96 = Dimens.iconSize96;

  bool get _isDarkTheme => brightness == Brightness.dark;

  bool get isDarkTheme => _isDarkTheme;

  String get fontFamily => TextStyles.appFontFamily;

  // Colors getters
  @Deprecated('Use `colors.coral` instead')
  Color get brandCoralColor => BrandColors.coral;

  @Deprecated('Use `colors.blue` instead')
  Color get brandGreenishColor => BrandColors.greenish;

  @Deprecated('Use `colors.orange` instead')
  Color get brandOrangeColor => BrandColors.orange;

  @Deprecated('Use `colors.danger` instead')
  Color get accentRedColor =>
      _isDarkTheme ? DarkThemeColors.accentRed : LightThemeColors.accentRed;

  @Deprecated('Use `colors.success` instead')
  Color get accentGreenColor =>
      _isDarkTheme ? DarkThemeColors.accentGreen : LightThemeColors.accentGreen;

  @Deprecated('Use `colors.warning` instead')
  Color get accentYellowColor => _isDarkTheme
      ? DarkThemeColors.accentYellow
      : LightThemeColors.accentYellow;

  Color get accentLightBlueColor => _isDarkTheme
      ? DarkThemeColors.accentLightBlue
      : LightThemeColors.accentLightBlue;

  @Deprecated('Use `colors.prominent` instead')
  Color get base01Color =>
      _isDarkTheme ? DarkThemeColors.base01 : LightThemeColors.base01;

  @Deprecated('Use `colors.general` instead')
  Color get base02Color =>
      _isDarkTheme ? DarkThemeColors.base02 : LightThemeColors.base02;

  @Deprecated('Use `colors.lessProminent` instead')
  Color get base03Color =>
      _isDarkTheme ? DarkThemeColors.base03 : LightThemeColors.base03;

  @Deprecated('Use `colors.disabled` instead')
  Color get base04Color =>
      _isDarkTheme ? DarkThemeColors.base04 : LightThemeColors.base04;

  @Deprecated('Use `colors.active` instead')
  Color get base05Color =>
      _isDarkTheme ? DarkThemeColors.base05 : LightThemeColors.base05;

  @Deprecated('Use `colors.hover` instead')
  Color get base06Color =>
      _isDarkTheme ? DarkThemeColors.base06 : LightThemeColors.base06;

  @Deprecated('Use `colors.secondary` instead')
  Color get base07Color =>
      _isDarkTheme ? DarkThemeColors.base07 : LightThemeColors.base07;

  @Deprecated('Use `colors.primary` instead')
  Color get base08Color =>
      _isDarkTheme ? DarkThemeColors.base08 : LightThemeColors.base08;

  @Deprecated('Use `colors.green` instead')
  Color get greenColor =>
      _isDarkTheme ? DarkThemeColors.green : LightThemeColors.green;

  @Deprecated('Use `colors.information` instead')
  Color get accentBlueColor =>
      _isDarkTheme ? DarkThemeColors.accentBlue : LightThemeColors.accentBlue;

  @Deprecated('Use `colors.disabled` instead')
  Color get disabledColor =>
      _isDarkTheme ? DarkThemeColors.disabled : LightThemeColors.disabled;

  Colors get colors => Colors(isDark: _isDarkTheme);

  /// The style of text is generated by calling this function,
  ///
  /// The `type` argument must not be null, and if null is passed, an
  /// ArgumentError will be thrown
  ///
  /// The 'color` may be null or un-passed, in that case, a default value will
  /// be assigned to it
  TextStyle textStyle({
    required TextStyle textStyle,
    Color? color,
  }) {
    color ??= colors.prominent;

    return textStyle.copyWith(color: color);
  }
}
