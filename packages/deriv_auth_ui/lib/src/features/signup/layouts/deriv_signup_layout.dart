import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_auth_ui/src/core/extensions/context_extension.dart';
import 'package:deriv_auth_ui/src/core/extensions/string_extension.dart';
import 'package:deriv_auth_ui/src/features/login/widgets/deriv_social_auth_divider.dart';
import 'package:deriv_auth_ui/src/features/login/widgets/deriv_social_auth_panel.dart';
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
    required this.onSocialAuthButtonPressed,
    required this.onSingupError,
    required this.onSingupEmailSent,
    required this.onSignupPressed,
    required this.onLoginTapped,
    required this.signupPageLabel,
    required this.signupPageDescription,
    this.enableReferralSection = true,
    Key? key,
  }) : super(key: key);

  /// Callback to be called when social auth button is pressed.
  final void Function(SocialAuthProvider) onSocialAuthButtonPressed;

  /// Callback to be called when signup error occurs.
  final Function(DerivSignupErrorState) onSingupError;

  /// Callback to be called when signup email is sent.
  final Function(String) onSingupEmailSent;

  /// Callback to be called when signup button is pressed.
  final VoidCallback? onSignupPressed;

  /// Callback to be called when login button is pressed.
  final VoidCallback? onLoginTapped;

  /// Whether to show referral code section or not. Defaults to true.
  final bool enableReferralSection;

  /// Title of signup page.
  final String labelSignupPageText;

  /// Description of signup page.
  final String labelSignupPageDescription;

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
          title:
              Text(context.localization.labelSignUp, style: TextStyles.title),
          backgroundColor: context.theme.colors.secondary,
        ),
        body: BlocConsumer<DerivSignupCubit, DerivSignupState>(
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
                      label: context.localization.labelOrSignUpWith,
                    ),
                    const SizedBox(height: ThemeProvider.margin24),
                    DerivSocialAuthPanel(
                      isEnabled: !isReferralEnabled,
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
                  dialogTitle: context.localization.labelReferralInfoTitle,
                  dialogDescription:
                      context.localization.infoReferralInfoDescription,
                  iconSize: ThemeProvider.iconSize24,
                ),
                const SizedBox(width: ThemeProvider.margin08),
                Expanded(
                  child: Text(
                    context.localization.labelGotReferralCode,
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
                    controller: referralController,
                    onChanged: (_) {
                      if (mounted) {
                        setState(() {});
                      }
                    },
                    focusNode: referralFocusNode,
                    labelText: context.localization.labelReferralCode,
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
          widget.labelSignupPageText,
          style: TextStyles.title,
        ),
        const SizedBox(height: ThemeProvider.margin08),
        Text(
          widget.labelSignupPageDescription,
          style: context.theme.textStyle(
            textStyle: TextStyles.body1,
            color: context.theme.colors.lessProminent,
          ),
        ),
      ];

  Widget _buildFooterSection() => Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              context.localization.labelHaveAccount,
              style: context.theme.textStyle(
                textStyle: TextStyles.body1,
                color: context.theme.colors.lessProminent,
              ),
            ),
            InkWell(
              onTap: widget.onLoginTapped,
              child: Padding(
                padding: const EdgeInsets.all(ThemeProvider.margin04),
                child: Text(
                  context.localization.actionLogin,
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
        controller: emailController,
        focusNode: emailFocusNode,
        labelText: context.localization.labelEmail,
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

  Widget _buildSignUpButton() => PrimaryButton(
        isEnabled: _isFormValid(),
        onPressed: _onSignupTapped,
        child: Center(
          child:
              context.read<DerivSignupCubit>().state is DerivSignupProgressState
                  ? const LoadingIndicator(
                      valueColor: Colors.white,
                      strokeWidth: ThemeProvider.margin02,
                      height: ThemeProvider.iconSize16,
                      width: ThemeProvider.iconSize16,
                    )
                  : Text(
                      context.localization.actionCreateAccount,
                      style: context.theme.textStyle(
                        textStyle: TextStyles.body2,
                        color: context.theme.colors.prominent,
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

  String? _emailValidator(String? input) {
    if (email.isValidEmail) {
      return null;
    }

    return context.localization.informInvalidEmailFormat;
  }

  String? _referralValidator(String? input) {
    if (referralCode.isNotEmpty || !isReferralEnabled) {
      return null;
    }

    return context.localization.informInvalidReferralCode;
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
