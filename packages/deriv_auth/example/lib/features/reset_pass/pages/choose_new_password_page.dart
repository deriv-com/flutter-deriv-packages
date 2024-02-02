import 'package:deriv_auth/features/reset_password/cubit/reset_password_cubit.dart';
import 'package:deriv_auth/features/reset_password/presentation/layouts/deriv_choose_new_pass_layout.dart';
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
      onResetPassError: ({required bool isLinkExpired, String? error}) {},
    );
  }
}
