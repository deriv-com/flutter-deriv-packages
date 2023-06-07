import 'package:deriv_theme/deriv_theme.dart';
import 'package:flutter/material.dart';

/// The divider between in-app authentication and social authentication.
class DerivSocialAuthDivider extends StatelessWidget {
  /// Initializes the class.
  const DerivSocialAuthDivider({
    required this.label,
    Key? key,
  }) : super(key: key);

  /// The label that displayed in the divider.
  final String label;

  @override
  Widget build(BuildContext context) => Row(
        children: <Widget>[
          _buildDivider(context),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: ThemeProvider.margin08),
            child: Text(
              label,
              style: context.theme.textStyle(
                textStyle: TextStyles.body1,
                color: context.theme.colors.lessProminent,
              ),
            ),
          ),
          _buildDivider(context),
        ],
      );

  Widget _buildDivider(BuildContext context) => Expanded(
        child: Divider(
          thickness: 1,
          color: context.theme.colors.hover,
        ),
      );
}
