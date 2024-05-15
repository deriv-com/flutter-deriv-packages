// ignore_for_file: always_specify_types

import 'package:bloc_test/bloc_test.dart';
import 'package:deriv_auth_ui/deriv_auth_ui.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DerivCountrySelectionCubit', () {
    late DerivCountrySelectionCubit countrySelectionCubit;
    late List<DerivResidenceModel> countriesList;

    setUp(() {
      countriesList = [
        const DerivResidenceModel(
            code: 'us', name: 'United States', isDisabled: false),
        const DerivResidenceModel(
            code: 'br', name: 'Brazil', isDisabled: false),
        const DerivResidenceModel(
            code: 'fr', name: 'France', isDisabled: false),
        const DerivResidenceModel(
            code: 'de', name: 'Germany', isDisabled: false),
      ];

      countrySelectionCubit =
          DerivCountrySelectionCubit(Future.value(countriesList));
    });

    blocTest<DerivCountrySelectionCubit, DerivCountrySelectionState>(
        'Initial states is [DerivCountrySelectionInitialState]',
        build: () => countrySelectionCubit,
        verify: (DerivCountrySelectionCubit cubit) {
          expect(
            cubit.state,
            isA<DerivCountrySelectionInitialState>(),
          );
        });

    blocTest<DerivCountrySelectionCubit, DerivCountrySelectionState>(
        'Verify cubit emits the right states by loading country list',
        build: () => countrySelectionCubit,
        act: (DerivCountrySelectionCubit cubit) =>
            countrySelectionCubit.fetchResidenceCountries(),
        verify: (DerivCountrySelectionCubit cubit) {
          expect(
            cubit.state,
            isA<DerivCountrySelectionLoadedState>(),
          );
        });

    blocTest<DerivCountrySelectionCubit, DerivCountrySelectionState>(
        'Verify cubit emits the right states by changing the country selection.',
        build: () => countrySelectionCubit,
        seed: () => DerivCountrySelectionLoadedState(countriesList),
        act: (DerivCountrySelectionCubit cubit) => cubit.changeSelectedCountry(
              selectedCountry: countriesList[0],
            ),
        verify: (DerivCountrySelectionCubit cubit) {
          expect(
            countrySelectionCubit.state,
            isA<DerivCountryChangedState>(),
          );

          expect(
            countrySelectionCubit.state.selectedCountry?.code,
            countriesList[0].code,
          );
        });

    blocTest<DerivCountrySelectionCubit, DerivCountrySelectionState>(
        'Verify cubit emits the right states when it changing the consent status(Checkbox).',
        build: () => countrySelectionCubit,
        seed: () => DerivCountrySelectionLoadedState(countriesList),
        act: (DerivCountrySelectionCubit cubit) {
          cubit
            ..changeSelectedCountry(
              selectedCountry: const DerivResidenceModel(
                  code: 'br', name: 'Brazil', isDisabled: false),
            )
            ..updateCountryConsentStatus(
              agreedToTerms: !cubit.state.agreedToTerms,
            );
        },
        verify: (DerivCountrySelectionCubit cubit) {
          expect(
            cubit.state,
            isA<DerivCountryConsentChangedState>(),
          );

          expect(
            cubit.state.selectedCountryRequiresConsent,
            true,
          );

          expect(
            cubit.state.agreedToTerms,
            true,
          );
        });
  });
}
