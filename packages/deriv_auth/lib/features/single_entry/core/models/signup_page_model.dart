import 'package:deriv_auth/deriv_auth.dart';
import 'package:flutter/foundation.dart' show VoidCallback;
import 'package:flutter/material.dart';

/// Sign-up page model
class SignupPageModel {
  /// Constructor [SignupPageModel]
  SignupPageModel({
    required this.verificationCode,
    required this.signupPageLable,
    required this.signupPageDescription,
    required this.onSingupError,
    required this.isSocialAuthEnabled,
    required this.socialAuthStateHandler,
    required this.redirectURL,
    required this.onWebViewError,
    required this.handleFlowFromPackage,
    required this.residences,
    this.onSignupPressed,
    this.onSocialAuthButtonPressed,
    this.affiliateToken,
  });

  /// verification code
  final String verificationCode;

  /// affiliate token
  final String? affiliateToken;

  /// Callback to be called when signup button is pressed.
  final VoidCallback? onSignupPressed;

  /// Callback to be called when signup error occurs.
  final Function(DerivSignupErrorState) onSingupError;

  /// sing-up page label
  final String signupPageLable;

  /// sign-up page description
  final String signupPageDescription;

  /// is social auth enabled
  final bool isSocialAuthEnabled;

  /// Social auth state handler.
  final Function(BuildContext, SocialAuthState) socialAuthStateHandler;

  /// Redirect URL for social auth.
  final String redirectURL;

  /// Callback for web view error.
  final Function(String) onWebViewError;

  /// Callback to be called when social auth button is tapped.
  /// Give access to [SocialAuthDto] for 2FA.
  final SocialAuthCallback? onSocialAuthButtonPressed;

  /// Handle flow from package.
  final bool handleFlowFromPackage;

  /// List of residences to be shown.
  final Future<List<DerivResidenceModel>> residences;
}
