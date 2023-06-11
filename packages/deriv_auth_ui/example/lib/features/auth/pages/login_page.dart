import 'package:deriv_auth/features/auth/cubit/deriv_auth_cubit.dart';
import 'package:deriv_auth_ui/deriv_auth_ui.dart';
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
      authCubit: BlocProvider.of<DerivAuthCubit>(context),
      onLoggedIn: (_) {},
      onLoginError: (_) {},
      onResetPassTapped: () {},
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
