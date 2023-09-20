import 'package:deriv_auth/features/reset_password/cubit/reset_password_cubit.dart';
import 'package:deriv_auth_ui/deriv_auth_ui.dart';
import 'package:example/features/get_started/pages/get_started_page.dart';
import 'package:flutter/material.dart';

class ChooseNewPasswordPage extends StatelessWidget {
  const ChooseNewPasswordPage({required this.cubit, super.key});

  final DerivResetPassCubit cubit;

  @override
  Widget build(BuildContext context) {
    return DerivChooseNewPassLayout(
      token: 'token',
      onResetPassSucceed: () {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const GetStartedPage(),
          ),
          (Route<dynamic> route) => false,
        );
      },
      onResetPassError: (_) {},
    );
  }
}
