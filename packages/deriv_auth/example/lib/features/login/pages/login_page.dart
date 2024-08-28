import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_auth/features/single_entry/features/home/pages/home_page.dart';
import 'package:deriv_auth/features/single_entry/features/reset_pass/pages/reset_pass_page.dart';
import 'package:deriv_auth/features/single_entry/features/signup/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    BlocProvider.of<DerivAuthCubit>(context).logout();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DerivLoginLayout(
      socialAuthStateHandler: (context, _) {},
      redirectURL: 'deriv://example',
      onWebViewError: (String error) {},
      welcomeLabel: 'Welcome back!',
      onLoggedIn: (BuildContext context, DerivAuthLoggedInState state) =>
          Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      ),
      authErrorStateHandler: AuthErrorStateHandler(context: context),
      onLoginError: (_) {},
      onResetPassTapped: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ResetPassPage(),
        ),
      ),
      onSignupTapped: () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const SignupPage(),
        ),
      ),
      onSocialAuthButtonPressed: (SocialAuthDto socialAuthDto) {},
    );
  }
}
