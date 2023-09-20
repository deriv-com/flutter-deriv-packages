import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Panel of buttons for social authentication.
class DerivSocialAuthPanel extends StatelessWidget {
  /// Initializes [DerivSocialAuthPanel].
  const DerivSocialAuthPanel({
    required this.onSocialAuthButtonPressed,
    this.isEnabled = true,
    Key? key,
  }) : super(key: key);

  /// Whether the buttons are enabled.
  ///
  /// If the buttons are disabled, they will be greyed out.
  /// Defaults to `true`.
  final bool isEnabled;

  /// onPressed callback for social auth buttons.
  final void Function(SocialAuthProvider) onSocialAuthButtonPressed;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildSocialAuthButton(SocialAuthProvider.apple),
          const SizedBox(width: ThemeProvider.margin24),
          _buildSocialAuthButton(SocialAuthProvider.google),
          const SizedBox(width: ThemeProvider.margin24),
          _buildSocialAuthButton(SocialAuthProvider.facebook),
        ],
      );

  Widget _buildSocialAuthButton(SocialAuthProvider socialAuthProvider) =>
      IconButton(
        padding: EdgeInsets.zero,
        iconSize: ThemeProvider.iconSize40,
        icon: Opacity(
          opacity: getOpacity(isEnabled: isEnabled),
          child: SvgPicture.asset(
            _getSocialMediaIcon(socialAuthProvider),
            package: 'deriv_auth_ui',
          ),
        ),
        onPressed: isEnabled
            ? () => onSocialAuthButtonPressed(socialAuthProvider)
            : null,
      );

  String _getSocialMediaIcon(SocialAuthProvider socialAuthProvider) =>
      'assets/icons/ic_${socialAuthProvider.name}.svg';
}
