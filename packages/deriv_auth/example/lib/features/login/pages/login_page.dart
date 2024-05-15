import 'package:deriv_auth/features/auth/cubit/deriv_auth_cubit.dart';
import 'package:deriv_auth_ui/deriv_auth_ui.dart';
import 'package:example/core/example_auth_error_state_handler.dart';
import 'package:example/features/home/pages/home_page.dart';
import 'package:example/features/reset_pass/pages/reset_pass_page.dart';
import 'package:example/features/signup/pages/signup_page.dart';
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
      welcomeLabel: 'Welcome back!',
      greetingLabel:
          'Log in to your Deriv account to start trading and investing.',
      onLoggedIn: (_) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      ),
      authErrorStateHandler: ExampleAuthErrorStateHandler(context: context),
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
      onSocialAuthButtonPressed: (_) {},
    );
  }
}
