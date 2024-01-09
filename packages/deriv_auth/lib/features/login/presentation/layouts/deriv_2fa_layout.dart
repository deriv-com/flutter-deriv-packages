import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_auth/core/helpers/assets.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Two-factor-authentication page.
class Deriv2FALayout extends StatefulWidget {
  /// Initializes the two-factor-authentication page.
  const Deriv2FALayout({
    required this.email,
    required this.password,
    Key? key,
  }) : super(key: key);

  /// User entered email in previous page.
  final String email;

  /// User entered password in previous page.
  final String password;

  @override
  State<Deriv2FALayout> createState() => _Deriv2FALayoutState();
}

class _Deriv2FALayoutState extends State<Deriv2FALayout> {
  /// Max allowed length of two factor auth code.
  static const int maxInputLength = 6;

  final TextEditingController _otpController = TextEditingController();
  final FocusNode _otpFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          elevation: ThemeProvider.zeroMargin,
          title: Text(
            context.localization.labelLogIn,
            style: TextStyles.title,
          ),
        ),
        backgroundColor: context.theme.colors.primary,
        body: BlocBuilder<DerivAuthCubit, DerivAuthState>(
          builder: (BuildContext context, DerivAuthState loginState) =>
              ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: ThemeProvider.margin16,
              vertical: ThemeProvider.margin32,
            ),
            children: <Widget>[
              SvgPicture.asset(Assets.twoFactorAuthIcon),
              Text(
                context.localization.labelTwoFactorAuth,
                style: context.theme.textStyle(textStyle: TextStyles.title),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: ThemeProvider.margin08),
              Text(
                context.localization.informEnterTwoFactorAuthCode,
                style: context.theme.textStyle(
                  textStyle: TextStyles.body1,
                  color: context.theme.colors.general,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: ThemeProvider.margin24),
              BaseTextField(
                controller: _otpController,
                labelText:
                    context.localization.labelTwoFactorAuthenticationCode,
                labelColor: context.theme.colors.disabled,
                focusNode: _otpFocusNode,
                enabled: !_isLoading(),
                keyboardType: TextInputType.number,
                maxLength: maxInputLength,
                focusedLabelColor: context.theme.colors.blue,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                showCounterText: false,
                onChanged: (_) => setState(() {}),
              ),
              const SizedBox(height: ThemeProvider.margin44),
              Interaction(
                isEnabled: _isOtpValid(),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.theme.colors.coral,
                  ),
                  onPressed: _onProceedPressed,
                  child: Center(
                    child: loginState is DerivAuthLoadingState
                        ? const LoadingIndicator(
                            valueColor: Colors.white,
                            strokeWidth: ThemeProvider.margin02,
                            height: ThemeProvider.iconSize16,
                            width: ThemeProvider.iconSize16,
                          )
                        : Text(
                            context.localization.actionProceed,
                            style: TextStyles.body2.copyWith(
                              color: context.theme.colors.prominent,
                            ),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  void _onProceedPressed() {
    FocusManager.instance.primaryFocus?.unfocus();

    if (!_isLoading()) {
      context.read<DerivAuthCubit>().systemLogin(
            email: widget.email,
            password: widget.password,
            otp: _otpController.text,
          );
    }
  }

  bool _isOtpValid() =>
      int.tryParse(_otpController.text) != null &&
      _otpController.text.length == maxInputLength;

  bool _isLoading() =>
      context.read<DerivAuthCubit>().state is DerivAuthLoadingState;

  @override
  void dispose() {
    _otpFocusNode.dispose();
    _otpController.dispose();

    super.dispose();
  }
}
