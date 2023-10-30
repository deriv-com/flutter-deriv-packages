import 'package:analytics/sdk/rudderstack/core/rudderstack_configuration.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('RudderstackConfiguration', () {
    test('RudderstackConfiguration', () {
      const String dataPlaneUrl = 'https://test.dataplane.rudderstack.com';
      const String writeKey = 'test_write_key';
      const RudderstackConfiguration config = RudderstackConfiguration(
        dataPlaneUrl: dataPlaneUrl,
        writeKey: writeKey,
      );

      expect(config.dataPlaneUrl, dataPlaneUrl);
      expect(config.writeKey, writeKey);
    });
  });
}
