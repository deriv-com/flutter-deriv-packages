import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_auth_ui/deriv_auth_ui.dart';
import 'package:example/features/get_started/pages/get_started_page.dart';
import 'package:example/features/login/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPassSuccessPage extends StatefulWidget {
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
        BlocProvider.of<DerivAuthCubit>(context).logout(),
      ],
    ).then(
      (_) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const GetStartedPage(),
          ),
          (route) => false,
        );

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const DerivSuccessPassChangeLayout();
  }
}
