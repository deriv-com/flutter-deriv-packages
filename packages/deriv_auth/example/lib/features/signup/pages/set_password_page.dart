import 'package:deriv_auth/deriv_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetPasswordPage extends StatelessWidget {
  const SetPasswordPage({required this.verificationCode, super.key});

  final String verificationCode;

  @override
  Widget build(BuildContext context) {
    return DerivSetPasswordLayout(
      authErrorStateHandler: AuthErrorStateHandler(context: context),
      onDerivSignupState: (context, state) {
        if (state is DerivSignupDoneState) {
          context
              .read<DerivAuthCubit>()
              .tokenLogin(state.account?.token ?? 'defaultToken');
        }
      },
      onPreviousPressed: () => Navigator.of(context).pop(),
      residence: 'residence',
      verificationCode: verificationCode,
    );
  }
}
