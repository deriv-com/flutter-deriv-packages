import 'package:deriv_auth_ui/src/features/signup/repositories/deriv_country_selection_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:deriv_auth_ui/src/features/signup/models/deriv_residence_model.dart';

part 'deriv_country_selection_state.dart';

/// Cubit to handle country selection screen.
class DerivCountrySelectionCubit
    extends Cubit<DerivCountrySelectionState> {
  /// Constructor for CountrySelectionCubit.
  DerivCountrySelectionCubit(this.repository)
      : super(const DerivCountrySelectionInitialState());

  final DerivCountrySelectionRepository repository;

  /// Fetches residence countries.
  Future<void> fetchResidenceCounties() async {
    final List<DerivResidenceModel> countries =
        await repository.fetchCountries();

    final List<DerivResidenceModel> filteredCountries = countries
        .where(
          (country) => _isAllowedCountry(country),
        )
        .toList();

    emit(DerivCountrySelectionLoadedState(filteredCountries));
  }

  bool _isAllowedCountry(DerivResidenceModel country) =>
      _notAllowedCountryCodes
          .every((String countryCode) => country.code != countryCode);

  static final List<String> _notAllowedCountryCodes = <String>[
    // MF country codes.
    'de',
    'es',
    'fr',
    'gr',
    'it',
    'lu',
    'mf',
    // MLT country codes.
    'at',
    'be',
    'bg',
    'cy',
    'cz',
    'dk',
    'ee',
    'fi',
    'hr',
    'hu',
    'ie',
    'lt',
    'lv',
    'nl',
    'pl',
    'pt',
    'ro',
    'se',
    'si',
    'sk',
    // MX country codes.
    'gb',
    'im'
  ];
}
