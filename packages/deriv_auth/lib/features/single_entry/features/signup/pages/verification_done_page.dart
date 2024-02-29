import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_auth/features/single_entry/features/signup/pages/country_selection_page.dart';
import 'package:flutter/material.dart';

/// Verification done page
class VerificationDonePage extends StatelessWidget {
  ///
  const VerificationDonePage({
    required this.verificationCode,
    super.key,
    this.affiliateToken,
  });

  /// verification code
  final String verificationCode;

  ///
  final String? affiliateToken;

  @override
  Widget build(BuildContext context) => DerivVerificationDoneLayout(
        onContinuePressed: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (BuildContext context) => CountrySelectionPage(
                verificationCode: verificationCode,
                affiliateToken: affiliateToken,
              ),
            ),
          );
        },
        verificationCode: verificationCode,
        affiliateToken: affiliateToken,
      );
}
