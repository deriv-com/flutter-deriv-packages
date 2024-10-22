import 'package:analytics/core/logger.dart';
import 'package:analytics/sdk/rudderstack/core/rudderstack_configuration.dart';
import 'package:analytics/sdk/rudderstack/models/user_info.dart';
import 'package:analytics/sdk/rudderstack/sdk/deriv_rudderstack_sdk.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rudder_sdk_flutter/RudderController.dart';

class MockRudderController extends Mock implements RudderController {}

class MockLogger extends Mock implements Logger {}

void main() {
  late DerivRudderstack derivRudderstack;
  late MockRudderController mockRudderController;
  late MockLogger mockLogger;

  setUp(() {
    mockRudderController = MockRudderController();
    mockLogger = MockLogger();
    derivRudderstack = DerivRudderstack()
      ..rudderClient = mockRudderController
      ..logger = mockLogger;
  });

  group('DerivRudderstack', () {
    test('identify calls rudderClient.identify', () async {
      final UserInfo info = UserInfo(userId: 111);
      final bool result = await derivRudderstack.identify(userInfo: info);

      expect(result, isTrue);
    });

    test('track calls rudderClient.track', () async {
      const String eventName = 'test_event_name';
      const Map<String, dynamic> properties = <String, dynamic>{
        'action': 'open'
      };

      final bool result = await derivRudderstack.track(
        eventName: eventName,
        properties: properties, // Pass RudderProperty directly
      );

      expect(result, isTrue);
    });

    test('screen calls rudderClient.screen', () async {
      const String screenName = 'test_screen_name';

      final bool result = await derivRudderstack.screen(screenName: screenName);

      expect(result, isTrue);
      verify(() => mockRudderController.screen(screenName)).called(1);
    });

    test('group calls rudderClient.group', () async {
      const String groupId = 'test_group_id';

      final bool result = await derivRudderstack.group(groupId: groupId);

      expect(result, isTrue);
      verify(() => mockRudderController.group(groupId)).called(1);
    });

    test('alias calls rudderClient.alias', () async {
      const String alias = 'test_alias';

      final bool result = await derivRudderstack.alias(alias: alias);

      expect(result, isTrue);
      verify(() => mockRudderController.alias(alias)).called(1);
    });

    test('should call initialize with correct parameters', () async {
      const String dataPlaneUrl = 'https://test.dataplane.rudderstack.com';
      const String writeKey = 'test_write_key';

      await derivRudderstack.setup(const RudderstackConfiguration(
          dataPlaneUrl: dataPlaneUrl, writeKey: writeKey));
      verify(() => mockRudderController.initialize(writeKey,
          config: any(named: 'config'))).called(1);

      final bool result = await derivRudderstack.setup(
          const RudderstackConfiguration(
              dataPlaneUrl: dataPlaneUrl, writeKey: writeKey));

      expect(result, true);
    });

    test('should throw exception when initialize is called with wrong url',
        () async {
      const String dataPlaneUrl = 'wrong_url';
      const String writeKey = 'test_write_key';

      when(() => mockRudderController.initialize(any(),
          config: any(named: 'config'))).thenThrow(Exception());

      final bool result = await derivRudderstack.setup(
          const RudderstackConfiguration(
              dataPlaneUrl: dataPlaneUrl, writeKey: writeKey));

      expect(result, false);
    });

    test('reset calls rudderClient.reset', () async {
      final bool result = await derivRudderstack.reset();

      expect(result, isTrue);
      verify(() => mockRudderController.reset()).called(1);
    });

    test('disable calls rudderClient.optOut(true)', () async {
      final bool result = await derivRudderstack.disable();

      expect(result, isTrue);
      verify(() => mockRudderController.optOut(true)).called(1);
    });

    test('enable calls rudderClient.optOut(false)', () async {
      final bool result = await derivRudderstack.enable();

      expect(result, isTrue);
      verify(() => mockRudderController.optOut(false)).called(1);
    });

    test('setContext calls rudderClient.putDeviceToken', () async {
      const String token = 'test_token';

      final bool result = await derivRudderstack.setContext(token: token);

      expect(result, isTrue);
      verify(() => mockRudderController.putDeviceToken(token)).called(1);
    });
  });
}
