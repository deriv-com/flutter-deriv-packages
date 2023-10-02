import 'package:deriv_auth_ui/src/core/extensions/context_extension.dart';
import 'package:deriv_auth_ui/src/core/helpers/assets.dart';
import 'package:deriv_auth_ui/src/features/signup/cubits/deriv_country_selection_cubit.dart';
import 'package:deriv_auth_ui/src/features/signup/models/deriv_residence_model.dart';
import 'package:deriv_auth_ui/src/features/signup/widgets/country_selection_list_widget.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

/// Allows user to select a country from list
class DerivCountrySelectionLayout extends StatefulWidget {
  /// constructor of country selection page
  const DerivCountrySelectionLayout({
    required this.verificationCode,
    required this.residences,
    required this.onNextPressed,
    this.affiliateToken,
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

  @override
  State<DerivCountrySelectionLayout> createState() =>
      _DerivCountrySelectionLayoutState();
}

class _DerivCountrySelectionLayoutState
    extends State<DerivCountrySelectionLayout> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FocusNode _focusNode = FocusNode();

  late TextEditingController _textController;

  late final DerivCountrySelectionCubit _countrySelectionCubit;
  DerivResidenceModel? _selectedResidence;

  @override
  void initState() {
    super.initState();

    _countrySelectionCubit = DerivCountrySelectionCubit(widget.residences)
      ..fetchResidenceCounties();

    _textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: context.theme.colors.primary,
        body: SafeArea(
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
      );

  Widget _buildUpperPage() => Padding(
        padding: const EdgeInsets.all(ThemeProvider.margin16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(Assets.locationIcon, package: 'deriv_auth_ui'),
            const SizedBox(height: ThemeProvider.margin16),
            Text(
              context.localization.labelSelectCountry,
              style: TextStyles.title,
            ),
            const SizedBox(height: ThemeProvider.margin24),
            _buildSelectionInput()
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
            labelText: context.localization.labelChooseCountry,
            labelColor: context.theme.colors.disabled,
            focusNode: _focusNode,
            focusedLabelColor: context.theme.colors.blue,
            suffixIcon: Icon(
              Icons.keyboard_arrow_down,
              color: context.theme.colors.prominent,
            ),
            readOnly: true,
            enabled: state is DerivCountrySelectionLoadedState,
            validator: (String? value) => _selectedResidence!.isDisabled
                ? context.localization.warnCountryNotAvailable
                : null,
            onTap: () => _onSelectCountryTap(state.countries),
          ),
        ),
      );

  Widget _buildNextButton() => PrimaryButton(
        isEnabled:
            _selectedResidence != null && !_selectedResidence!.isDisabled,
        onPressed: widget.onNextPressed,
        child: Center(
          child: Text(
            context.localization.actionNext,
            style: TextStyles.button
                .copyWith(color: context.theme.colors.prominent),
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
              _textController.text = countries[index].name;
              _selectedResidence = countries[index];

              _formKey.currentState!.validate();
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();

    _countrySelectionCubit.close();

    super.dispose();
  }
}
