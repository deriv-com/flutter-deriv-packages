import 'package:analytics/sdk/rudderstack/sdk/deriv_rudderstack_sdk.dart';
import 'package:deriv_passkeys/src/data/repositories/passkey_analytics_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

final class MockDerivRudderstack extends Mock implements DerivRudderstack {}

void main() {
  group('AnalyticsRepository test.', () {
    /// [AnalyticsRepository] instance.
    late final AnalyticsRepository analyticsRepository;

    /// [MockDerivRudderstack] instance.
    late final MockDerivRudderstack mockDerivRudderstack;

    setUpAll(() {
      mockDerivRudderstack = MockDerivRudderstack();

      when(() => mockDerivRudderstack.track(
            eventName: any(named: 'eventName'),
            properties: any(named: 'properties'),
          )).thenAnswer(
        (_) => Future<bool>.value(true),
      );

      AnalyticsRepository.init(
        'test',
        derivRudderstack: mockDerivRudderstack,
      );

      analyticsRepository = AnalyticsRepository.instance;
    });

    test('should track opening effortlessLoginPage.', () {
      analyticsRepository.trackOpenEffortlessLoginPage();

      verify(() => mockDerivRudderstack.track(
            eventName: any(named: 'eventName'),
            properties: any(named: 'properties'),
          )).called(1);
    });

    test('should track closing effortlessLoginPage.', () {
      analyticsRepository.trackCloseEffortlessLoginPage();

      verify(() => mockDerivRudderstack.track(
            eventName: any(named: 'eventName'),
            properties: any(named: 'properties'),
          )).called(1);
    });

    test('should track maybe later is pressed.', () {
      analyticsRepository.trackMaybeLater();

      verify(() => mockDerivRudderstack.track(
            eventName: any(named: 'eventName'),
            properties: any(named: 'properties'),
          )).called(1);
    });

    test('should track opening learn more page.', () {
      analyticsRepository.trackOpenLearnMorePage();

      verify(() => mockDerivRudderstack.track(
            eventName: any(named: 'eventName'),
            properties: any(named: 'properties'),
          )).called(1);
    });

    test('should track closing learn more page.', () {
      analyticsRepository.trackCloseLearnMorePage();

      verify(() => mockDerivRudderstack.track(
            eventName: any(named: 'eventName'),
            properties: any(named: 'properties'),
          )).called(1);
    });

    test('should track opening manage passkeys page.', () {
      analyticsRepository.trackOpenManagePasskeysPage();

      verify(() => mockDerivRudderstack.track(
            eventName: any(named: 'eventName'),
            properties: any(named: 'properties'),
          )).called(1);
    });

    test('should track closing manage passkeys page.', () {
      analyticsRepository.trackCloseManagePasskeysPage();

      verify(() => mockDerivRudderstack.track(
            eventName: any(named: 'eventName'),
            properties: any(named: 'properties'),
          )).called(1);
    });

    test('should track create passkey.', () {
      analyticsRepository.trackCreatePasskey();

      verify(() => mockDerivRudderstack.track(
            eventName: any(named: 'eventName'),
            properties: any(named: 'properties'),
          )).called(1);
    });
    test('should track passkey error.', () {
      analyticsRepository.trackPasskeyError('error message');

      verify(() => mockDerivRudderstack.track(
            eventName: any(named: 'eventName'),
            properties: any(named: 'properties'),
          )).called(1);
    });

    test('should track continue trading.', () {
      analyticsRepository.trackContinueTrading();

      verify(() => mockDerivRudderstack.track(
            eventName: any(named: 'eventName'),
            properties: any(named: 'properties'),
          )).called(1);
    });

    test('should track add more passkeys.', () {
      analyticsRepository.trackAddMorePasskeys();

      verify(() => mockDerivRudderstack.track(
            eventName: any(named: 'eventName'),
            properties: any(named: 'properties'),
          )).called(1);
    });

    test('should track create passkey success.', () {
      analyticsRepository.trackCreatePasskeySuccess();

      verify(() => mockDerivRudderstack.track(
            eventName: any(named: 'eventName'),
            properties: any(named: 'properties'),
          )).called(1);
    });

    test('should track rename passkey.', () {
      analyticsRepository.trackRenamePasskey();

      verify(() => mockDerivRudderstack.track(
            eventName: any(named: 'eventName'),
            properties: any(named: 'properties'),
          )).called(1);
    });

    test('should track cancel rename passkey.', () {
      analyticsRepository.trackCancelRenamePasskey();

      verify(() => mockDerivRudderstack.track(
            eventName: any(named: 'eventName'),
            properties: any(named: 'properties'),
          )).called(1);
    });

    test('should track rename passkey success.', () {
      analyticsRepository.trackRenamePasskeySuccess();

      verify(() => mockDerivRudderstack.track(
            eventName: any(named: 'eventName'),
            properties: any(named: 'properties'),
          )).called(1);
    });
  });
}
