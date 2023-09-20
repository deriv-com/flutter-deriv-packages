import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_auth_ui/deriv_auth_ui.dart';
import 'package:example/features/home/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetPasswordPage extends StatelessWidget {
  const SetPasswordPage({required this.verificationCode, super.key});

  final String verificationCode;

  @override
  Widget build(BuildContext context) {
    return DerivSetPasswordLayout(
      onDerivAuthState: (context, state) {
        if (state is DerivAuthLoggedInState) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
            (Route<dynamic> route) => false,
          );
        }
      },
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
