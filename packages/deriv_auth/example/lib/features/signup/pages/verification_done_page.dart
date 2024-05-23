import 'package:deriv_auth/features/signup/presentation/layouts/deriv_verification_done_layout.dart';
import 'package:deriv_auth/features/single_entry/features/signup/pages/country_selection_page.dart';
import 'package:flutter/material.dart';

class VerificationDonePage extends StatelessWidget {
  const VerificationDonePage({required this.verificationCode, super.key});

  final String verificationCode;

  @override
  Widget build(BuildContext context) {
    return DerivVerificationDoneLayout(
      onContinuePressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              CountrySelectionPage(verificationCode: verificationCode),
        ));
      },
      verificationCode: verificationCode,
      affiliateToken: '',
    );
  }
}
