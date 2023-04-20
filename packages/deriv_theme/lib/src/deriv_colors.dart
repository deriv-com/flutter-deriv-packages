// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

/// Holds deriv design system colors, based on passed [brightness].
class DerivColors {
  const DerivColors(this.brightness);

  final Brightness brightness;

  bool get isDarkTheme => brightness == Brightness.dark;

  Color get brandCoralColor => DerivBrandColors.coral;
  Color get brandBlueColor => DerivBrandColors.blue;
  Color get brandOrangeColor => DerivBrandColors.orange;

  Color get danger =>
      isDarkTheme ? DerivDarkColors.danger : DerivLightColors.danger;

  Color get success =>
      isDarkTheme ? DerivDarkColors.success : DerivLightColors.success;

  Color get warning =>
      isDarkTheme ? DerivDarkColors.warning : DerivLightColors.warning;

  Color get information =>
      isDarkTheme ? DerivDarkColors.information : DerivLightColors.information;
  Color get hover =>
      isDarkTheme ? DerivDarkColors.hover : DerivLightColors.hover;

  Color get prominent =>
      isDarkTheme ? DerivDarkColors.prominent : DerivLightColors.prominent;

  Color get general =>
      isDarkTheme ? DerivDarkColors.general : DerivLightColors.general;

  Color get lessProminent => isDarkTheme
      ? DerivDarkColors.lessProminent
      : DerivLightColors.lessProminent;

  Color get disabled =>
      isDarkTheme ? DerivDarkColors.disabled : DerivLightColors.disabled;

  Color get active =>
      isDarkTheme ? DerivDarkColors.active : DerivLightColors.active;

  Color get secondaryBackground => isDarkTheme
      ? DerivDarkColors.secondaryBackground
      : DerivLightColors.secondaryBackground;

  Color get primaryBackground => isDarkTheme
      ? DerivDarkColors.primaryBackground
      : DerivLightColors.primaryBackground;
}

/// Deriv branding colors, these colors should not be changed. It can be called
/// as [DerivBrandColors.coral]
class DerivBrandColors {
  static const Color blue = Color(0xFF85ACB0);
  static const Color coral = Color(0xFFFF444F);
  static const Color night = Color(0xFF2A3052);
  static const Color orange = Color(0xFFFF6444);
}

/// These colors suits the dark theme of Deriv
class DerivDarkColors {
  static const Color active = Color(0xFF323738);
  static const Color danger = Color(0xFFCC2E3D);
  static const Color disabled = Color(0xFF3E3E3E);
  static const Color general = Color(0xFFC2C2C2);
  static const Color hover = Color(0xFF242828);
  static const Color information = Color(0xFF377CFC);
  static const Color lessProminent = Color(0xFF6E6E6E);
  static const Color primaryBackground = Color(0xFF0E0E0E);
  static const Color prominent = Color(0xFFFFFFFF);
  static const Color secondaryBackground = Color(0xFF151717);
  static const Color success = Color(0xFF00A79E);
  static const Color warning = Color(0xFFFFAD3A);
}

/// These colors suits the light theme of Deriv
class DerivLightColors {
  static const Color active = Color(0xFFD6DADB);
  static const Color danger = Color(0xFFEC3F3F);
  static const Color disabled = Color(0xFFD6D6D6);
  static const Color general = Color(0xFF333333);
  static const Color hover = Color(0xFFE6E9E9);
  static const Color information = Color(0xFF377CFC);
  static const Color lessProminent = Color(0xFF999999);
  static const Color primaryBackground = Color(0xFFFFFFFF);
  static const Color prominent = Color(0xFF333333);
  static const Color secondaryBackground = Color(0xFFF2F3F4);
  static const Color success = Color(0xFF4BB4B3);
  static const Color warning = Color(0xFFFFAD3A);
}
