import 'package:deriv_ui/extension/context_extension.dart';
import 'package:deriv_ui/theme/text_styles.dart';
import 'package:deriv_ui/theme/theme_provider.dart';
import 'package:flutter/material.dart';

/// The divider between in-app authentication and social authentication.
class SocialAuthDivider extends StatelessWidget {
  /// Initializes the class.
  const SocialAuthDivider({
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
                color: context.theme.base03Color,
              ),
            ),
          ),
          _buildDivider(context),
        ],
      );

  Widget _buildDivider(BuildContext context) => Expanded(
        child: Divider(
          thickness: 1,
          color: context.theme.base06Color,
        ),
      );
}
