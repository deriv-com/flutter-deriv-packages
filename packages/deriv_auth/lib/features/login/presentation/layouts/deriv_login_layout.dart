import 'dart:async';

import 'package:deriv_auth/core/analytics/service/auth_tracking_mixin.dart';
import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_passkeys/deriv_passkeys.dart';
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
    required this.onLoggedIn,
    required this.welcomeLabel,
    required this.socialAuthStateHandler,
    required this.redirectURL,
    required this.onWebViewError,
    this.onSocialAuthButtonPressed,
    this.isForgotPasswordEnabled = true,
    this.isCreateAccountEnabled = true,
    this.isSocialAuthEnabled = true,
    this.isPasskeysEnabled = true,
    this.authErrorStateHandler,
    this.onLoginError,
    this.onLoginTapped,
    this.titleKey,
    this.emailTextFieldKey,
    this.passwordTextFieldKey,
    this.forgotPasswordButtonKey,
    this.loginButtonKey,
    this.twoFactorAuthNavigation,
    Key? key,
  }) : super(key: key);

  /// Callback to be called when reset password button is tapped.
  final VoidCallback onResetPassTapped;

  /// Callback to be called when signup button is tapped.
  final VoidCallback onSignupTapped;

  /// Extension of base [AuthErrorStateHandler]. If not provided, base implementation will be used.
  final AuthErrorStateHandler? authErrorStateHandler;

  /// Callback to be called when login error occurs.
  final Function(DerivAuthErrorState)? onLoginError;

  /// Callback to be called when user is logged in.
  final Function(BuildContext, DerivAuthLoggedInState) onLoggedIn;

  /// Callback to be called when social auth button is tapped.
  /// Give access to [SocialAuthDto] for 2FA.
  final SocialAuthCallback? onSocialAuthButtonPressed;

  /// Callback to be called when login button is tapped.
  /// Give access to email and password.
  final Function(String email, String password)? onLoginTapped;

  /// Welcome text to be displayed on login page.
  final String welcomeLabel;

  /// Whether to display social auth buttons.
  final bool isSocialAuthEnabled;

  /// Whether to display forgot password section.
  final bool isForgotPasswordEnabled;

  /// Whether to display create account section.
  final bool isCreateAccountEnabled;

  /// Whether to display passkey button.
  final bool isPasskeysEnabled;

  /// Social auth state handler.
  final Function(BuildContext, SocialAuthState) socialAuthStateHandler;

  /// Redirect URL for social auth.
  final String redirectURL;

  /// Callback for web view error.
  final Function(String) onWebViewError;

  /// Widget key for title.
  final Key? titleKey;

  /// Widget key for email text box.
  final Key? emailTextFieldKey;

  /// Widget key for password text box.
  final Key? passwordTextFieldKey;

  /// Widget key for forgot password button.
  final Key? forgotPasswordButtonKey;

  /// Widget key for login button button.
  final Key? loginButtonKey;

  /// 2FA flow navigation
  final Function? twoFactorAuthNavigation;

  @override
  State<DerivLoginLayout> createState() => _DerivLoginLayoutState();
}

class _DerivLoginLayoutState extends State<DerivLoginLayout>
    with AuthTrackingMixin {
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
              context.derivAuthLocalization.labelLogIn,
              key: widget.titleKey,
              style: TextStyles.title,
            ),
            backgroundColor: context.theme.colors.secondary,
            centerTitle: false,
          ),
          body: BlocConsumer<DerivAuthCubit, DerivAuthState>(
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
                      const SizedBox(height: ThemeProvider.margin14),
                      ..._buildTextFields(
                          isEnabled: state is! DerivAuthLoadingState),
                      const SizedBox(height: ThemeProvider.margin24),
                      widget.isForgotPasswordEnabled
                          ? _buildForgotPassButton()
                          : const SizedBox(),
                      const SizedBox(height: ThemeProvider.margin24),
                      _buildLoginButton(),
                      const SizedBox(height: ThemeProvider.margin24),
                      DerivSocialAuthDivider(
                        label: context.derivAuthLocalization.informLoginOptions,
                        isVisible: widget.isSocialAuthEnabled,
                      ),
                      if (widget.isSocialAuthEnabled)
                        const SizedBox(height: ThemeProvider.margin24),
                      widget.isPasskeysEnabled
                          ? ContinueWithPasskeyButton(
                              onTap: trackLoginWithPasskey,
                            )
                          : const SizedBox.shrink(),
                      DerivSocialAuthPanel(
                        socialAuthStateHandler: widget.socialAuthStateHandler,
                        redirectURL: widget.redirectURL,
                        onPressed: widget.onSocialAuthButtonPressed,
                        isVisible: widget.isSocialAuthEnabled,
                        onWebViewError: widget.onWebViewError,
                      ),
                      if (widget.isSocialAuthEnabled)
                        const SizedBox(height: ThemeProvider.margin24),
                      widget.isCreateAccountEnabled
                          ? _buildFooterSection()
                          : const SizedBox(),
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
            textStyle: TextStyles.subheading,
            color: context.theme.colors.prominent,
          ),
        ),
      ];

  List<Widget> _buildTextFields({required bool isEnabled}) => <Widget>[
        BaseTextField(
          key: widget.emailTextFieldKey,
          semanticLabel: SemanticsLabels.loginEmailFieldSemantic,
          controller: _emailController,
          focusNode: _emailFocusNode,
          labelText: context.derivAuthLocalization.labelEmail,
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
          key: widget.passwordTextFieldKey,
          semanticLabel: SemanticsLabels.loginPasswordFieldSemantic,
          controller: _passwordController,
          focusNode: _passwordFocusNode,
          labelText: context.derivAuthLocalization.labelPassword,
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
          key: widget.forgotPasswordButtonKey,
          onTap: widget.onResetPassTapped,
          child: Text(
            context.derivAuthLocalization.actionForgotPassword,
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
          key: widget.loginButtonKey,
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
                    context.derivAuthLocalization.actionLogin,
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
              context.derivAuthLocalization.labelDontHaveAnAccountYet,
              style: context.theme.textStyle(
                textStyle: TextStyles.body1,
                color: context.theme.colors.general,
              ),
            ),
            InkWell(
              onTap: widget.onSignupTapped,
              child: Padding(
                padding: const EdgeInsets.all(ThemeProvider.margin04),
                child: Text(
                  context.derivAuthLocalization.actionCreateANewAccount,
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
      widget.onLoginError?.call(state);

      // Handling the 2FA Flow in case of missing OTP scanario
      if (state.type == AuthErrorType.missingOtp &&
          widget.twoFactorAuthNavigation != null) {
        widget.twoFactorAuthNavigation!(context);
      }

      authErrorStateMapper(
        authErrorState: state,
        authErrorStateHandler: widget.authErrorStateHandler ??
            AuthErrorStateHandler(context: context),
      );
    }

    if (state is DerivAuthLoggedInState) {
      widget.onLoggedIn(context, state);
    }
  }

  bool _isFormValid() =>
      _getEmailValue().isValidEmail &&
      _passwordController.text.isValidLoginPasswordLength;

  String? _emailValidator(String? input) => emailValidator(
      _getEmailValue(), context.derivAuthLocalization.informInvalidEmailFormat);

  String? _passwordValidator(String? input) => passwordValidator(
      _getPasswordValue(), context.derivAuthLocalization.warnPasswordLength);

  Future<void> _onLoginTapped() async {
    widget.onLoginTapped?.call(
      _getEmailValue(),
      _passwordController.text,
    );

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

  String _getPasswordValue() => _passwordController.text.trim();

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();

    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }
}
