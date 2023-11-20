part of 'deriv_country_selection_cubit.dart';

/// Country selection state
abstract class DerivCountrySelectionState extends Equatable {
  /// Initialize country selection state.
  const DerivCountrySelectionState({
    this.countries = const <DerivResidenceModel>[],
    this.selectedCountry,
    this.agreedToTerms = false,
    this.selectedCountryRequiresConsent = false,
  });

  /// List of countries.
  final List<DerivResidenceModel> countries;

  /// Selected country.
  final DerivResidenceModel? selectedCountry;

  /// If the selected country requires consent, value must be true to continue.
  /// Default is null.
  /// Example: For Brazil, Brazil requires consent to continue.
  /// The user must agree to the terms to continue.
  final bool agreedToTerms;

  /// If the selected country requires consent to continue, value is true.
  /// Default is false.
  final bool selectedCountryRequiresConsent;

  @override
  List<Object?> get props => <Object?>[
        countries,
        selectedCountry,
        agreedToTerms,
        selectedCountryRequiresConsent,
      ];
}

/// Initial state.
class DerivCountrySelectionInitialState extends DerivCountrySelectionState {
  /// Initialises initial state.
  const DerivCountrySelectionInitialState()
      : super(countries: const <DerivResidenceModel>[]);
}

/// Country list loaded state.
class DerivCountrySelectionLoadedState extends DerivCountrySelectionState {
  /// Initialise country list loaded state
  const DerivCountrySelectionLoadedState(
    List<DerivResidenceModel> countries, {
    DerivResidenceModel? selectedCountry,
  }) : super(countries: countries, selectedCountry: selectedCountry);
}

/// Country selection changed state.
class DerivCountryChangedState extends DerivCountrySelectionState {
  /// Initialise country selection changed state.
  const DerivCountryChangedState(
    List<DerivResidenceModel> countries, {
    DerivResidenceModel? selectedCountry,
    bool? selectedCountryRequiresConsent,
  }) : super(
          countries: countries,
          selectedCountry: selectedCountry,
          selectedCountryRequiresConsent:
              selectedCountryRequiresConsent ?? false,
        );
}

/// State to update country selection consent.
class DerivCountryConsentChangedState extends DerivCountrySelectionState {
  /// Initialize country list loaded state
  const DerivCountryConsentChangedState(
    List<DerivResidenceModel> countries, {
    DerivResidenceModel? selectedCountry,
    bool? selectedCountryRequiresConsent,
    bool? agreedToTerms,
  }) : super(
          countries: countries,
          selectedCountry: selectedCountry,
          agreedToTerms: agreedToTerms ?? false,
          selectedCountryRequiresConsent:
              selectedCountryRequiresConsent ?? false,
        );
}
