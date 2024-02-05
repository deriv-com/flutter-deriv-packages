import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_http_client/deriv_http_client.dart';

/// This Cubit is the single source of truth for social authentication.
class SocialAuthCubit extends Cubit<SocialAuthState> {
  /// Initialize a [SocialAuthCubit].
  SocialAuthCubit({required this.socialAuthService})
      : super(SocialAuthInitialState()) {
    getSocialAuthProviders();
  }

  /// [BaseSocialAuthService] handles all social authentication logic of cubit.
  final BaseSocialAuthService socialAuthService;

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

  /// Emits [SocialAuthLoadedState] with selected social auth provider model.
  Future<void> selectSocialLoginProvider(
      SocialAuthProvider selectedSocialAuthProvider) async {
    try {
      emit(SocialAuthLoadingState());

      final List<SocialAuthProviderModel> socialAuthProviderModel =
          socialAuthProviders
              .where(
                (SocialAuthProviderModel socialAuthProvider) =>
                    socialAuthProvider.name == selectedSocialAuthProvider,
              )
              .toList();

      if (socialAuthProviderModel.isNotEmpty) {
        emit(SocialAuthLoadedState(
          socialAuthProviders: socialAuthProviders,
          selectedSocialAuthProvider: socialAuthProviderModel.first,
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
