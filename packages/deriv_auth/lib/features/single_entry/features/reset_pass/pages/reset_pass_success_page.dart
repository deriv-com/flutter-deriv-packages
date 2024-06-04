import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_auth/features/single_entry/core/auth_data.dart';
import 'package:deriv_auth/features/single_entry/features/login/pages/login_page.dart';
import 'package:flutter/material.dart';

/// Reset Password success page
class ResetPassSuccessPage extends StatefulWidget {
  /// Constructor [ResetPassSuccessPage]
  const ResetPassSuccessPage({super.key});

  @override
  State<ResetPassSuccessPage> createState() => _ResetPassSuccessPageState();
}

class _ResetPassSuccessPageState extends State<ResetPassSuccessPage> {
  static const Duration _successPageHoldDuration = Duration(seconds: 2);

  @override
  void initState() {
    super.initState();

    // wait for either [_successPageHoldDuration] or logout to finish
    // then navigate to loginPage
    Future.wait<void>(
      <Future<void>>[
        Future<void>.delayed(_successPageHoldDuration),
        AuthData().data.derivAuthCubit.logout(),
      ],
    ).then(
      (_) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
          (Route<dynamic> route) => route is ModalRoute && route.isFirst,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) => const DerivSuccessPassChangeLayout();
}
