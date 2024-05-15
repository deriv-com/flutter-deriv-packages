import 'package:deriv_auth/features/auth/cubit/deriv_auth_cubit.dart';
import 'package:deriv_auth/features/reset_password/cubit/reset_password_cubit.dart';
import 'package:deriv_auth/features/signup/cubit/signup_cubit.dart';
import 'package:deriv_auth/features/social_auth/cubit/social_auth_cubit.dart';
import 'package:deriv_language_selector/deriv_language_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A wrapper class for clients apps to provide auth related cubits to the context.
class AuthProvider extends StatelessWidget {
  /// Constructor [AuthProvider]
  const AuthProvider({
    required this.widget,
    required this.derivAuthCubit,
    required this.socialAuthCubit,
    required this.derivResetPassCubit,
    required this.derivSignupCubit,
    required this.languageCubit,
  });

  /// Child widget
  final Widget widget;

  /// Instance of Auth Cubit
  final DerivAuthCubit derivAuthCubit;

  /// Instance of Social Auth Cubit
  final SocialAuthCubit socialAuthCubit;

  /// Instance of Reset Pass Cubit
  final DerivResetPassCubit derivResetPassCubit;

  /// Instance of Signup Cubit
  final DerivSignupCubit derivSignupCubit;

  /// Instance of language Cubit
  final LanguageCubit languageCubit;

  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<DerivAuthCubit>.value(
            value: derivAuthCubit,
          ),
          BlocProvider<SocialAuthCubit>.value(
            value: socialAuthCubit,
          ),
          BlocProvider<DerivResetPassCubit>.value(
            value: derivResetPassCubit,
          ),
          BlocProvider<DerivSignupCubit>.value(
            value: derivSignupCubit,
          ),
          BlocProvider<LanguageCubit>.value(
            value: languageCubit,
          ),
        ],
        child: widget,
      );
}
