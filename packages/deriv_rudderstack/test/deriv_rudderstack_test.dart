import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:deriv_rudderstack/deriv_rudderstack.dart';

void main() {
  const MethodChannel channel = MethodChannel('deriv_rudderstack');
  late List<MethodCall> log;

  const String userId = '999';
  const String token = 'xxx-xxx-xxx';
  const String eventName = 'APP OPENED';
  const String screenName = 'Main';
  const String groupId = 'a99';
  const String alias = 'xyz';

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    log = <MethodCall>[];
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      log.add(methodCall);
      return true;
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
    log.clear();
  });

  group('Rudderstack plugin tests =>', () {
    test('perform identify call', () async {
      final bool response = await DerivRudderstack().identify(userId: userId);

      expect(response, isTrue);
    });

    test('passes userId argument correctly to identify.', () async {
      await DerivRudderstack().identify(userId: userId);

      expect(log, <Matcher>[
        isMethodCall('identify', arguments: <String, dynamic>{
          'userId': userId,
          'traits': <String, dynamic>{}
        }),
      ]);
    });

    test('perform setContext call', () async {
      final bool response = await DerivRudderstack().setContext(token: token);

      expect(response, isTrue);
    });

    test('passes token argument correctly to setContext.', () async {
      await DerivRudderstack().setContext(token: token);

      expect(log, <Matcher>[
        isMethodCall('setContext',
            arguments: <String, dynamic>{'pushToken': token}),
      ]);
    });

    test('perform track call', () async {
      final bool response =
          await DerivRudderstack().track(eventName: eventName);

      expect(response, isTrue);
    });

    test('passes eventName argument correctly to track.', () async {
      await DerivRudderstack().track(eventName: eventName);

      expect(log, <Matcher>[
        isMethodCall('track', arguments: <String, dynamic>{
          'eventName': eventName,
          'properties': <String, dynamic>{}
        }),
      ]);
    });

    test('perform screen call', () async {
      final bool response =
          await DerivRudderstack().screen(screenName: screenName);

      expect(response, isTrue);
    });

    test('passes screenName argument correctly to screen.', () async {
      await DerivRudderstack().screen(screenName: screenName);

      expect(log, <Matcher>[
        isMethodCall('screen', arguments: <String, dynamic>{
          'screenName': screenName,
          'properties': <String, dynamic>{}
        }),
      ]);
    });

    test('perform group call', () async {
      final bool response = await DerivRudderstack().group(groupId: groupId);

      expect(response, isTrue);
    });

    test('passes groupId argument correctly to group.', () async {
      await DerivRudderstack().group(groupId: groupId);

      expect(log, <Matcher>[
        isMethodCall('group', arguments: <String, dynamic>{
          'groupId': groupId,
          'traits': <String, dynamic>{}
        }),
      ]);
    });

    test('perform alias call', () async {
      final bool response = await DerivRudderstack().alias(alias: alias);

      expect(response, isTrue);
    });

    test('passes alias argument correctly to alias.', () async {
      await DerivRudderstack().alias(alias: alias);

      expect(log, <Matcher>[
        isMethodCall('alias', arguments: <String, dynamic>{'alias': alias}),
      ]);
    });

    test('perform reset call', () async {
      final bool response = await DerivRudderstack().reset();

      expect(response, isTrue);
    });

    test('perform enable call', () async {
      final bool response = await DerivRudderstack().enable();

      expect(response, isTrue);
    });

    test('perform disable call', () async {
      final bool response = await DerivRudderstack().disable();

      expect(response, isTrue);
    });
  });
}
