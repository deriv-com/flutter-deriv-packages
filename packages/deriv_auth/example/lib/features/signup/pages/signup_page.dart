import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_auth/features/single_entry/features/login/pages/login_page.dart';
import 'package:deriv_auth/features/single_entry/features/signup/pages/verify_email_page.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) => DerivSignupLayout(
        socialAuthStateHandler: (context, _) => {},
        redirectURL: 'deriv://example',
        onWebViewError: (String error) {},
        authErrorStateHandler: AuthErrorStateHandler(context: context),
        signupPageLabel: 'Start trading with Deriv',
        signupPageDescription:
            'Join over 1 million traders worldwide who loves trading at Deriv.',
        onSocialAuthButtonPressed: (SocialAuthDto socialAuthDto) {},
        onSingupError: (_) {},
        onSingupEmailSent: (email) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => VerifyEmailPage(email: email),
            ),
          );
        },
        onSignupPressed: () {},
        onLoginTapped: () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
        ),
      );
}
