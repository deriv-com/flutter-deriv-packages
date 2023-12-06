import 'package:test/test.dart';

import '../mocks/mock_social_auth_dto.dart';

void main() {
  group('SocialAuthDto', () {
    test('supports toJson', () {
      final Map<String, dynamic> json = mockSocialAuthDto.toJson();

      expect(json, equals(mockSocialAuthDtoJson));
    });
  });
}
