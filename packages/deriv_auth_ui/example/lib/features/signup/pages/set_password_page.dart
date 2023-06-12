import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_auth_ui/deriv_auth_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetPasswordPage extends StatelessWidget {
  const SetPasswordPage({required this.verificationCode, super.key});

  final String verificationCode;

  @override
  Widget build(BuildContext context) {
    return DerivSetPasswordLayout(
      authCubit: context.read<DerivAuthCubit>(),
      onDerivAuthState: (context, state) {
        print(state);
      },
      onDerivSignupState: (context, state) {
        print(state);
      },
      onPreviousPressed: () {},
      residence: 'residence',
      signupCubit: context.read<DerivSignupCubit>(),
      verificationCode: verificationCode,
    );
  }
}
