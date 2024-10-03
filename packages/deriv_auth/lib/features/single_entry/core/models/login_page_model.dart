import 'package:deriv_auth/deriv_auth.dart';
import 'package:flutter/material.dart';

/// LoginPageModel class
class LoginPageModel {
  /// Initializes [LoginPageModel].
  const LoginPageModel({
    required this.onLoggedIn,
    required this.onSocialAuthButtonPressed,
    required this.welcomeLabel,
    required this.greetingLabel,
    required this.socialAuthStateHandler,
    required this.redirectURL,
    required this.onWebViewError,
    this.isForgotPasswordEnabled = true,
    this.isCreateAccountEnabled = true,
    this.isSocialAuthEnabled = true,
    this.authErrorStateHandler,
    this.onLoginError,
    this.onLoginTapped,
    this.twoFactorAuthNavigation,
  });

  /// Extension of base [AuthErrorStateHandler]. If not provided, base implementation will be used.
  final AuthErrorStateHandler? authErrorStateHandler;

  /// Callback to be called when login error occurs.
  final Function(DerivAuthErrorState)? onLoginError;

  /// Callback to be called when user is logged in.
  final Function(BuildContext, DerivAuthLoggedInState) onLoggedIn;

  /// Callback to be called when social auth button is tapped.
  /// Give access to [SocialAuthDto] for 2FA.
  final SocialAuthCallback? onSocialAuthButtonPressed;

  /// Welcome text to be displayed on login page.
  final String welcomeLabel;

  /// Whether to display social auth buttons.
  final bool isSocialAuthEnabled;

  /// Whether to display forgot password section.
  final bool isForgotPasswordEnabled;

  /// Whether to display create account section.
  final bool isCreateAccountEnabled;

  /// Social auth state handler.
  final Function(BuildContext, SocialAuthState) socialAuthStateHandler;

  /// Redirect URL for social auth.
  final String redirectURL;

  /// Callback for web view error.
  final Function(String) onWebViewError;

  /// Callback to be called when login button is tapped.
  /// Give access to email and password.
  final Function(String email, String password)? onLoginTapped;

  /// 2FA flow navigation.
  final Function(BuildContext context)? twoFactorAuthNavigation;

  /// Greeting label string for login page.
  final String greetingLabel;
}
