import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_http_client/deriv_http_client.dart';

/// This Cubit is the single source of truth for social authentication.
class SocialAuthCubit extends Cubit<SocialAuthState> {
  /// Initialize a [SocialAuthCubit].
  SocialAuthCubit({required this.socialAuthService})
      : super(SocialAuthInitialState());

  /// [BaseSocialAuthService] handles all social authentication logic of cubit.
  final BaseSocialAuthService socialAuthService;

  /// Get list of social auth providers.
  Future<void> getSocialAuthProviders() async {
    emit(SocialAuthLoadingState());

    try {
      final List<SocialAuthProviderModel> socialAuthProviders =
          await socialAuthService.getSocialAuthProviders();

      emit(SocialAuthLoadedState(socialAuthProviders: socialAuthProviders));
    } on HTTPClientException catch (e) {
      emit(SocialAuthErrorState(message: e.message));
    } on Exception catch (e) {
      log(e.toString());
      emit(SocialAuthErrorState());
    }
  }

  /// Emits [SocialAuthLoadedState] with selected social auth provider model.
  Future<void> selectSocialLoginProvider(
      SocialAuthProvider selectedSocialAuthProvider) async {
    try {
      final List<SocialAuthProviderModel> socialAuthProviders =
          await socialAuthService.getSocialAuthProviders();

      final List<SocialAuthProviderModel> socialAuthProviderModel =
          socialAuthProviders
              .where(
                (SocialAuthProviderModel socialAuthProvider) =>
                    socialAuthProvider.name == selectedSocialAuthProvider,
              )
              .toList();

      if (socialAuthProviderModel.isNotEmpty) {
        emit(SocialAuthLoadedState(
          socialAuthProviders:
              (state as SocialAuthLoadedState).socialAuthProviders,
          selectedSocialAuthProvider: socialAuthProviderModel.first,
        ));
      } else {
        emit(SocialAuthErrorState(message: 'Social Auth Provider not found'));
      }
    } on Exception catch (e) {
      log(e.toString());
      emit(SocialAuthErrorState(message: e.toString()));
    }
  }
}
