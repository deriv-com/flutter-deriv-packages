import 'package:bloc_test/bloc_test.dart';
import 'package:deriv_auth_ui/deriv_auth_ui.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DerivCountrySelectionCubit', () {
    late DerivCountrySelectionCubit cubit;

    setUp(() {
      final countries = [
        DerivResidenceModel(
            code: 'us', name: 'United States', isDisabled: false),
        DerivResidenceModel(code: 'fr', name: 'France', isDisabled: false),
        DerivResidenceModel(code: 'de', name: 'Germany', isDisabled: false),
      ];
      cubit = DerivCountrySelectionCubit(Future.value(countries));
    });

    test('initial state is DerivCountrySelectionInitialState', () {
      expect(cubit.state, const DerivCountrySelectionInitialState());
    });

    blocTest<DerivCountrySelectionCubit, DerivCountrySelectionState>(
      'emits DerivCountrySelectionLoadedState with filtered countries when fetchResidenceCounties is called',
      build: () => cubit,
      act: (cubit) => cubit.fetchResidenceCounties(),
      expect: () => [
        DerivCountrySelectionLoadedState([
          DerivResidenceModel(
              code: 'us', name: 'United States', isDisabled: false),
        ]),
      ],
    );
  });
}
