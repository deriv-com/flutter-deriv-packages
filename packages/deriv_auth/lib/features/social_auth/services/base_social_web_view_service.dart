import 'package:deriv_auth/deriv_auth.dart';

/// Type definition for social auth uri handler.
typedef SocialAuthUriHandler = void Function(
    {required String code, required String state});

/// Interface to define all social authentication web view-related functionality.
abstract class BaseSocialWebViewService {
  /// Handle social authentication web view.
  Future<void> handleSocialAuth({
    required SocialAuthProviderModel socialAuthProviderModel,
    required SocialAuthUriHandler socialAuthUriHandler,
    required String redirectURL,
    required Function(String) onError,
  });
}
