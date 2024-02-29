import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_auth/features/single_entry/core/auth_data.dart';
import 'package:deriv_auth/features/single_entry/features/login/pages/login_page.dart';
import 'package:deriv_auth/features/single_entry/features/signup/pages/verify_email_page.dart';
import 'package:flutter/material.dart';

/// Sing up page
class SignupPage extends StatefulWidget {
  /// Constructor for sign up page
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) => DerivSignupLayout(
        authErrorStateHandler: AuthErrorStateHandler(context: context),
        signupPageLabel: AuthData().data.signupPageModel.signupPageLable,
        signupPageDescription:
            AuthData().data.signupPageModel.signupPageDescription,
        onSocialAuthButtonPressed:
            AuthData().data.signupPageModel.onSocialAuthButtonPressed,
        onSingupError: AuthData().data.signupPageModel.onSingupError,
        onSingupEmailSent: (String email) => Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (BuildContext context) => VerifyEmailPage(
              email: email,
            ),
          ),
        ),
        onSignupPressed: AuthData().data.signupPageModel.onSignupPressed,
        isSocialAuthEnabled:
            AuthData().data.signupPageModel.isSocialAuthEnabled,
        onLoginTapped: () => Navigator.of(context).pushReplacement(
          MaterialPageRoute<void>(
            builder: (BuildContext context) => const LoginPage(),
          ),
        ),
        socialAuthStateHandler:
            AuthData().data.signupPageModel.socialAuthStateHandler,
        redirectURL: AuthData().data.signupPageModel.redirectURL,
        onWebViewError: AuthData().data.signupPageModel.onWebViewError,
      );
}
