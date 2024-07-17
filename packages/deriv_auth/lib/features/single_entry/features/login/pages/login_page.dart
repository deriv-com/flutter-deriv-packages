import 'package:deriv_auth/features/auth/cubit/deriv_auth_cubit.dart';
import 'package:deriv_auth/features/login/presentation/layouts/deriv_login_layout.dart';
import 'package:deriv_auth/features/single_entry/core/auth_data.dart';
import 'package:deriv_auth/features/single_entry/features/reset_pass/pages/reset_pass_page.dart';
import 'package:deriv_auth/features/single_entry/features/signup/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Login page
class LoginPage extends StatefulWidget {
  /// Constructor [LoginPage]
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
  Widget build(BuildContext context) => DerivLoginLayout(
        onLoginTapped: AuthData().data.loginPageModel.onLoginTapped,
        welcomeLabel: AuthData().data.loginPageModel.welcomeLabel,
        onLoggedIn: AuthData().data.loginPageModel.onLoggedIn,
        authErrorStateHandler:
            AuthData().data.loginPageModel.authErrorStateHandler,
        onLoginError: AuthData().data.loginPageModel.onLoginError,
        onResetPassTapped: () => Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => const ResetPassPage(),
          ),
        ),
        onSignupTapped: () => Navigator.pushReplacement(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => const SignupPage(),
          ),
        ),
        onSocialAuthButtonPressed:
            AuthData().data.loginPageModel.onSocialAuthButtonPressed,
        socialAuthStateHandler:
            AuthData().data.loginPageModel.socialAuthStateHandler,
        redirectURL: AuthData().data.loginPageModel.redirectURL,
        onWebViewError: AuthData().data.loginPageModel.onWebViewError,
        twoFactorAuthNavigation:
            AuthData().data.loginPageModel.twoFactorAuthNavigation,
      );
}
