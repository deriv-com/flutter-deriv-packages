import 'package:deriv_auth/features/signup/models/deriv_residence_model.dart';
import 'package:deriv_auth/features/signup/presentation/layouts/deriv_country_selection_layout.dart';
import 'package:deriv_auth/features/single_entry/features/signup/pages/set_password_page.dart';
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
