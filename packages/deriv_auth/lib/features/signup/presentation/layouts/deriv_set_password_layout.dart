import 'package:deriv_auth/core/helpers/assets.dart';
import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_auth/features/signup/presentation/widgets/password_policy_checker_widget.dart';
import 'package:deriv_auth/features/single_entry/core/auth_data.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Allows user to set password for newly created account
class DerivSetPasswordLayout extends StatefulWidget {
  /// constructor of country set password page
  const DerivSetPasswordLayout({
    required this.onDerivSignupState,
    required this.onPreviousPressed,
    required this.verificationCode,
    required this.residence,
    this.authErrorStateHandler,
    this.utmModel,
    this.onAuthError,
    this.affiliateToken,
    Key? key,
  }) : super(key: key);

  /// Verification Code
  final String? verificationCode;

  /// Residence
  final String? residence;

  /// Utm model
  final DerivAuthUtmModel? utmModel;

  /// Extension of base [AuthErrorStateHandler]. If not provided, base implementation will be used.
  final AuthErrorStateHandler? authErrorStateHandler;

  /// Callback to be called on [DerivAuthErrorState]
  final Function(DerivAuthErrorState)? onAuthError;

  /// Callback to be called when signup state changes.
  final void Function(BuildContext, DerivSignupState) onDerivSignupState;

  /// Callback to be called when previous button is tapped.
  final VoidCallback onPreviousPressed;

  /// Affiliate token.
  final String? affiliateToken;

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
  Widget build(BuildContext context) => DerivAuthStateListener(
        authErrorStateHandler: widget.authErrorStateHandler,
        onError: widget.onAuthError,
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
              SvgPicture.asset(Assets.passwordIcon, package: 'deriv_auth'),
              const SizedBox(height: ThemeProvider.margin16),
              Text(
                context.derivAuthLocalization.labelKeepPassword,
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
            BlocConsumer<DerivAuthCubit, DerivAuthState>(
              listener: _onAuthState,
              builder: (BuildContext context, DerivAuthState state) => Expanded(
                child: BlocConsumer<DerivSignupCubit, DerivSignupState>(
                  listener:
                      AuthData().data.signupPageModel.handleFlowFromPackage
                          ? (BuildContext context, DerivSignupState state) =>
                              _onSignupState(state)
                          : widget.onDerivSignupState,
                  builder: (BuildContext context, DerivSignupState state) =>
                      _buildStartTradingButton(state),
                ),
              ),
            ),
          ],
        ),
      );

  void _onAuthState(BuildContext context, DerivAuthState state) {
    if (state is DerivAuthLoggedInState) {
      AuthData().data.loginPageModel.onLoggedIn.call(context, state);
    }
  }

  Future<void> _onSignupState(DerivSignupState state) async {
    if (state is DerivSignupDoneState) {
      await context.read<DerivAuthCubit>().tokenLogin(
            state.account?.token ?? 'invalid_token',
          );
    }
  }

  Widget _buildPasswordInput() => BaseTextField(
        focusNode: _passwordFocusNode,
        controller: _passwordTextController,
        obscureText: !_isPasswordVisible,
        labelText: context.derivAuthLocalization.labelCreatePassword,
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
                  context.derivAuthLocalization.actionStartTrading,
                  style: TextStyles.button
                      .copyWith(color: context.theme.colors.prominent),
                ),
        ),
        onPressed: () async =>
            context.read<DerivSignupCubit>().openNewVirtualAccount(
                  await _getNewVirtualAccountModel(),
                ),
      );

  Widget _buildPreviousButton() => SecondaryButton(
        onPressed: AuthData().data.signupPageModel.handleFlowFromPackage
            ? () {
                Navigator.pushReplacement<BuildContext,
                    Route<DerivCountrySelectionLayout>>(
                  context,
                  MaterialPageRoute<BuildContext>(
                    builder: (BuildContext context) =>
                        DerivCountrySelectionLayout(
                      affiliateToken: widget.affiliateToken,
                      onNextPressed: () {},
                      verificationCode: widget.verificationCode!,
                      residences: AuthData().data.signupPageModel.residences,
                    ),
                  ),
                );
              }
            : widget.onPreviousPressed,
        child: Center(
          child: Text(
            context.derivAuthLocalization.actionPrevious,
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
}
