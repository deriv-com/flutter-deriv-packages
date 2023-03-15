import 'package:deriv_auth/features/auth/models/logout/logout_response.dart';
import 'package:test/test.dart';

void main() {
  const int logoutJson = 0;
  group('LogoutResponseEntity', () {
    test('supports fromJson.', () {
      expect(
        LogoutResponseEntity.fromJson(logoutJson).logout,
        0,
      );
    });

    test('supports toJson.', () {
      expect(const LogoutResponseEntity(logout: 0).toJson(),
          <String, dynamic>{'logout': 0});
    });

    test('supports copyWith.', () {
      expect(
        const LogoutResponseEntity(logout: 0).copyWith(logout: 1).logout,
        1,
      );
    });
  });
}
