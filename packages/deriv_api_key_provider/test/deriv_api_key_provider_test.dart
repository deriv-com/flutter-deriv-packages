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
    'test rsk getter.',
    () async {
      final String token = await appRSK;

      expect(token, 'PRODUCTION_RSK');
    },
  );
}
