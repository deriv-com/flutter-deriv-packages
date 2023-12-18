import 'package:deriv_auth/core/services/token/models/login_request.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('GetTokensRequestModel', () {
    test('supports value equality', () {
      expect(GetTokensRequestModel(appId: 1), GetTokensRequestModel(appId: 1));
    });

    test('has valid copyWith', () {
      expect(GetTokensRequestModel(appId: 1).copyWith(appId: 2),
          GetTokensRequestModel(appId: 2));
    });
  });
}
