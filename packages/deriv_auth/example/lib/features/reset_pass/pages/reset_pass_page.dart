import 'dart:async';

import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_auth/features/reset_password/presentation/layouts/deriv_reset_pass_layout.dart';
import 'package:deriv_auth/features/reset_password/services/base_reset_password_service.dart';
import 'package:deriv_auth/features/single_entry/features/reset_pass/pages/choose_new_password_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPassPage extends StatefulWidget {
  const ResetPassPage({super.key});

  @override
  State<ResetPassPage> createState() => _ResetPassPageState();
}

class ExampleResetPasswordService extends BaseResetPasswordService {
  @override
  Future<bool> resetPassword(
      {required String verificationCode, required String newPassword}) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<VerifyEmailResponseEntity> sendVerificationEmail(
      VerifyEmailRequestEntity request) {
    // TODO: implement sendVerificationEmail
    throw UnimplementedError();
  }
}

class _ResetPassPageState extends State<ResetPassPage> {
  late final DerivResetPassCubit cubit;
  late final StreamSubscription<DerivResetPassState> _streamSubscription;

  @override
  void initState() {
    super.initState();

    cubit = DerivResetPassCubit(service: ExampleResetPasswordService());

    _streamSubscription = cubit.stream.listen((state) {
      if (state is DerivResetPassEmailSentState) {
        Timer(const Duration(seconds: 3), () {
          if (mounted) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => BlocProvider.value(
                  value: cubit, child: const ChooseNewPasswordPage(token: '')),
            ));
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: DerivResetPassLayout(onResetPassError: onResetPassError),
    );
  }

  onResetPassError({required bool isLinkExpired, String? error}) {}

  @override
  void dispose() {
    cubit.close();
    _streamSubscription.cancel();

    super.dispose();
  }
}
