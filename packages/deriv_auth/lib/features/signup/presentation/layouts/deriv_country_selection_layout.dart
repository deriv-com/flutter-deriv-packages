import 'package:analytics/core/logger.dart';
import 'package:deriv_auth/core/extensions/context_extension.dart';
import 'package:deriv_auth/core/helpers/assets.dart';
import 'package:deriv_auth/core/helpers/country_selection_helper.dart';
import 'package:deriv_auth/features/signup/cubit/deriv_country_selection_cubit.dart';
import 'package:deriv_auth/features/signup/cubit/signup_cubit.dart';
import 'package:deriv_auth/features/signup/models/deriv_residence_model.dart';
import 'package:deriv_auth/features/signup/presentation/layouts/deriv_set_password_layout.dart';
import 'package:deriv_auth/features/signup/presentation/widgets/country_selection_list_widget.dart';
import 'package:deriv_auth/features/single_entry/core/auth_data.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:developer';

/// Allows user to select a country from list
class DerivCountrySelectionLayout extends StatefulWidget {
  /// constructor of country selection page
  const DerivCountrySelectionLayout({
    required this.verificationCode,
    required this.residences,
    required this.onNextPressed,
    this.affiliateToken,
    this.countryConsentMessage,
    Key? key,
  }) : super(key: key);

  /// List of residences to be shown.
  final Future<List<DerivResidenceModel>> residences;

  /// Callback to be called when next button is tapped.
  final VoidCallback onNextPressed;

  /// Verification Code from Previous Step. Saved for next step.
  final String verificationCode;

  /// Affiliate token.
  final String? affiliateToken;

  /// Message to be shown beside country consent checkbox.
  final String? countryConsentMessage;

  @override
  State<DerivCountrySelectionLayout> createState() =>
      _DerivCountrySelectionLayoutState();
}

class _DerivCountrySelectionLayoutState
    extends State<DerivCountrySelectionLayout> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FocusNode _focusNode = FocusNode();

  late TextEditingController _textController;

  late DerivCountrySelectionCubit _countrySelectionCubit;
  @override
  void initState() {
    super.initState();

    _textController = TextEditingController();

    _countrySelectionCubit = DerivCountrySelectionCubit(widget.residences);
    _initializeResidences();
  }

  Future<void> _initializeResidences() async {
    try {
      final List<DerivResidenceModel> residencesList = await widget.residences;

      setState(
        () => _countrySelectionCubit = DerivCountrySelectionCubit(
          Future<List<DerivResidenceModel>>.value(residencesList),
        )..fetchResidenceCountries(),
      );
    } on Exception catch (error) {
      log('Error fetching residences: $error');
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: context.theme.colors.primary,
        body: SafeArea(
          child: BlocListener<DerivCountrySelectionCubit,
              DerivCountrySelectionState>(
            bloc: _countrySelectionCubit,
            listener: (BuildContext context, DerivCountrySelectionState state) {
              if (state.selectedCountry != null &&
                  state.selectedCountry?.name != null) {
                _textController.text = state.selectedCountry?.name ?? '';
              }

              WidgetsBinding.instance.addPostFrameCallback((_) {
                _formKey.currentState!.validate();
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Expanded(child: _buildUpperPage()),
                Padding(
                  padding: const EdgeInsets.all(ThemeProvider.margin16),
                  child: _buildLowerPage(),
                ),
              ],
            ),
          ),
        ),
      );

  Widget _buildUpperPage() => Padding(
        padding: const EdgeInsets.all(ThemeProvider.margin16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(Assets.locationIcon, package: 'deriv_auth'),
            const SizedBox(height: ThemeProvider.margin16),
            Text(
              context.derivAuthLocalization.labelSelectCountry,
              style: TextStyles.title,
            ),
            const SizedBox(height: ThemeProvider.margin24),
            _buildSelectionInput(),
            const SizedBox(height: ThemeProvider.margin16),
            _buildCountryConsentCheckbox(
              countryConsentMessage: widget.countryConsentMessage,
            ),
          ],
        ),
      );

  Widget _buildLowerPage() => Row(
        children: <Widget>[
          Expanded(child: _buildNextButton()),
        ],
      );

  Widget _buildSelectionInput() =>
      BlocBuilder<DerivCountrySelectionCubit, DerivCountrySelectionState>(
        bloc: _countrySelectionCubit,
        builder: (BuildContext context, DerivCountrySelectionState state) =>
            Form(
          key: _formKey,
          child: BaseTextField(
            controller: _textController,
            labelText: context.derivAuthLocalization.labelChooseCountry,
            labelColor: context.theme.colors.disabled,
            focusNode: _focusNode,
            focusedLabelColor: context.theme.colors.blue,
            suffixIcon: Icon(
              Icons.keyboard_arrow_down,
              color: context.theme.colors.prominent,
            ),
            readOnly: true,
            enabled: _shouldEnableCountrySelectionField(state),
            validator: (String? value) => _countrySelectionValidator(context,
                selectedCountry: state.selectedCountry),
            onTap: () => _onSelectCountryTap(state.countries),
          ),
        ),
      );

  Widget _buildNextButton() =>
      BlocBuilder<DerivCountrySelectionCubit, DerivCountrySelectionState>(
        bloc: _countrySelectionCubit,
        builder: (BuildContext context, DerivCountrySelectionState state) =>
            PrimaryButton(
          isEnabled: _shouldEnableNextButton(
            state.selectedCountry,
            isConsentRequired: state.selectedCountryRequiresConsent,
            agreedToTerms: state.agreedToTerms,
          ),
          onPressed: AuthData().data.signupPageModel.handleFlowFromPackage
              ? () {
                  Navigator.pushReplacement<BuildContext,
                      Route<DerivSetPasswordLayout>>(
                    context,
                    MaterialPageRoute<BuildContext>(
                      builder: (BuildContext context) => DerivSetPasswordLayout(
                        onDerivSignupState: (BuildContext BuildContext,
                            DerivSignupState DerivSignupState) {},
                        onPreviousPressed: () {},
                        residence: state.selectedCountry?.code,
                        verificationCode: widget.verificationCode,
                        affiliateToken: widget.affiliateToken,
                      ),
                    ),
                  );
                }
              : widget.onNextPressed,
          child: Center(
            child: Text(
              context.derivAuthLocalization.actionNext,
              style: TextStyles.button
                  .copyWith(color: context.theme.colors.prominent),
            ),
          ),
        ),
      );

  void _onSelectCountryTap(List<DerivResidenceModel> countries) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final double screenHeight = mediaQuery.size.height;
    final double notchHeight = mediaQuery.padding.top;

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) => SizedBox(
        height: screenHeight - notchHeight,
        child: CountrySelectionListWidget(
          countries: countries,
          onChanged: (int index) => setState(
            () {
              _countrySelectionCubit.changeSelectedCountry(
                selectedCountry: countries[index],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCountryConsentCheckbox({String? countryConsentMessage}) =>
      BlocBuilder<DerivCountrySelectionCubit, DerivCountrySelectionState>(
        bloc: _countrySelectionCubit,
        builder: (BuildContext context, DerivCountrySelectionState state) {
          final DerivResidenceModel? selectedCountry = state.selectedCountry;

          if (selectedCountry == null ||
              !state.selectedCountryRequiresConsent) {
            return const SizedBox.shrink();
          }

          return CustomCheckbox(
            padding: const EdgeInsets.symmetric(
              vertical: ThemeProvider.margin16,
            ),
            contentsVerticalAlignment: CrossAxisAlignment.start,
            value: state.agreedToTerms,
            onValueChanged: ({bool? isChecked}) =>
                _countrySelectionCubit.updateCountryConsentStatus(
              agreedToTerms: isChecked,
            ),
            message: countryConsentMessage ??
                getCountryConsentMessage(
                  context,
                  countryCode: selectedCountry.code,
                ),
          );
        },
      );

  /// Validates the country selection.
  String? _countrySelectionValidator(
    BuildContext context, {
    DerivResidenceModel? selectedCountry,
  }) {
    if (selectedCountry != null && selectedCountry.isDisabled) {
      return context.derivAuthLocalization.warnCountryNotAvailable;
    }

    return null;
  }

  /// Determines whether the next button should be enabled based on country selection.
  ///
  /// Returns `true` if the following conditions are met:
  /// - A country is selected.
  /// - The selected country is not disabled.
  /// - If `isConsentRequired` is true, the user must agree to the terms.
  ///
  /// Otherwise, returns `false`.
  bool _shouldEnableNextButton(
    DerivResidenceModel? selectedCountry, {
    bool agreedToTerms = false,
    bool isConsentRequired = false,
  }) {
    if (selectedCountry == null) {
      return false;
    }

    bool shouldEnable = !selectedCountry.isDisabled;

    if (isConsentRequired) {
      shouldEnable = shouldEnable && agreedToTerms;
    }

    return shouldEnable;
  }

  /// Determines whether the country selection field should be enabled
  /// based on the given state.
  bool _shouldEnableCountrySelectionField(
    DerivCountrySelectionState countrySelectionState,
  ) {
    if (countrySelectionState is DerivCountrySelectionLoadedState ||
        countrySelectionState is DerivCountryChangedState ||
        countrySelectionState is DerivCountryConsentChangedState) {
      return true;
    }

    return false;
  }

  @override
  void dispose() {
    _focusNode.dispose();

    _countrySelectionCubit.close();

    super.dispose();
  }
}
