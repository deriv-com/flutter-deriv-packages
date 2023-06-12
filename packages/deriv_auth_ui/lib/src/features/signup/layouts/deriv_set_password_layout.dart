import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_auth_ui/src/core/helpers/assets.dart';
import 'package:deriv_auth_ui/src/features/signup/models/deriv_auth_utm_model.dart';
import 'package:deriv_auth_ui/src/features/signup/widgets/password_policy_checker_widget.dart';
import 'package:deriv_auth_ui/src/core/helpers/extensions.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Allows user to set password for newly created account
class DerivSetPasswordLayout extends StatefulWidget {
  /// constructor of country set password page
  const DerivSetPasswordLayout({
    required this.authCubit,
    required this.signupCubit,
    required this.onDerivAuthState,
    required this.onDerivSignupState,
    required this.onPreviousPressed,
    required this.verificationCode,
    required this.residence,
    this.utmModel,
    Key? key,
  }) : super(key: key);

  /// Verification Code
  final String? verificationCode;

  /// Residence
  final String? residence;

  final DerivSignupCubit signupCubit;
  final DerivAuthCubit authCubit;
  final DerivAuthUtmModel? utmModel;

  final void Function(BuildContext, DerivAuthState) onDerivAuthState;
  final void Function(BuildContext, DerivSignupState) onDerivSignupState;
  final VoidCallback onPreviousPressed;

  @override
  State<DerivSetPasswordLayout> createState() => _DerivSetPasswordLayoutState();
}

class _DerivSetPasswordLayoutState extends State<DerivSetPasswordLayout> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late TextEditingController _passwordTextController;
  late FocusNode _passwordFocusNode;

  bool _isPasswordVisible = false;
  bool _enableStartButton = false;

  @override
  void initState() {
    super.initState();

    _passwordFocusNode = FocusNode(debugLabel: 'PasswordField');
    _passwordTextController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) =>
      BlocListener<DerivAuthCubit, DerivAuthState>(
        bloc: widget.authCubit,
        listener: widget.onDerivAuthState,
        child: Scaffold(
          backgroundColor: context.theme.colors.primary,
          body: SafeArea(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Expanded(child: _buildBody()),
                  _buildButtons()
                ],
              ),
              onChanged: () => setState(() => _enableStartButton =
                  _passwordTextController.text.isValidSignupPassword),
            ),
          ),
        ),
      );

  Widget _buildBody() => Padding(
        padding: const EdgeInsets.all(ThemeProvider.margin16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: ThemeProvider.margin96),
              SvgPicture.asset(passwordIcon),
              const SizedBox(height: ThemeProvider.margin16),
              Text(
                context.localization.labelKeepPassword,
                style: TextStyles.title,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: ThemeProvider.margin24),
              _buildPasswordInput(),
              const SizedBox(height: ThemeProvider.margin44),
              PasswordPolicyCheckerWidget(
                passwordController: _passwordTextController,
                policies: PasswordPolicyCheckerWidget.getDerivPasswordPolicies(
                  context,
                ),
              )
            ],
          ),
        ),
      );

  Widget _buildButtons() => Padding(
        padding: const EdgeInsets.only(
          left: ThemeProvider.margin16,
          right: ThemeProvider.margin16,
          bottom: ThemeProvider.margin16,
        ),
        child: Row(
          children: <Widget>[
            Expanded(child: _buildPreviousButton()),
            const SizedBox(width: ThemeProvider.margin08),
            Expanded(
              child: BlocConsumer<DerivSignupCubit, DerivSignupState>(
                bloc: widget.signupCubit,
                listener: widget.onDerivSignupState,
                builder: (BuildContext context, DerivSignupState state) =>
                    _buildStartTradingButton(state),
              ),
            ),
          ],
        ),
      );

  Widget _buildPasswordInput() => BaseTextField(
        focusNode: _passwordFocusNode,
        controller: _passwordTextController,
        obscureText: !_isPasswordVisible,
        labelText: context.localization.labelCreatePassword,
        labelColor: context.theme.colors.disabled,
        focusedLabelColor: context.theme.colors.blue,
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
      );

  Widget _buildStartTradingButton(DerivSignupState state) => PrimaryButton(
        isEnabled: _enableStartButton,
        child: Center(
          child: state is DerivSignupProgressState
              ? LoadingIndicator(
                  valueColor: context.theme.colors.prominent,
                  width: ThemeProvider.margin24,
                  height: ThemeProvider.margin24,
                  strokeWidth: 3,
                )
              : Text(
                  context.localization.actionStartTrading,
                  style: TextStyles.button
                      .copyWith(color: context.theme.colors.prominent),
                ),
        ),
        onPressed: () async => widget.signupCubit.openNewVirtualAccount(
          await _getNewVirtualAccountModel(),
        ),
      );

  Widget _buildPreviousButton() => SecondaryButton(
        onPressed: widget.onPreviousPressed,
        child: Center(
          child: Text(
            context.localization.actionPrevious,
            style: context.theme.textStyle(
              textStyle: TextStyles.button,
            ),
          ),
        ),
      );

  Future<NewVirtualAccountRequestModel> _getNewVirtualAccountModel() async {
    final NewVirtualAccountRequestModel newVirtualAccountModel =
        NewVirtualAccountRequestModel(
      clientPassword: _passwordTextController.text,
      residence: widget.residence!,
      verificationCode: widget.verificationCode!,
    );

    return newVirtualAccountModel.copyWith(
      utmMedium: widget.utmModel?.utmMedium,
      utmCampaign: widget.utmModel?.utmCampaign,
      utmSource: widget.utmModel?.utmSource,
      affiliateToken: widget.utmModel?.affiliateToken,
      utmTerm: widget.utmModel?.utmTerm,
      utmContent: widget.utmModel?.utmContent,
      utmCampaignId: widget.utmModel?.utmCampaignId,
      utmAdGroupId: widget.utmModel?.utmAdGroupId,
      utmAdId: widget.utmModel?.utmAdId,
    );
  }

  @override
  void dispose() {
    widget.signupCubit.close();

    super.dispose();
  }
}
