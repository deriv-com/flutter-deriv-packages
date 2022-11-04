import 'package:flutter_test/flutter_test.dart';

import 'package:deriv_api_key_provider/native_app_token.dart';

void main() {
  test(
    'test api token getter.',
    () async {
      final String token = await appToken;

      expect(token, 'PRODUCTION_DERIV_API_TOKEN_SEED');
    },
  );

  test(
    'test rska getter.',
    () async {
      final String token = await appRSKA;

      expect(token, 'PRODUCTION_RSKA');
    },
  );

  test(
    'test rski getter.',
    () async {
      final String token = await appRSKI;

      expect(token, 'PRODUCTION_RSKI');
    },
  );
}
