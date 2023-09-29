import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:deriv_auth/features/social_auth/cubit/social_auth_state.dart';
import 'package:deriv_auth/features/social_auth/models/social_auth_provider_model.dart';
import 'package:deriv_auth/features/social_auth/services/base_social_auth_service.dart';
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
}
