import 'package:deriv_auth/features/auth/cubit/deriv_auth_cubit.dart';
import 'package:deriv_auth/features/reset_password/cubit/reset_password_cubit.dart';
import 'package:deriv_auth/features/signup/cubit/signup_cubit.dart';
import 'package:deriv_auth/features/social_auth/cubit/social_auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthProvider {
  AuthProvider({
    required this.widget,
    required this.derivAuthCubit,
    required this.socialAuthCubit,
    required this.derivResetPassCubit,
    required this.derivSignupCubit,
  });

  final Widget widget;
  final DerivAuthCubit derivAuthCubit;
  final SocialAuthCubit socialAuthCubit;
  final DerivResetPassCubit derivResetPassCubit;
  final DerivSignupCubit derivSignupCubit;

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
        ],
        child: widget,
      );
}
