import 'package:deriv_auth_ui/src/core/helpers/country_selection_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:deriv_auth_ui/src/features/signup/models/deriv_residence_model.dart';

part 'deriv_country_selection_state.dart';

/// Cubit to handle country selection screen.
class DerivCountrySelectionCubit extends Cubit<DerivCountrySelectionState> {
  /// Constructor for CountrySelectionCubit.
  DerivCountrySelectionCubit(this.residences)
      : super(const DerivCountrySelectionInitialState());

  /// List of residence countries.
  final Future<List<DerivResidenceModel>> residences;

  /// Fetches residence countries.
  Future<void> fetchResidenceCountries() async {
    final List<DerivResidenceModel> countries = await residences;

    final List<DerivResidenceModel> filteredCountries = countries
        .where(
          (DerivResidenceModel country) =>
              isAllowedCountry(countryCode: country.code),
        )
        .toList();

    emit(DerivCountrySelectionLoadedState(filteredCountries));
  }

  /// Changes the selected country and updates the state accordingly.
  ///
  /// If [selectedCountry] is not `null`, this method emits a [DerivCountryChangedState]
  /// with the updated selected country.
  ///
  /// This method does not perform any action if [selectedCountry] is `null`.
  Future<void> changeSelectedCountry({
    DerivResidenceModel? selectedCountry,
  }) async {
    if (selectedCountry != null) {
      emit(
        DerivCountryChangedState(
          state.countries,
          selectedCountry: selectedCountry,
          selectedCountryRequiresConsent: isConsentRequired(
            countryCode: selectedCountry.code,
          ),
        ),
      );
    }
  }

  /// Updates the country consent status and triggers a state change.
  ///
  /// [agreedToTerms]: Whether the user has agreed to the terms for the
  /// selected country.
  Future<void> updateCountryConsentStatus({bool? agreedToTerms = false}) async {
    emit(
      DerivCountryConsentChangedState(
        state.countries,
        selectedCountry: state.selectedCountry,
        selectedCountryRequiresConsent: state.selectedCountryRequiresConsent,
        agreedToTerms: agreedToTerms,
      ),
    );
  }
}
