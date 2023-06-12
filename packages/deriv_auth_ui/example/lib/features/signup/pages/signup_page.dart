import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_auth_ui/deriv_auth_ui.dart';
import 'package:example/features/login/pages/login_page.dart';
import 'package:example/features/signup/pages/verify_email_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) => DerivSignupLayout(
        signupCubit: context.read<DerivSignupCubit>(),
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
