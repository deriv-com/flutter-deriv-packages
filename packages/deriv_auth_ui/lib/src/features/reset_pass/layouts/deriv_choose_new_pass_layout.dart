import 'dart:async';

import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_auth_ui/src/core/extensions/context_extension.dart';
import 'package:deriv_auth_ui/src/core/extensions/string_extension.dart';
import 'package:deriv_auth_ui/src/core/helpers/assets.dart';
import 'package:deriv_auth_ui/src/features/signup/widgets/password_policy_checker_widget.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Choose new Pass page.
class DerivChooseNewPassLayout extends StatefulWidget {
  /// Initializes choose new pass page.
  const DerivChooseNewPassLayout({
    required this.token,
    required this.onResetPassSucceed,
    required this.onResetPassError,
    Key? key,
  }) : super(key: key);

  /// Access token for changing password. can be received from email verification step.
  final String token;

  /// Callback to be called when reset pass fails.
  final Function(String?) onResetPassError;

  /// Callback to be called when reset pass succeeds.
  final VoidCallback onResetPassSucceed;

  @override
  State<DerivChooseNewPassLayout> createState() =>
      _DerivChooseNewPassLayoutState();
}

class _DerivChooseNewPassLayoutState extends State<DerivChooseNewPassLayout> {
  static const Duration _successPageHoldDuration = Duration(seconds: 2);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passController = TextEditingController();
  final FocusNode _passFocusNode = FocusNode();
  final PageController _pageController = PageController();

  bool _isBusy = false;
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: context.theme.colors.primary,
        appBar: AppBar(
          elevation: ThemeProvider.zeroMargin,
          title: Text(
            context.localization.labelResetPassword,
            style: TextStyles.title,
          ),
        ),
        body: BlocListener<DerivResetPassCubit, DerivResetPassState>(
          listener: (BuildContext context, DerivResetPassState state) {
            if (state is DerivResetPassPasswordChangedState) {
              _pageController.animateToPage(
                1,
                duration: slidingPageChangeDuration,
                curve: Curves.easeInOut,
              );

              Timer(_successPageHoldDuration, widget.onResetPassSucceed);
            } else if (state is DerivResetPassErrorState) {
              widget.onResetPassError(state.errorMessage);
            }
          },
          child: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: <Widget>[
              _buildChooseNewPassSection(context),
              _buildSuccessPassChangeSection(context)
            ],
          ),
        ),
      );

  Widget _buildChooseNewPassSection(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: ThemeProvider.margin16,
        ),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: ThemeProvider.margin72),
                Expanded(child: _buildContent()),
                const SizedBox(height: ThemeProvider.margin24),
                _buildSubmitPassButton()
              ],
            ),
          ),
        ),
      );

  Widget _buildContent() =>
      NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overscroll) {
          overscroll.disallowIndicator();

          return true;
        },
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Center(
                child: SvgPicture.asset(
                  Assets.chooseNewPassIcon,
                  package: 'deriv_auth_ui',
                  width: ThemeProvider.iconSize96,
                  height: ThemeProvider.iconSize32,
                ),
              ),
              const SizedBox(height: ThemeProvider.margin48),
              Text(
                context.localization.labelChooseNewPass,
                style: TextStyles.title,
              ),
              const SizedBox(height: ThemeProvider.margin24),
              BaseTextField(
                controller: _passController,
                focusNode: _passFocusNode,
                labelText: context.localization.labelCreatePass,
                obscureText: !_isPasswordVisible,
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: context.theme.colors.disabled,
                  ),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () =>
                      setState(() => _isPasswordVisible = !_isPasswordVisible),
                ),
                validator: _passwordValidator,
                onChanged: (_) => setState(() {}),
                onEditingComplete: () => _formKey.currentState?.validate(),
              ),
              const SizedBox(height: ThemeProvider.margin40),
              PasswordPolicyCheckerWidget(
                passwordController: _passController,
                policies: PasswordPolicyCheckerWidget.getDerivPasswordPolicies(
                  context,
                ),
              ),
            ],
          ),
        ),
      );

  Widget _buildSuccessPassChangeSection(BuildContext context) => Center(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: ThemeProvider.margin16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(
                height: ThemeProvider.margin16,
                width: ThemeProvider.margin16,
                child: LoadingIndicator(
                  valueColor: Colors.white,
                  strokeWidth: 2.5,
                ),
              ),
              const SizedBox(
                height: ThemeProvider.margin16,
              ),
              Text(
                context.localization.informYourPassHasBeenReset,
                style: TextStyles.title,
              ),
              const SizedBox(
                height: ThemeProvider.margin08,
              ),
              Text(
                context.localization.informRedirectLogin,
                textAlign: TextAlign.center,
                style: context.theme.textStyle(
                  textStyle: TextStyles.body1,
                  color: context.theme.colors.lessProminent,
                ),
              ),
            ],
          ),
        ),
      );

  Widget _buildSubmitPassButton() => ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            context.theme.colors.coral.withOpacity(
              getOpacity(isEnabled: isFormValid()),
            ),
          ),
        ),
        onPressed: isFormValid() ? _onSubmitEmailTapped : null,
        child: Center(
          child: _isBusy
              ? const LoadingIndicator(
                  valueColor: Colors.white,
                  strokeWidth: ThemeProvider.margin02,
                  height: ThemeProvider.iconSize16,
                  width: ThemeProvider.iconSize16,
                )
              : Text(
                  context.localization.actionResetPass,
                  style: context.theme.textStyle(
                    textStyle: TextStyles.body2,
                    color: context.theme.colors.prominent.withOpacity(
                      getOpacity(isEnabled: isFormValid()),
                    ),
                  ),
                ),
        ),
      );

  Future<void> _onSubmitEmailTapped() async {
    _passFocusNode.unfocus();

    if ((_formKey.currentState?.validate() ?? false) && !_isBusy) {
      setState(() => _isBusy = true);

      await context.read<DerivResetPassCubit>().changePassword(
            token: widget.token,
            newPassword: _passController.text,
          );

      setState(() => _isBusy = false);
    }
  }

  String? _passwordValidator(String? input) {
    if (input?.isValidSignupPassword ?? false) {
      return null;
    }

    return context.localization.informInvalidPasswordFormat;
  }

  bool isFormValid() => _passwordValidator(_passController.text) == null;

  @override
  void dispose() {
    _pageController.dispose();
    _passController.dispose();
    _passFocusNode.dispose();

    super.dispose();
  }
}
