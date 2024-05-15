import 'package:deriv_auth/features/reset_password/cubit/reset_password_cubit.dart';
import 'package:deriv_auth_ui/deriv_auth_ui.dart';
import 'package:example/features/reset_pass/pages/reset_pass_success_page.dart';
import 'package:flutter/material.dart';

class ChooseNewPasswordPage extends StatelessWidget {
  const ChooseNewPasswordPage({required this.cubit, super.key});

  final DerivResetPassCubit cubit;

  @override
  Widget build(BuildContext context) {
    return DerivChooseNewPassLayout(
      token: 'token',
      onResetPassSucceed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ResetPassSuccessPage(),
          ),
        );
      },
      onResetPassError: (_) {},
    );
  }
}
