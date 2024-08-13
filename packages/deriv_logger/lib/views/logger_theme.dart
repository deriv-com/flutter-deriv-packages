import 'package:flutter/material.dart';

/// Theme for debug.
class DebugOverlayTheme {
  /// Creates a mini theme for debug UI.
  const DebugOverlayTheme({
    this.primaryColor = Colors.green,
    this.backgroundColor = Colors.white,
    this.cardColor = Colors.white,
    this.headerTextStyle = const TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.w600,
      fontFamily: 'Monospace',
    ),
    this.bodyTextStyle = const TextStyle(
      color: Colors.black,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontFamily: 'Monospace',
    ),
    this.subtitleTextStyle = const TextStyle(
      color: Colors.black54,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      fontFamily: 'Monospace',
    ),
  });

  /// Primary color for the ui.
  final Color primaryColor;

  /// Background color
  final Color backgroundColor;

  ///color of the card.
  final Color cardColor;

  /// Text style for the header.
  final TextStyle headerTextStyle;

  /// Body text style
  final TextStyle bodyTextStyle;

  /// subtitle text style.
  final TextStyle subtitleTextStyle;
}

final List<BoxShadow> defaultShadow = [
  BoxShadow(
    blurRadius: 12,
    offset: const Offset(0, 2),
    color: Colors.black.withOpacity(0.1),
  )
];
