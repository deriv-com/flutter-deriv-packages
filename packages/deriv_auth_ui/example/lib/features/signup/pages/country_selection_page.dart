import 'package:deriv_auth_ui/deriv_auth_ui.dart';
import 'package:example/features/signup/pages/set_password_page.dart';
import 'package:flutter/material.dart';

class CountrySelectionPage extends StatelessWidget {
  const CountrySelectionPage({required this.verificationCode, super.key});

  final String verificationCode;

  @override
  Widget build(BuildContext context) {
    return DerivCountrySelectionLayout(
      onNextPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const SetPasswordPage(verificationCode: 'code'),
        ));
      },
      residences: Future.value([
        const DerivResidenceModel(
            code: 'ID', name: 'Indonesia', isDisabled: false),
        const DerivResidenceModel(
            code: 'UK', name: 'England', isDisabled: true),
      ]),
      verificationCode: verificationCode,
      affiliateToken: 'token',
    );
  }
}
