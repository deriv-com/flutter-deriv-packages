import 'dart:async';

import 'package:deriv_auth/core/helpers/assets.dart';
import 'package:deriv_auth/core/helpers/semantic_labels.dart';
import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// `Reset Pass` page which helps user to recover his/her password by validation his/her identity.
class DerivResetPassLayout extends StatefulWidget {
  /// Initializes reset pass page.
  const DerivResetPassLayout({
    required this.onResetPassError,
    Key? key,
  }) : super(key: key);

  /// Callback to be called when reset pass fails.
  final ResetPassErrorCallback onResetPassError;

  @override
  State<DerivResetPassLayout> createState() => _DerivResetPassLayoutState();
}

class _DerivResetPassLayoutState extends State<DerivResetPassLayout> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final PageController _pageController = PageController();

  bool _isBusy = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: context.theme.colors.primary,
        appBar: AppBar(
          elevation: ThemeProvider.zeroMargin,
          title: Text(
            context.derivAuthLocalization.labelResetPassword,
            style: TextStyles.title,
          ),
        ),
        body: BlocListener<DerivResetPassCubit, DerivResetPassState>(
          listener: (BuildContext context, DerivResetPassState state) {
            if (state is DerivResetPassEmailSentState) {
              _pageController.animateToPage(
                1,
                duration: slidingPageChangeDuration,
                curve: Curves.easeInOut,
              );
            } else if (state is DerivResetPassErrorState) {
              widget.onResetPassError(
                error: state.errorMessage,
                isLinkExpired: state.isLinkExpired,
              );
            }
          },
          child: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: <Widget>[
              _buildSubmitEmailForm(),
              _buildEmailSentPage(),
            ],
          ),
        ),
      );

  Widget _buildEmailSentPage() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: ThemeProvider.margin24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              Assets.mailIcon,
              width: ThemeProvider.iconSize96,
              height: ThemeProvider.iconSize96,
              package: 'deriv_auth',
            ),
            const SizedBox(height: ThemeProvider.margin24),
            Text(
              context.derivAuthLocalization.labelCheckEmail,
              style: TextStyles.title,
            ),
            const SizedBox(height: ThemeProvider.margin08),
            Text(
              context.derivAuthLocalization
                  .informSendResetPasswordEmail(_emailController.text),
              textAlign: TextAlign.center,
              style: context.theme.textStyle(
                textStyle: TextStyles.body1,
                color: context.theme.colors.general,
              ),
            ),
            const SizedBox(height: kToolbarHeight),
          ],
        ),
      );

  Widget _buildSubmitEmailForm() => Form(
        key: _formKey,
        child: Center(
          child: ListView(
            padding:
                const EdgeInsets.symmetric(horizontal: ThemeProvider.margin16),
            shrinkWrap: true,
            children: <Widget>[
              SvgPicture.asset(
                Assets.resetPassIcon,
                width: ThemeProvider.iconSize96,
                height: ThemeProvider.iconSize96,
                package: 'deriv_auth',
              ),
              const SizedBox(height: ThemeProvider.margin16),
              Text(
                context.derivAuthLocalization.labelResetPassword,
                style: TextStyles.title,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: ThemeProvider.margin08),
              Center(
                child: Text(
                  context.derivAuthLocalization.informResetPassByEmail,
                  textAlign: TextAlign.center,
                  style: context.theme.textStyle(
                    textStyle: TextStyles.body1,
                    color: context.theme.colors.general,
                  ),
                ),
              ),
              const SizedBox(height: ThemeProvider.margin24),
              BaseTextField(
                semanticLabel: SemanticsLabels.resetPasswordEmailFieldSemantic,
                controller: _emailController,
                focusNode: _emailFocusNode,
                labelText: context.derivAuthLocalization.labelEmail,
                keyboardType: TextInputType.emailAddress,
                borderColor: context.theme.colors.hover,
                validator: _emailValidator,
                onChanged: (_) => setState(() {}),
                onEditingComplete: () => _formKey.currentState?.validate(),
              ),
              const SizedBox(height: ThemeProvider.margin44),
              _buildSubmitEmailButton(),
              const SizedBox(height: ThemeProvider.margin32 + kToolbarHeight),
            ],
          ),
        ),
      );

  Widget _buildSubmitEmailButton() => Semantics(
        explicitChildNodes: true,
        label: SemanticsLabels.resetPasswordButtonSemantic,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              context.theme.colors.coral.withOpacity(
                getOpacity(isEnabled: _isFormValid()),
              ),
            ),
          ),
          onPressed: _isFormValid() ? _onSubmitEmailTapped : null,
          child: Center(
            child: _isBusy
                ? LoadingIndicator(
                    valueColor: context.theme.colors.prominent,
                    strokeWidth: ThemeProvider.margin02,
                    height: ThemeProvider.margin16,
                    width: ThemeProvider.margin16,
                  )
                : Text(
                    context.derivAuthLocalization.actionResetPass,
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

  Future<void> _onSubmitEmailTapped() async {
    _emailFocusNode.unfocus();

    if (!(_formKey.currentState?.validate() ?? false) || _isBusy) {
      return;
    }

    setState(() => _isBusy = true);

    await context
        .read<DerivResetPassCubit>()
        .sendVerificationEmail(_getEmailValue());

    setState(() => _isBusy = false);
  }

  bool _isFormValid() =>
      _getEmailValue().isNotEmpty && _getEmailValue().isValidEmail;

  String? _emailValidator(String? input) => emailValidator(
      _getEmailValue(), context.derivAuthLocalization.informInvalidEmailFormat);

  String _getEmailValue() => _emailController.text.trim();

  @override
  void dispose() {
    _pageController.dispose();
    _emailController.dispose();
    _emailFocusNode.dispose();

    super.dispose();
  }
}
