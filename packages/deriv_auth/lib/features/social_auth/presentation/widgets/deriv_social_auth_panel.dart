import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../helpers/social_web_view_helper.dart';

/// Type definition for social auth callback
/// called when user presses social auth button.
typedef SocialAuthCallback = ValueSetter<SocialAuthDto>;

/// Panel of buttons for social authentication.
class DerivSocialAuthPanel extends StatefulWidget {
  /// Initializes [DerivSocialAuthPanel].
  const DerivSocialAuthPanel({
    required this.onSocialAuthLoadingState,
    required this.onSocialAuthErrorState,
    required this.onSocialAuthLoadedState,
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

  /// Callback for social auth loading state.
  final VoidCallback onSocialAuthLoadingState;

  /// Callback for social auth error state.
  final Function(String? error) onSocialAuthErrorState;

  /// Callback for social auth loaded state.
  final VoidCallback onSocialAuthLoadedState;

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

class _DerivSocialAuthPanelState extends State<DerivSocialAuthPanel> {
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
            _handleSocialAuthState(state);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildSocialAuthButton(SocialAuthProvider.apple),
              const SizedBox(width: ThemeProvider.margin24),
              _buildSocialAuthButton(SocialAuthProvider.google),
              const SizedBox(width: ThemeProvider.margin24),
              _buildSocialAuthButton(SocialAuthProvider.facebook),
            ],
          ),
        ),
      );

  Widget _buildSocialAuthButton(SocialAuthProvider socialAuthProvider) =>
      IconButton(
        padding: EdgeInsets.zero,
        iconSize: ThemeProvider.iconSize40,
        icon: Opacity(
          opacity: getOpacity(isEnabled: widget.isEnabled),
          child: SvgPicture.asset(
            _getSocialMediaIcon(socialAuthProvider),
            package: 'deriv_auth',
          ),
        ),
        onPressed: widget.isEnabled
            ? () {
                _socialAuthCubit.selectSocialLoginProvider(socialAuthProvider);
              }
            : null,
      );

  String _getSocialMediaIcon(SocialAuthProvider socialAuthProvider) =>
      'assets/icons/ic_${socialAuthProvider.name}.svg';

  void _handleSocialAuthState(SocialAuthState state) {
    if (state is SocialAuthLoadedState) {
      widget.onSocialAuthLoadedState();

      if (state.selectedSocialAuthProvider != null) {
        final SocialAuthProviderModel selectedSocialAuthProviderModel =
            state.selectedSocialAuthProvider!;

        handleSocialAuth(
          redirectURL: widget.redirectURL,
          socialAuthProviderModel: selectedSocialAuthProviderModel,
          socialAuthUriHandler: (Uri uri) {
            final Map<String, String> callbackData =
                fetchCallbackState(redirectUri: uri);

            _socialAuthDeepLinkHandler(
              socialAuthProvider: selectedSocialAuthProviderModel,
              code: callbackData['code']!,
              callbackState: callbackData['callbackState']!,
            );
          },
          onError: widget.onWebViewError,
        );
      }
    }
    if (state is SocialAuthLoadingState) {
      widget.onSocialAuthLoadingState();
    }
    if (state is SocialAuthErrorState) {
      widget.onSocialAuthErrorState(state.message);
    }
  }

  void _socialAuthDeepLinkHandler({
    required SocialAuthProviderModel socialAuthProvider,
    required String code,
    required String callbackState,
  }) {
    final SocialAuthDto socialAuthDto = SocialAuthDto(
      nonce: socialAuthProvider.nonce,
      state: socialAuthProvider.state,
      codeVerifier: socialAuthProvider.codeVerifier,
      code: code,
      callbackState: callbackState,
      provider: socialAuthProvider.name,
    );

    widget.onPressed?.call(
      socialAuthDto,
    );

    BlocProvider.of<DerivAuthCubit>(context)
        .socialAuth(socialAuthDto: socialAuthDto);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
