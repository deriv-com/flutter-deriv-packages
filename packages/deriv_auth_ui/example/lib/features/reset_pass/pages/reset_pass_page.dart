import 'dart:async';

import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_auth_ui/deriv_auth_ui.dart';
import 'package:example/features/reset_pass/pages/choose_new_password_page.dart';
import 'package:example/features/reset_pass/services/example_reset_pass_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPassPage extends StatefulWidget {
  const ResetPassPage({super.key});

  @override
  State<ResetPassPage> createState() => _ResetPassPageState();
}

class _ResetPassPageState extends State<ResetPassPage> {
  late final DerivResetPassCubit cubit;
  late final StreamSubscription<DerivResetPassState> _streamSubscription;

  @override
  void initState() {
    super.initState();

    cubit = DerivResetPassCubit(service: ExampleResetPassService());

    _streamSubscription = cubit.stream.listen((state) {
      if (state is DerivResetPassEmailSentState) {
        Timer(const Duration(seconds: 3), () {
          if (mounted) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => BlocProvider.value(
                  value: cubit, child: ChooseNewPasswordPage(cubit: cubit)),
            ));
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: cubit, child: DerivResetPassLayout(onResetPassError: (_) {}));
  }

  @override
  void dispose() {
    cubit.close();
    _streamSubscription.cancel();

    super.dispose();
  }
}
