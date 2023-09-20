import 'dart:async';

import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_auth_ui/src/core/extensions/context_extension.dart';
import 'package:deriv_auth_ui/src/core/extensions/string_extension.dart';
import 'package:deriv_auth_ui/src/features/login/widgets/deriv_social_auth_divider.dart';
import 'package:deriv_auth_ui/src/features/login/widgets/deriv_social_auth_panel.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A login page which allows user to login using email and password.
class DerivLoginLayout extends StatefulWidget {
  /// Initializes [DerivLoginLayout].
  const DerivLoginLayout({
    required this.onResetPassTapped,
    required this.onSignupTapped,
    required this.onLoginError,
    required this.onLoggedIn,
    required this.onSocialAuthButtonPressed,
    required this.welcomeLabel,
    required this.greetingLabel,
    this.onLoginTapped,
    Key? key,
  }) : super(key: key);

  /// Callback to be called when reset password button is tapped.
  final VoidCallback onResetPassTapped;

  /// Callback to be called when signup button is tapped.
  final VoidCallback onSignupTapped;

  /// Callback to be called when login button is tapped.
  final Function(DerivAuthErrorState) onLoginError;

  /// Callback to be called when user is logged in.
  final Function(DerivAuthLoggedInState) onLoggedIn;

  /// Callback to be called when social auth button is tapped.
  final void Function(SocialAuthProvider) onSocialAuthButtonPressed;

  /// Callback to be called when login button is tapped.
  final VoidCallback? onLoginTapped;

  /// Welcome text to be displayed on login page.
  final String welcomeLabel;

  /// Greeting text to be displayed on login page.
  final String greetingLabel;

  @override
  State<DerivLoginLayout> createState() => _DerivLoginLayoutState();
}

class _DerivLoginLayoutState extends State<DerivLoginLayout> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  bool _isPasswordVisible = false;

  DerivAuthCubit get authCubit => context.read<DerivAuthCubit>();

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () async =>
            authCubit.state is! DerivAuthLoadingState &&
            authCubit.state is! DerivAuthLoggedInState,
        child: Scaffold(
          backgroundColor: context.theme.colors.primary,
          appBar: AppBar(
            elevation: ThemeProvider.zeroMargin,
            title: Text(
              context.localization.labelLogIn,
              style: TextStyles.title,
            ),
            backgroundColor: context.theme.colors.secondary,
            centerTitle: false,
          ),
          body: BlocConsumer<DerivAuthCubit, DerivAuthState>(
            bloc: authCubit,
            listener: _onAuthState,
            builder: (BuildContext context, DerivAuthState state) => Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: ThemeProvider.margin16,
                    vertical: ThemeProvider.margin24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ..._buildTopSection(),
                      const SizedBox(height: ThemeProvider.margin24),
                      const SizedBox(height: ThemeProvider.margin24),
                      ..._buildTextFields(
                          isEnabled: state is! DerivAuthLoadingState),
                      const SizedBox(height: ThemeProvider.margin24),
                      _buildForgotPassButton(),
                      const SizedBox(height: ThemeProvider.margin24),
                      _buildLoginButton(),
                      const SizedBox(height: ThemeProvider.margin24),
                      DerivSocialAuthDivider(
                        label: context.localization.informLoginOptions,
                      ),
                      const SizedBox(height: ThemeProvider.margin24),
                      DerivSocialAuthPanel(
                        onSocialAuthButtonPressed:
                            widget.onSocialAuthButtonPressed,
                      ),
                      const SizedBox(height: ThemeProvider.margin24),
                      _buildFooterSection(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );

  List<Widget> _buildTopSection() => <Widget>[
        Text(
          widget.welcomeLabel,
          style: context.theme.textStyle(
            textStyle: TextStyles.title,
            color: context.theme.colors.prominent,
          ),
        ),
        const SizedBox(height: ThemeProvider.margin08),
        Text(
          widget.greetingLabel,
          style: context.theme.textStyle(
            textStyle: TextStyles.body1,
            color: context.theme.colors.lessProminent,
          ),
        ),
      ];

  List<Widget> _buildTextFields({required bool isEnabled}) => <Widget>[
        BaseTextField(
          controller: _emailController,
          focusNode: _emailFocusNode,
          labelText: context.localization.labelEmail,
          borderColor: context.theme.colors.hover,
          focusedBorderColor: context.theme.colors.blue,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          validator: _emailValidator,
          enabled: isEnabled,
          onChanged: (_) => setState(() {}),
          onEditingComplete: () => _passwordFocusNode.requestFocus(),
        ),
        const SizedBox(height: ThemeProvider.margin32),
        BaseTextField(
          controller: _passwordController,
          focusNode: _passwordFocusNode,
          labelText: context.localization.labelPassword,
          obscureText: !_isPasswordVisible,
          enabled: isEnabled,
          suffixIcon: IconButton(
            icon: Icon(
              _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              color: context.theme.colors.disabled,
            ),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () =>
                setState(() => _isPasswordVisible = !_isPasswordVisible),
          ),
          validator: _passwordValidator,
          borderColor: context.theme.colors.hover,
          focusedBorderColor: context.theme.colors.blue,
          onChanged: (_) => setState(() {}),
          onEditingComplete: () => _passwordFocusNode.unfocus(),
        )
      ];

  Widget _buildForgotPassButton() => Align(
        alignment: Alignment.centerRight,
        child: InkWell(
          onTap: widget.onResetPassTapped,
          child: Text(
            context.localization.actionForgotPassword,
            style: context.theme.textStyle(
              textStyle: TextStyles.body2,
              color: context.theme.colors.coral,
            ),
          ),
        ),
      );

  Widget _buildLoginButton() => BlocBuilder<DerivAuthCubit, DerivAuthState>(
        bloc: authCubit,
        builder: (BuildContext context, DerivAuthState state) => ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              context.theme.colors.coral.withOpacity(
                getOpacity(
                  isEnabled: _isFormValid() && state is! DerivAuthLoadingState,
                ),
              ),
            ),
          ),
          onPressed: _isFormValid() && state is! DerivAuthLoadingState
              ? _onLoginTapped
              : null,
          child: Center(
            child: state is DerivAuthLoadingState
                ? const LoadingIndicator(
                    valueColor: Colors.white,
                    strokeWidth: ThemeProvider.margin02,
                    height: ThemeProvider.iconSize16,
                    width: ThemeProvider.iconSize16,
                  )
                : Text(
                    context.localization.actionLogin,
                    style: context.theme.textStyle(
                      textStyle: TextStyles.body2,
                      color: context.theme.colors.prominent.withOpacity(
                        getOpacity(isEnabled: _isFormValid()),
                      ),
                    ),
                  ),
          ),
        ),
      );

  Widget _buildFooterSection() => Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              context.localization.labelDontHaveAnAccountYet,
              style: context.theme.textStyle(
                textStyle: TextStyles.body1,
                color: context.theme.colors.lessProminent,
              ),
            ),
            InkWell(
              onTap: widget.onSignupTapped,
              child: Padding(
                padding: const EdgeInsets.all(ThemeProvider.margin04),
                child: Text(
                  context.localization.actionCreateANewAccount,
                  style: context.theme.textStyle(
                    textStyle: TextStyles.body2,
                    color: context.theme.colors.coral,
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  void _onAuthState(BuildContext context, DerivAuthState state) {
    if (state is DerivAuthErrorState) {
      widget.onLoginError.call(state);
    }

    if (state is DerivAuthLoggedInState) {
      widget.onLoggedIn.call(state);
    }
  }

  bool _isFormValid() =>
      _getEmailValue().isNotEmpty && _passwordController.text.isNotEmpty;

  String? _emailValidator(String? input) {
    if (_getEmailValue().isValidEmail) {
      return null;
    }

    return context.localization.informInvalidEmailFormat;
  }

  String? _passwordValidator(String? input) {
    if (input?.isValidLoginPasswordLength ?? false) {
      return null;
    }

    return context.localization.warnPasswordLength;
  }

  Future<void> _onLoginTapped() async {
    widget.onLoginTapped?.call();

    _emailFocusNode.unfocus();
    _passwordFocusNode.unfocus();

    if (authCubit.state is DerivAuthLoadingState ||
        !(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    await authCubit.systemLogin(
      email: _getEmailValue(),
      password: _passwordController.text,
    );
  }

  String _getEmailValue() => _emailController.text.trim();

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();

    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }
}
