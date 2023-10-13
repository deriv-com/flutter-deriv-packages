import 'package:deriv_auth/deriv_auth.dart';
import 'package:test/test.dart';

void main() {
  group('LinkToItem', () {
    const LinkedToItem linkedToItem = LinkedToItem(
      loginid: 'loginid',
      platform: PlatformEnum.dwallet,
    );

    test('has valid copyWith', () {
      expect(
        linkedToItem.copyWith(loginid: 'loginid2').loginid,
        'loginid2',
      );
      expect(
        linkedToItem.copyWith(platform: PlatformEnum.dtrade).platform,
        PlatformEnum.dtrade,
      );
    });

    test('has valid toJson', () {
      expect(
        linkedToItem.toJson(),
        <String, dynamic>{
          'loginid': 'loginid',
          'platform': 'dwallet',
        },
      );
    });

    test('has a valid fromJson', () {
      final LinkedToItem fromJsonResult =
          LinkedToItem.fromJson(<String, dynamic>{
        'loginid': 'loginid',
        'platform': 'dwallet',
      });

      expect(fromJsonResult.platform, linkedToItem.platform);
      expect(fromJsonResult.loginid, linkedToItem.loginid);
    });
  });
}
