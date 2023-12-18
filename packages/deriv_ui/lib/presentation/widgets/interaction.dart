import 'package:deriv_ui/utils/color_helper.dart';
import 'package:flutter/material.dart';

/// Widget that disables the interaction with its child.
class Interaction extends StatelessWidget {
  /// Initializes the class.
  const Interaction({
    required this.child,
    required this.isEnabled,
  });

  /// Child widget.
  final Widget child;

  /// Whether the child is enabled or not.
  final bool isEnabled;

  @override
  Widget build(BuildContext context) => AbsorbPointer(
        absorbing: !isEnabled,
        child: Opacity(
          opacity: getOpacity(isEnabled: isEnabled),
          child: child,
        ),
      );
}
