import 'package:flutter_test/flutter_test.dart';

import 'package:deriv_api_key_provider/native_app_token.dart';

void main() {
  test(
    'test development api token getter.',
    () => expect(developmentAppToken, 'DERIV_API_TOKEN'),
  );

  test(
    'test production api token getter.',
    () => expect(productionAppToken, 'PRODUCTION_DERIV_API_TOKEN_SEED'),
  );
}
