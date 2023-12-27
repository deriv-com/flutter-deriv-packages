import 'package:deriv_auth/features/signup/presentation/layouts/deriv_signup_layout.dart';
import 'package:example/core/example_auth_error_state_handler.dart';
import 'package:example/features/login/pages/login_page.dart';
import 'package:example/features/signup/pages/verify_email_page.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) => DerivSignupLayout(
        authErrorStateHandler: ExampleAuthErrorStateHandler(context: context),
        signupPageLabel: 'Start trading with Deriv',
        signupPageDescription:
            'Join over 1 million traders worldwide who loves trading at Deriv.',
        onSocialAuthButtonPressed: (_) {},
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
