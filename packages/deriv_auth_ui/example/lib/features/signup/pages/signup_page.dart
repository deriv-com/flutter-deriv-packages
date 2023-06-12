import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_auth_ui/deriv_auth_ui.dart';
import 'package:example/features/login/pages/login_page.dart';
import 'package:example/features/signup/repositories/example_referral_repository.dart';
import 'package:example/features/signup/repositories/example_signup_repository.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final signupCubit = DerivSignupCubit(
    service: DerivSignupService(repository: ExampleSignupRepository()),
    referralService: ExampleReferralRepository(),
  );
  @override
  Widget build(BuildContext context) => DerivSignupLayout(
        signupCubit: signupCubit,
        onSocialAuthButtonPressed: (_) {},
        onSingupError: (_) {},
        onSingupEmailSent: () {},
        onSignupPressed: () {},
        onLoginTapped: () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
        ),
      );
}
