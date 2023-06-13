
import 'package:bloc_test/bloc_test.dart';
import 'package:deriv_auth_ui/deriv_auth_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDerivCountrySelectionRepository extends Mock
    implements DerivCountrySelectionRepository {}

void main() {
  group('DerivCountrySelectionCubit', () {
    late MockDerivCountrySelectionRepository repository;
    late DerivCountrySelectionCubit cubit;

    setUp(() {
      repository = MockDerivCountrySelectionRepository();
      cubit = DerivCountrySelectionCubit(repository);
    });

    test('initial state is DerivCountrySelectionInitialState', () {
      expect(cubit.state, const DerivCountrySelectionInitialState());
    });

    blocTest<DerivCountrySelectionCubit, DerivCountrySelectionState>(
      'emits DerivCountrySelectionLoadedState with filtered countries when fetchResidenceCounties is called',
      build: () {
        final countries = [
          const DerivResidenceModel(code: 'us', name: 'United States', isDisabled: false),
          const DerivResidenceModel(code: 'fr', name: 'France', isDisabled: false),
          const DerivResidenceModel(code: 'de', name: 'Germany', isDisabled: false),
        ];
        when(() => repository.fetchCountries()).thenAnswer((_) async => countries);
        return cubit;
      },
      act: (cubit) => cubit.fetchResidenceCounties(),
      expect: () => [
        const DerivCountrySelectionLoadedState([
          DerivResidenceModel(code: 'us', name: 'United States', isDisabled: false),
        ]),
      ],
    );
  });
}
