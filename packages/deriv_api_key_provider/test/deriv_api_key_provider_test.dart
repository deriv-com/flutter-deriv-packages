import 'package:flutter_test/flutter_test.dart';

import 'package:deriv_api_key_provider/native_app_token.dart';

void main() {
  test(
    'test development api token getter.',
    () => expect(developmentAppToken, 'deriv_api_development_token'),
  );

  test(
    'test production api token getter.',
    () => expect(productionAppToken, 'deriv_api_production_seed'),
  );
}
