import 'package:deriv_auth/features/social_auth/models/social_auth_provider_model.dart';

/// Abstract class to define all social authentication-related state.
abstract class SocialAuthState {}

/// Initial state of [SocialAuthCubit].
class SocialAuthInitialState extends SocialAuthState {}

/// Loading state of [SocialAuthCubit].
class SocialAuthLoadingState extends SocialAuthState {}

/// Error state of [SocialAuthCubit].
class SocialAuthErrorState extends SocialAuthState {
  /// Initializes a [SocialAuthErrorState].
  SocialAuthErrorState({
    this.message,
  });

  /// Error message.
  final String? message;
}

/// Loaded state of [SocialAuthCubit].
class SocialAuthLoadedState extends SocialAuthState {
  /// Initializes a [SocialAuthLoadedState].
  SocialAuthLoadedState({
    required this.socialAuthProviders,
    this.selectedSocialAuthProvider,
  });

  /// List of social auth providers.
  final List<SocialAuthProviderModel> socialAuthProviders;

  /// Selected social auth provider model.
  final SocialAuthProviderModel? selectedSocialAuthProvider;
}
