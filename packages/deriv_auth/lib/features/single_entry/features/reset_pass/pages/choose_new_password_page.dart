import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_auth/features/single_entry/core/auth_data.dart';
import 'package:deriv_auth/features/single_entry/features/reset_pass/pages/reset_pass_success_page.dart';
import 'package:flutter/material.dart';

/// Choose new password page
class ChooseNewPasswordPage extends StatelessWidget {
  /// Constructor [ChooseNewPasswordPage]
  const ChooseNewPasswordPage({required this.token, super.key});

  /// Token
  final String token;

  @override
  Widget build(BuildContext context) => DerivChooseNewPassLayout(
        token: token,
        onResetPassSucceed:
            AuthData().data.resetPassPageModel.onResetPassSucceed ??
                () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) =>
                          const ResetPassSuccessPage(),
                    ),
                  );
                },
        onResetPassError: AuthData().data.resetPassPageModel.onResetPassError,
      );
}
