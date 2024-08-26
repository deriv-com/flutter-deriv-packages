import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// It offers creating demo accounts via email and third-party providers.
/// It Also provides optional referral code section which can be disabled
/// by setting [enableReferralSection] to false.
class DerivSignupLayout extends StatefulWidget {
  /// Initializes [DerivSignupLayout].
  const DerivSignupLayout({
    required this.onSingupError,
    required this.onSingupEmailSent,
    required this.onSignupPressed,
    required this.onLoginTapped,
    required this.signupPageLabel,
    required this.signupPageDescription,
    required this.socialAuthStateHandler,
    required this.redirectURL,
    required this.onWebViewError,
    this.onSocialAuthButtonPressed,
    this.isSocialAuthEnabled = true,
    this.authErrorStateHandler,
    this.enableReferralSection = true,
    this.onAuthError,
    Key? key,
  }) : super(key: key);

  /// Callback to be called when social auth button is tapped.
  /// Give access to [SocialAuthDto] for 2FA.
  final SocialAuthCallback? onSocialAuthButtonPressed;

  /// Callback to be called when signup error occurs.
  final Function(DerivSignupErrorState) onSingupError;

  /// Extension of base [AuthErrorStateHandler]. If not provided, base implementation will be used.
  final AuthErrorStateHandler? authErrorStateHandler;

  /// Callback to be called on [DerivAuthErrorState].
  /// Useful if needed to do anything additional to [authErrorStateHandler].
  final Function(DerivAuthErrorState)? onAuthError;

  /// Callback to be called when signup email is sent.
  final Function(String) onSingupEmailSent;

  /// Callback to be called when signup button is pressed.
  final VoidCallback? onSignupPressed;

  /// Callback to be called when login button is pressed.
  final VoidCallback? onLoginTapped;

  /// Whether to show referral code section or not. Defaults to true.
  final bool enableReferralSection;

  /// Title of signup page.
  final String signupPageLabel;

  /// Description of signup page.
  final String signupPageDescription;

  /// Whether to display social auth buttons.
  final bool isSocialAuthEnabled;

  /// Social auth state handler.
  final Function(BuildContext, SocialAuthState) socialAuthStateHandler;

  /// Redirect URL for social auth.
  final String redirectURL;

  /// Callback for web view error.
  final Function(String) onWebViewError;

  @override
  State<DerivSignupLayout> createState() => _DerivSignupLayoutState();
}

class _DerivSignupLayoutState extends State<DerivSignupLayout> {
  static const Duration referralBoxAnimationDuration =
      Duration(milliseconds: 400);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController referralController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode referralFocusNode = FocusNode();

  bool isReferralEnabled = false;

  String get referralCode => referralController.text.trim();

  String get email => emailController.text.trim();

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: context.theme.colors.primary,
        appBar: AppBar(
          elevation: ThemeProvider.zeroMargin,
          title: Text(context.derivAuthLocalization.labelSignUp,
              style: TextStyles.title),
          backgroundColor: context.theme.colors.secondary,
        ),
        body: DerivAuthStateListener(
          authErrorStateHandler: widget.authErrorStateHandler,
          onError: widget.onAuthError,
          child: BlocConsumer<DerivSignupCubit, DerivSignupState>(
            listener: _onSignUpState,
            builder: (BuildContext context, DerivSignupState state) => Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: ThemeProvider.margin16,
                    vertical: ThemeProvider.margin24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ..._buildHeaderSection(),
                      const SizedBox(height: ThemeProvider.margin24),
                      _buildEmailTextField(),
                      const SizedBox(height: ThemeProvider.margin36),
                      if (widget.enableReferralSection) _buildReferralSection(),
                      const SizedBox(height: ThemeProvider.margin16),
                      _buildSignUpButton(),
                      const SizedBox(height: ThemeProvider.margin24),
                      DerivSocialAuthDivider(
                        label: context.derivAuthLocalization.labelOrSignUpWith,
                        isVisible: widget.isSocialAuthEnabled,
                      ),
                      if (widget.isSocialAuthEnabled)
                        const SizedBox(height: ThemeProvider.margin24),
                      DerivSocialAuthPanel(
                        isEnabled: !isReferralEnabled,
                        isVisible: widget.isSocialAuthEnabled,
                        socialAuthStateHandler: widget.socialAuthStateHandler,
                        redirectURL: widget.redirectURL,
                        onWebViewError: widget.onWebViewError,
                        onPressed: widget.onSocialAuthButtonPressed,
                      ),
                      if (widget.isSocialAuthEnabled)
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

  Widget _buildReferralSection() => Container(
        padding: const EdgeInsets.symmetric(
          horizontal: ThemeProvider.margin16,
          vertical: ThemeProvider.margin16,
        ),
        decoration: BoxDecoration(
          color: context.theme.colors.secondary,
          borderRadius: const BorderRadius.all(
            Radius.circular(ThemeProvider.borderRadius08),
          ),
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                InfoIconButton(
                  dialogTitle:
                      context.derivAuthLocalization.labelReferralInfoTitle,
                  dialogDescription:
                      context.derivAuthLocalization.infoReferralInfoDescription,
                  positiveActionLabel: context.derivAuthLocalization.actionOk,
                  iconSize: ThemeProvider.iconSize24,
                ),
                const SizedBox(width: ThemeProvider.margin08),
                Expanded(
                  child: Text(
                    context.derivAuthLocalization.labelGotReferralCode,
                    style: context.theme.textStyle(
                      textStyle: TextStyles.body1,
                      color: context.theme.colors.prominent,
                    ),
                  ),
                ),
                SizedBox(
                  height: ThemeProvider.margin16,
                  width: ThemeProvider.margin36,
                  child: Switch(
                    activeColor: context.theme.colors.coral,
                    inactiveThumbColor: context.theme.colors.disabled,
                    value: isReferralEnabled,
                    onChanged: (bool value) {
                      value
                          ? referralFocusNode.requestFocus()
                          : referralFocusNode.unfocus();

                      if (mounted) {
                        setState(() => isReferralEnabled = value);
                      }
                    },
                  ),
                )
              ],
            ),
            ClipRRect(
              child: TweenAnimationBuilder<double>(
                duration: referralBoxAnimationDuration,
                tween: Tween<double>(begin: 0, end: isReferralEnabled ? 1 : 0),
                curve: Curves.easeOutCubic,
                builder: (
                  BuildContext context,
                  double animationValue,
                  Widget? child,
                ) =>
                    Opacity(
                  opacity: animationValue,
                  child: Align(heightFactor: animationValue, child: child),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: ThemeProvider.margin16,
                  ),
                  child: BaseTextField(
                    semanticLabel:
                        SemanticsLabels.signupReferralTextFieldSemantic,
                    controller: referralController,
                    onChanged: (_) {
                      if (mounted) {
                        setState(() {});
                      }
                    },
                    focusNode: referralFocusNode,
                    labelText: context.derivAuthLocalization.labelReferralCode,
                    borderColor: context.theme.colors.hover,
                    focusedBorderColor: context.theme.colors.blue,
                    textInputAction: TextInputAction.done,
                    validator: _referralValidator,
                  ),
                ),
              ),
            )
          ],
        ),
      );

  List<Widget> _buildHeaderSection() => <Widget>[
        Text(
          widget.signupPageLabel,
          style: TextStyles.title,
        ),
        const SizedBox(height: ThemeProvider.margin08),
        Text(
          widget.signupPageDescription,
          style: context.theme.textStyle(
            textStyle: TextStyles.body1,
            color: context.theme.colors.general,
          ),
        ),
      ];

  Widget _buildFooterSection() => Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              context.derivAuthLocalization.labelHaveAccount,
              style: context.theme.textStyle(
                textStyle: TextStyles.body1,
                color: context.theme.colors.general,
              ),
            ),
            InkWell(
              onTap: widget.onLoginTapped,
              child: Padding(
                padding: const EdgeInsets.all(ThemeProvider.margin04),
                child: Text(
                  context.derivAuthLocalization.actionLogin,
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

  Widget _buildEmailTextField() => BaseTextField(
        semanticLabel: SemanticsLabels.signupEmailFieldSemantic,
        controller: emailController,
        focusNode: emailFocusNode,
        labelText: context.derivAuthLocalization.labelEmail,
        borderColor: context.theme.colors.hover,
        focusedBorderColor: context.theme.colors.blue,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.done,
        validator: _emailValidator,
        onChanged: (_) {
          if (mounted) {
            setState(() {});
          }
        },
      );

  Widget _buildSignUpButton() => Semantics(
        label: SemanticsLabels.signupButtonSemantic,
        child: PrimaryButton(
          isEnabled: _isFormValid(),
          onPressed: _onSignupTapped,
          child: Center(
            child: context.read<DerivSignupCubit>().state
                    is DerivSignupProgressState
                ? const LoadingIndicator(
                    valueColor: Colors.white,
                    strokeWidth: ThemeProvider.margin02,
                    height: ThemeProvider.iconSize16,
                    width: ThemeProvider.iconSize16,
                  )
                : Text(
                    context.derivAuthLocalization.actionCreateAccount,
                    style: context.theme.textStyle(
                      textStyle: TextStyles.body2,
                      color: context.theme.colors.prominent,
                    ),
                  ),
          ),
        ),
      );

  Future<void> _onSignUpState(
    BuildContext context,
    DerivSignupState state,
  ) async {
    if (state is DerivSignupErrorState) {
      widget.onSingupError(state);
    } else if (state is DerivSignupEmailSentState) {
      widget.onSingupEmailSent(emailController.text);
    }
  }

  bool _isFormValid() =>
      _emailValidator(emailController.text) == null &&
      _referralValidator(referralController.text) == null;

  String? _emailValidator(String? input) => emailValidator(
      email, context.derivAuthLocalization.informInvalidEmailFormat);

  String? _referralValidator(String? input) {
    if (referralCode.isNotEmpty || !isReferralEnabled) {
      return null;
    }

    return context.derivAuthLocalization.informInvalidReferralCode;
  }

  Future<void> _onSignupTapped() async {
    emailFocusNode.unfocus();
    referralFocusNode.unfocus();

    if (!(formKey.currentState?.validate() ?? false)) {
      return;
    }

    await context.read<DerivSignupCubit>().sendVerificationEmail(
          email,
          referralCode: isReferralEnabled ? referralCode : null,
        );

    widget.onSignupPressed?.call();
  }

  @override
  void dispose() {
    emailFocusNode.dispose();
    referralFocusNode.dispose();

    emailController.dispose();
    referralController.dispose();

    super.dispose();
  }
}
