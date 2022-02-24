import 'package:flutter/material.dart';

/// Extension methods for [PageController].
extension pageControllerExtension on PageController {
  /// Animate between pages in the PageView widget.
  void animateToIndex(int index) => animateToPage(
        index,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
      );
}
