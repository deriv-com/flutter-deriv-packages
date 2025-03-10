import 'dart:async';

import 'package:deriv_auth/features/signup/presentation/layouts/deriv_email_not_received_layout.dart';
import 'package:deriv_auth/features/signup/presentation/layouts/deriv_verify_email_layout.dart';
import 'package:deriv_auth/features/single_entry/features/signup/pages/verification_done_page.dart';
import 'package:flutter/material.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({required this.email, super.key});
  final String email;

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              const VerificationDonePage(verificationCode: 'code'),
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) => DerivVerifyEmailLayout(
        email: widget.email,
        onEmailNotReceivedPressed: () => onEmailNotReceivedPressed(context),
      );

  void onEmailNotReceivedPressed(BuildContext context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => DerivEmailNotReceivedLayout(
        onReEnterEmailPressed: () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => DerivVerifyEmailLayout(
              email: widget.email,
              onEmailNotReceivedPressed: () =>
                  onEmailNotReceivedPressed(context),
            ),
          ),
        ),
      ),
    ));
  }
}
