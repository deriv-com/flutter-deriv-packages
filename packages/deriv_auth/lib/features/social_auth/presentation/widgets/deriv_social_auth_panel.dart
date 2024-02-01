import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../helpers/social_web_view_helper.dart';

/// Type definition for social auth callback
/// called when user presses social auth button.
typedef SocialAuthCallback = Function({
  String? oneAllConnectionToken,
  SocialAuthDto? socialAuthDto,
});

/// Panel of buttons for social authentication.
class DerivSocialAuthPanel extends StatefulWidget {
  /// Initializes [DerivSocialAuthPanel].
  const DerivSocialAuthPanel({
    required this.onSocialAuthLoadingState,
    required this.onSocialAuthErrorState,
    required this.onSocialAuthLoadedState,
    required this.redirectURL,
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

  @override
  State<DerivSocialAuthPanel> createState() => _DerivSocialAuthPanelState();
}

class _DerivSocialAuthPanelState extends State<DerivSocialAuthPanel> {
  SocialAuthProvider? _selectedSocialAuthProvider;

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
                _selectedSocialAuthProvider = socialAuthProvider;
                _socialAuthCubit.getSocialAuthProviders();
              }
            : null,
      );

  String _getSocialMediaIcon(SocialAuthProvider socialAuthProvider) =>
      'assets/icons/ic_${socialAuthProvider.name}.svg';

  void _handleSocialAuthState(SocialAuthState state) {
    if (state is SocialAuthLoadedState) {
      widget.onSocialAuthLoadedState();

      /// As a fallback plan of in-house service, backend is going to send empty list of
      /// social auth providers if something goes wrong. In that case, we should
      /// be using one-all service.This will be removed once the in-house service is
      /// stable.
      if (state.socialAuthProviders.isEmpty) {
        _oneAllSocialAuth();
      } else {
        _socialAuth(state.socialAuthProviders);
      }
    }
    if (state is SocialAuthLoadingState) {
      widget.onSocialAuthLoadingState();
    }
    if (state is SocialAuthErrorState) {
      widget.onSocialAuthErrorState(state.message);
    }
  }

  /// Handles the social authentication with OneAll service.
  void _oneAllSocialAuth() {
    handleOneAllSocialAuth(
      socialAuthProvider: _selectedSocialAuthProvider!,
      onClosed: () => _selectedSocialAuthProvider = null,
      redirectURL: widget.redirectURL,
      uriHandler: (Uri uri) {
        final String connectionToken =
            fetchConnectionToken(oneAllRedirectUri: uri);

        _oneAllDeepLinkHandler(
          oneAllConnectionToken: connectionToken,
          socialAuthProvider: _selectedSocialAuthProvider!,
        );
      },
    );
  }

  void _oneAllDeepLinkHandler({
    required String oneAllConnectionToken,
    required SocialAuthProvider socialAuthProvider,
  }) {
    widget.onPressed?.call(
      oneAllConnectionToken: oneAllConnectionToken,
      socialAuthDto: null,
    );
    context.read<DerivAuthCubit>().socialLogin(
          oneAllConnectionToken: oneAllConnectionToken,
          signupProvider: socialAuthProvider.name,
        );
  }

  /// Handles the social authentication with in-house social auth service.
  void _socialAuth(List<SocialAuthProviderModel> socialAuthProviders) {
    final List<SocialAuthProviderModel> socialAuthProviderModel =
        socialAuthProviders
            .where(
              (SocialAuthProviderModel socialAuthProvider) =>
                  socialAuthProvider.name == _selectedSocialAuthProvider,
            )
            .toList();

    if (socialAuthProviderModel.isEmpty) {
      _oneAllSocialAuth();
    } else {
      handleSocialAuth(
        redirectURL: widget.redirectURL,
        socialAuthProviderModel: socialAuthProviderModel.first,
        onClosed: () => _selectedSocialAuthProvider = null,
        socialAuthUriHandler: (Uri uri) {
          final Map<String, String> callbackData =
              fetchCallbackState(redirectUri: uri);

          _socialAuthDeepLinkHandler(
            socialAuthProvider: socialAuthProviderModel.first,
            code: callbackData['code']!,
            callbackState: callbackData['callbackState']!,
          );
        },
      );
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
      oneAllConnectionToken: null,
      socialAuthDto: socialAuthDto,
    );

    BlocProvider.of<DerivAuthCubit>(context)
        .socialAuth(socialAuthDto: socialAuthDto);
  }

  @override
  void dispose() {
    _selectedSocialAuthProvider = null;
    super.dispose();
  }
}
