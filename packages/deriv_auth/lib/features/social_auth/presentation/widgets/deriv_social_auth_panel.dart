import 'package:deriv_auth/core/analytics/service/auth_tracking_mixin.dart';
import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Type definition for social auth callback
/// called when user presses social auth button.
typedef SocialAuthCallback = ValueSetter<SocialAuthDto>;

/// Panel of buttons for social authentication.
class DerivSocialAuthPanel extends StatefulWidget {
  /// Initializes [DerivSocialAuthPanel].
  const DerivSocialAuthPanel({
    required this.socialAuthStateHandler,
    required this.redirectURL,
    required this.onWebViewError,
    this.isEnabled = true,
    this.isVisible = true,
    Key? key,
    this.onPressed,
  }) : super(key: key);

  /// Whether the buttons are enabled.
  ///
  /// If the buttons are disabled, they will be greyed out.
  /// Defaults to `true`.
  final bool isEnabled;

  /// Whether the buttons are visible.
  /// Defaults to `true`. Acts as a flag to hide the buttons.
  final bool isVisible;

  /// Social auth state handler.
  final Function(BuildContext, SocialAuthState) socialAuthStateHandler;

  /// onPressed callback for social auth buttons.
  /// Gives access to the social auth token and dto.
  final SocialAuthCallback? onPressed;

  /// Redirect URL for social auth.
  final String redirectURL;

  /// Callback for web view error.
  final Function(String) onWebViewError;

  @override
  State<DerivSocialAuthPanel> createState() => _DerivSocialAuthPanelState();
}

class _DerivSocialAuthPanelState extends State<DerivSocialAuthPanel>
    with AuthTrackingMixin {
  late SocialAuthCubit _socialAuthCubit;

  @override
  void didChangeDependencies() {
    _socialAuthCubit = BlocProvider.of<SocialAuthCubit>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) => Visibility(
        visible: widget.isVisible,
        child: BlocListener<SocialAuthCubit, SocialAuthState>(
          listener: (BuildContext context, SocialAuthState state) {
            widget.socialAuthStateHandler(context, state);
          },
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: ThemeProvider.margin08),
                _buildSocialAuthButton(SocialAuthProvider.google,
                    key: const Key('social_auth_button_google')),
                const SizedBox(height: ThemeProvider.margin08),
                _buildSocialAuthButton(SocialAuthProvider.facebook,
                    key: const Key('social_auth_button_facebook')),
                const SizedBox(height: ThemeProvider.margin08),
                _buildSocialAuthButton(SocialAuthProvider.apple,
                    key: const Key('social_auth_button_apple')),
              ],
            ),
          ),
        ),
      );

  Widget _buildSocialAuthButton(
    SocialAuthProvider socialAuthProvider, {
    Key? key,
  }) =>
      InkWell(
        key: key,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: context.theme.colors.active,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                _getSocialMediaIcon(socialAuthProvider),
                package: 'deriv_auth',
              ),
              const SizedBox(width: 8),
              Text(
                socialAuthProvider.name.capitalize,
                style: context.theme.textStyle(
                  textStyle: TextStyles.body2,
                  color: context.theme.colors.prominent,
                ),
              ),
            ],
          ),
        ),
        onTap: widget.isEnabled
            ? () async {
                switch (socialAuthProvider) {
                  case SocialAuthProvider.google:
                    trackLoginWithGoogle();
                    break;
                  case SocialAuthProvider.facebook:
                    trackLoginWithFacebook();
                    break;
                  case SocialAuthProvider.apple:
                    trackLoginWithApple();
                    break;
                  default:
                    break;
                }
                final List<SocialAuthProviderModel>? socialAuthProviders =
                    await _socialAuthCubit.getSocialAuthProviders();

                if (socialAuthProviders != null) {
                  await _socialAuthCubit.selectSocialLoginProvider(
                    selectedSocialAuthProvider: socialAuthProvider,
                    redirectUrl: widget.redirectURL,
                    onWebViewError: widget.onWebViewError,
                    onRedirectUrlReceived: (SocialAuthDto socialAuthDto) {
                      widget.onPressed?.call(socialAuthDto);

                      BlocProvider.of<DerivAuthCubit>(context)
                          .socialAuth(socialAuthDto: socialAuthDto);
                    },
                  );
                }
              }
            : null,
      );

  String _getSocialMediaIcon(SocialAuthProvider socialAuthProvider) =>
      'assets/icons/ic_${socialAuthProvider.name}.svg';

  @override
  void dispose() {
    super.dispose();
  }
}
