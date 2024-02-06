import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/widgets/interaction.dart';
import 'package:flutter/material.dart';

/// Button with base color
class SecondaryButton extends StatelessWidget {
  /// Constructor
  const SecondaryButton({
    required this.child,
    required this.onPressed,
    this.isEnabled = true,
    Key? key,
  }) : super(key: key);

  /// Is button enabled
  final bool isEnabled;

  /// Child Widget for the Button
  final Widget child;

  /// Callback for button when pressed
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) => Interaction(
        isEnabled: isEnabled,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              Colors.transparent,
            ),
            shadowColor: MaterialStateProperty.all<Color>(
              Colors.transparent,
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                side: BorderSide(
                  color: context.theme.colors.hover,
                ),
                borderRadius:
                    BorderRadius.circular(ThemeProvider.borderRadius04),
              ),
            ),
          ),
          child: child,
          onPressed: onPressed,
        ),
      );
}
