import 'package:deriv_auth/features/social_auth/models/social_auth_provider_model.dart';

/// Interface to define all social authentication-related functionality.
abstract class BaseSocialAuthService {
  /// Get list of social auth providers.
  Future<List<SocialAuthProviderModel>> getSocialAuthProviders();
}
