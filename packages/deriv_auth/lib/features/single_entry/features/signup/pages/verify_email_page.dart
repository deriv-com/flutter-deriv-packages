import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_auth/features/single_entry/features/signup/pages/signup_page.dart';
import 'package:flutter/material.dart';

/// Verify email page
class VerifyEmailPage extends StatefulWidget {
  /// Constructor for verify email page
  const VerifyEmailPage({required this.email, super.key});

  /// email
  final String email;

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => DerivVerifyEmailLayout(
        email: widget.email,
        onEmailNotReceivedPressed: () => onEmailNotReceivedPressed(context),
      );

  void onEmailNotReceivedPressed(BuildContext context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute<void>(
      builder: (BuildContext context) => DerivEmailNotReceivedLayout(
        onReEnterEmailPressed: () => Navigator.of(context).pushReplacement(
          MaterialPageRoute<Widget>(
            builder: (BuildContext context) => const SignupPage(),
          ),
        ),
      ),
    ));
  }
}
