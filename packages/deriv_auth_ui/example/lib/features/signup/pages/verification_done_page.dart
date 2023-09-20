import 'package:deriv_auth_ui/deriv_auth_ui.dart';
import 'package:example/features/signup/pages/country_selection_page.dart';
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
