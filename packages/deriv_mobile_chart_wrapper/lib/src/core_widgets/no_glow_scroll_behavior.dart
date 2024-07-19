import 'package:flutter/material.dart';

/// A custom scroll behavior that removes the glowing effect when scrolling.
class NoGlowScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child; // This effectively removes the glow effect
  }
}
