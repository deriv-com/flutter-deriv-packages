part of 'deriv_country_selection_cubit.dart';

/// Country selection state
abstract class DerivCountrySelectionState {
  /// Initialize country selection state.
  const DerivCountrySelectionState(this.countries);

  /// List of countries.
  final List<DerivResidenceModel> countries;
}

/// Initial state.
class DerivCountrySelectionInitialState
    extends DerivCountrySelectionState {
  /// Initializes initial state.
  const DerivCountrySelectionInitialState()
      : super(const <DerivResidenceModel>[]);
}

/// Country list loaded state.
class DerivCountrySelectionLoadedState
    extends DerivCountrySelectionState {
  /// Initialize country list loaded state
  const DerivCountrySelectionLoadedState(
      List<DerivResidenceModel> countries)
      : super(countries);
}
