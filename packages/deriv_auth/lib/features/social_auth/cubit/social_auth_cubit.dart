import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_http_client/deriv_http_client.dart';

/// This Cubit is the single source of truth for social authentication.
class SocialAuthCubit extends Cubit<SocialAuthState> {
  /// Initialize a [SocialAuthCubit].
  SocialAuthCubit({
    required this.socialAuthService,
    BaseSocialWebViewService? socialAuthWebViewService,
  })  : _socialAuthWebViewService =
            socialAuthWebViewService ?? SocialAuthWebViewService(),
        super(SocialAuthInitialState()) {
    getSocialAuthProviders();
  }

  /// [BaseSocialAuthService] handles all social authentication logic of cubit.
  final BaseSocialAuthService socialAuthService;

  final BaseSocialWebViewService _socialAuthWebViewService;

  /// List of social auth providers.
  List<SocialAuthProviderModel> socialAuthProviders =
      <SocialAuthProviderModel>[];

  /// Get list of social auth providers.
  Future<void> getSocialAuthProviders() async {
    emit(SocialAuthLoadingState());

    try {
      socialAuthProviders = await socialAuthService.getSocialAuthProviders();

      emit(SocialAuthLoadedState(socialAuthProviders: socialAuthProviders));
    } on HTTPClientException catch (e) {
      emit(SocialAuthErrorState(message: e.message));
    } on Exception catch (e) {
      log(e.toString());
      emit(SocialAuthErrorState());
    }
  }

  /// Handles opening social auth web view based on [SocialAuthProviderModel.authUrl].
  /// to receeiving redirect url.
  ///
  /// [selectedSocialAuthProvider] is the selected social auth provider.
  /// [redirectUrl] is the redirect url for social auth.
  /// [onWebViewError] is the callback for web view error.
  /// [onRedirectUrlReceived] is the callback on redirect url received from social auth provider.
  Future<void> selectSocialLoginProvider({
    required SocialAuthProvider selectedSocialAuthProvider,
    required String redirectUrl,
    required Function(String) onWebViewError,
    required Function(SocialAuthDto) onRedirectUrlReceived,
  }) async {
    try {
      final List<SocialAuthProviderModel> socialAuthProviderModel =
          socialAuthProviders
              .where(
                (SocialAuthProviderModel socialAuthProvider) =>
                    socialAuthProvider.name == selectedSocialAuthProvider,
              )
              .toList();

      if (socialAuthProviderModel.isNotEmpty) {
        final SocialAuthProviderModel socialAuthProvider =
            socialAuthProviderModel.first;

        await _socialAuthWebViewService.handleSocialAuth(
          socialAuthProviderModel: socialAuthProviderModel.first,
          socialAuthUriHandler: (
              {required String code, required String state}) {
            final SocialAuthDto socialAuthDto = SocialAuthDto(
              nonce: socialAuthProvider.nonce,
              state: socialAuthProvider.state,
              codeVerifier: socialAuthProvider.codeVerifier,
              code: code,
              callbackState: state,
              provider: socialAuthProvider.name,
            );
            onRedirectUrlReceived(socialAuthDto);
          },
          redirectURL: redirectUrl,
          onError: onWebViewError,
        );

        emit(SocialAuthLoadedState(
          socialAuthProviders: socialAuthProviders,
        ));
      } else {
        emit(SocialAuthErrorState());
      }
    } on Exception catch (e) {
      log(e.toString());
      emit(SocialAuthErrorState());
    }
  }
}
