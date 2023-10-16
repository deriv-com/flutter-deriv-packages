import 'package:deriv_rudderstack/core/logger.dart';
import 'package:deriv_rudderstack/sdk/deriv_rudderstack_sdk.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rudder_sdk_flutter/RudderController.dart';
import 'package:rudder_sdk_flutter_platform_interface/platform.dart';
import 'package:test/test.dart';

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
      const String userId = 'test_user_id';
      when(() => mockRudderController.identify(userId)).thenAnswer((_) async => true);

      final bool result = await derivRudderstack.identify(userId: userId);

      expect(result, isTrue);
      verify(() => mockRudderController.identify(userId)).called(1);
    });

    test('track calls rudderClient.track', () async {
      const String eventName = 'test_event_name';
      when(() => mockRudderController.track(eventName)).thenAnswer((_) async => true);

      final bool result = await derivRudderstack.track(eventName: eventName);

      expect(result, isTrue);
      verify(() => mockRudderController.track(eventName)).called(1);
    });

    test('screen calls rudderClient.screen', () async {
      const String screenName = 'test_screen_name';
      when(() => mockRudderController.screen(screenName)).thenAnswer((_) async => true);

      final bool result = await derivRudderstack.screen(screenName: screenName);

      expect(result, isTrue);
      verify(() => mockRudderController.screen(screenName)).called(1);
    });

    test('group calls rudderClient.group', () async {
      const String groupId = 'test_group_id';
      when(() => mockRudderController.group(groupId)).thenAnswer((_) async => true);

      final bool result = await derivRudderstack.group(groupId: groupId);

      expect(result, isTrue);
      verify(() => mockRudderController.group(groupId)).called(1);
    });

    test('alias calls rudderClient.alias', () async {
      const String alias = 'test_alias';
      when(() => mockRudderController.alias(alias)).thenAnswer((_) async => true);

      final bool result = await derivRudderstack.alias(alias: alias);

      expect(result, isTrue);
      verify(() => mockRudderController.alias(alias)).called(1);
    });

    test('setup calls rudderClient.initialize', () async {
      const String dataPlaneUrl = 'https://test.dataplane.rudderstack.com';
      const String writeKey = 'test_write_key';
      when(() => mockRudderController.initialize(writeKey, config: any(named: 'config')))
          .thenAnswer((_) async => true);

      final bool result = await derivRudderstack.setup(
        dataPlaneUrl: dataPlaneUrl,
        writeKey: writeKey
        );

      expect(result, isTrue);
      verify(() => mockRudderController.initialize(writeKey, config: any(named: 'config'))).called(1);
    });

    test('reset calls rudderClient.reset', () async {
      when(() => mockRudderController.reset()).thenAnswer((_) async => true);

      final bool result = await derivRudderstack.reset();

      expect(result, isTrue);
      verify(() => mockRudderController.reset()).called(1);
    });
 
    test('disable calls rudderClient.optOut(true)', () async {
      when(() => mockRudderController.optOut(true)).thenAnswer((_) async => true);

      final bool result = await derivRudderstack.disable();

      expect(result, isTrue);
      verify(() => mockRudderController.optOut(true)).called(1);
    });

    test('enable calls rudderClient.optOut(false)', () async {
      when(() => mockRudderController.optOut(false)).thenAnswer((_) async => true);

      final bool result = await derivRudderstack.enable();

      expect(result, isTrue);
      verify(() => mockRudderController.optOut(false)).called(1);
    });

    test('setContext calls rudderClient.putDeviceToken', () async {
      const String token = 'test_token';
      when(() => mockRudderController.putDeviceToken(token)).thenAnswer((_) async => true);

      final bool result = await derivRudderstack.setContext(token: token);

      expect(result, isTrue);
      verify(() => mockRudderController.putDeviceToken(token)).called(1);
    });

  });
}