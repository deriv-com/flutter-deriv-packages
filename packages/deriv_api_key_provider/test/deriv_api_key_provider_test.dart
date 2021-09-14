import 'package:flutter_test/flutter_test.dart';

import 'package:deriv_api_key_provider/native_app_token.dart';

void main() {
  test('test getAppToken method.', () {
    expect(getAppToken(isDebug: true), 'deriv_api_token');
  });
}
