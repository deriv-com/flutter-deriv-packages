import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/presentation/widgets/interaction.dart';
import 'package:flutter/material.dart';

/// Button with brand color
class PrimaryButton extends StatelessWidget {
  /// Constructor
  const PrimaryButton({
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
              context.theme.colors.coral,
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  ThemeProvider.borderRadius04,
                ),
              ),
            ),
          ),
          child: child,
          onPressed: onPressed,
        ),
      );
}
