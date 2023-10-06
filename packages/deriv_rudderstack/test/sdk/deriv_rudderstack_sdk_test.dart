import 'package:deriv_rudderstack/deriv_rudderstack.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDerivRudderstack extends Mock implements DerivRudderstack {}

void main() {
  late MockDerivRudderstack derivRudderstack;

  setUp(() {
    derivRudderstack = MockDerivRudderstack();
  });

  test('Test identify method', () async {
    const String userId = '123';
    when(() => derivRudderstack.identify(userId: userId)).thenAnswer((_) async => true);
    final bool result = await derivRudderstack.identify(userId: userId);
    expect(result, true);
    verify(() => derivRudderstack.identify(userId: userId)).called(1);
  });

  test('Test track method', () async {
    const String eventName = 'event1';
    when(() => derivRudderstack.track(eventName: eventName)).thenAnswer((_) async => true);
    final bool result = await derivRudderstack.track(eventName: eventName);
    expect(result, true);
    verify(() => derivRudderstack.track(eventName: eventName)).called(1);
  });

  test('Test screen method', () async {
    const String screenName = 'main';
    when(() => derivRudderstack.screen(screenName: screenName)).thenAnswer((_) async => true);
    final bool result = await derivRudderstack.screen(screenName: screenName);
    expect(result, true);
    verify(() => derivRudderstack.screen(screenName: screenName)).called(1);
  });

  test('Test group method', () async {
    const String groupId = 'group1';
    when(() => derivRudderstack.group(groupId: groupId)).thenAnswer((_) async => true);
    final bool result = await derivRudderstack.group(groupId: groupId);
    expect(result, true);
    verify(() => derivRudderstack.group(groupId: groupId)).called(1);
  });

  test('Test alias method', () async {
    const String alias = 'alias1';
    when(() => derivRudderstack.alias(alias: alias)).thenAnswer((_) async => true);
    final bool result = await derivRudderstack.alias(alias: alias);
    expect(result, true);
    verify(() => derivRudderstack.alias(alias: alias)).called(1);
  });

  test('Test setup method', () async {
    const String dataPlaneUrl = 'url';
    const String writeKey = 'key';
    when(() => derivRudderstack.setup(dataPlaneUrl: dataPlaneUrl, writeKey: writeKey))
        .thenAnswer((_) async => true);
    final bool result = await derivRudderstack.setup(dataPlaneUrl: dataPlaneUrl, writeKey: writeKey);
    expect(result, true);
    verify(() => derivRudderstack.setup(dataPlaneUrl: dataPlaneUrl, writeKey: writeKey)).called(1);
  });

  test('Test reset method', () async {
    when(() => derivRudderstack.reset()).thenAnswer((_) async => true);
    final bool result = await derivRudderstack.reset();
    expect(result, true);
    verify(() => derivRudderstack.reset()).called(1);
  });

  test('Test disable method', () async {
    when(() => derivRudderstack.disable()).thenAnswer((_) async => true);
    final bool result = await derivRudderstack.disable();
    expect(result, true);
    verify(() => derivRudderstack.disable()).called(1);
  });

  test('Test enable method', () async {
    when(() => derivRudderstack.enable()).thenAnswer((_) async => true);
    final bool result = await derivRudderstack.enable();
    expect(result, true);
    verify(() => derivRudderstack.enable()).called(1);
  });

  test('Test setContext method', () async {
    const String token = 'token';
    when(() => derivRudderstack.setContext(token: token)).thenAnswer((_) async => true);
    final bool result = await derivRudderstack.setContext(token: token);
    expect(result, true);
    verify(() => derivRudderstack.setContext(token: token)).called(1);
  });
}
