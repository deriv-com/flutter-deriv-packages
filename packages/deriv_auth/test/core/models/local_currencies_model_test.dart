import 'package:deriv_auth/deriv_auth.dart';
import 'package:test/test.dart';

void main() {
  const LocalCurrenciesPropertyEntity mockLocalCurrenciesPropertyEntity =
      LocalCurrenciesPropertyEntity(fractionalDigits: 123);
  const Map<String, dynamic> mockLocalCurrenciesPropertyEntityJson =
      <String, dynamic>{'fractional_digits': 123};

  group('LocalCurrenciesPropertyEntity', () {
    test(
      'supports fromJson',
      () => expect(
        LocalCurrenciesPropertyEntity.fromJson(
            mockLocalCurrenciesPropertyEntityJson),
        isA<LocalCurrenciesPropertyEntity>().having(
          (LocalCurrenciesPropertyEntity x) => x.fractionalDigits,
          'fractionalDigits',
          123,
        ),
      ),
    );

    test(
      'supports toJson',
      () => expect(
        mockLocalCurrenciesPropertyEntity.toJson(),
        <String, dynamic>{'fractional_digits': 123},
      ),
    );

    test('has valid copyWith', () {
      expect(
        mockLocalCurrenciesPropertyEntity
            .copyWith(fractionalDigits: 456)
            .fractionalDigits,
        456,
      );
      expect(
        mockLocalCurrenciesPropertyEntity.copyWith().fractionalDigits,
        123,
      );
    });
  });
}
