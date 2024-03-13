import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_auth/features/single_entry/core/auth_data.dart';
import 'package:deriv_auth/features/single_entry/features/signup/pages/country_selection_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Set password page
class SetPasswordPage extends StatelessWidget {
  /// Constructor [SetPasswordPage]
  const SetPasswordPage({
    required this.verificationCode,
    this.affiliateToken,
    super.key,
  });

  /// Verification code
  final String verificationCode;

  ///
  final String? affiliateToken;

  @override
  Widget build(BuildContext context) => DerivSetPasswordLayout(
        authErrorStateHandler: AuthErrorStateHandler(context: context),
        onDerivSignupState: (BuildContext constext, DerivSignupState state) {
          if (state is DerivSignupDoneState) {
            context
                .read<DerivAuthCubit>()
                .tokenLogin(state.account?.token ?? 'defaultToken');
          }
        },
        onPreviousPressed: () => Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (BuildContext context) => CountrySelectionPage(
              verificationCode: verificationCode,
              affiliateToken: affiliateToken,
            ),
          ),
        ),
        residence: AuthData().data.resetPassPageModel.userResidence,
        verificationCode: verificationCode,
      );
}
