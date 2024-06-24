import 'package:analytics/sdk/rudderstack/sdk/deriv_rudderstack_sdk.dart';
import 'package:deriv_passkeys/src/data/repositories/passkey_analytics_repository.dart';
import 'package:deriv_passkeys/src/presentation/mixins/passkey_event_tracking_mixin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

final class MockDerivRudderstack extends Mock implements DerivRudderstack {}

// class AnalyticsMixinObject = Object with AnalyticsMixin;

class AnalyticsMixinObject with PasskeyEventTrackingMixin {}

void main() {
  group('Analytics mixin tests:\n', () {
    late final MockDerivRudderstack mockRudderStack;
    late final AnalyticsMixinObject analyticsMixin;

    setUpAll(() {
      analyticsMixin = AnalyticsMixinObject();
      mockRudderStack = MockDerivRudderstack();

      AnalyticsRepository.init(
        'test',
        derivRudderstack: mockRudderStack,
      );
      when(
        () => mockRudderStack.track(
          eventName: any(named: 'eventName'),
          properties: any(named: 'properties'),
        ),
      ).thenAnswer(
        (_) => Future<bool>.value(true),
      );
    });

    test('Analytics mixin has a AnalyticsRepository parameter.', () {
      expect(
        analyticsMixin.analyticsRepository,
        AnalyticsRepository.instance,
      );
    });

    test('should track opening effortlessLoginPage.', () {
      analyticsMixin.trackOpenEffortlessLoginPage();

      verify(() => AnalyticsRepository.instance.trackOpenEffortlessLoginPage())
          .called(1);
    });

    test('should track closing effortlessLoginPage.', () {
      analyticsMixin.trackCloseEffortlessLoginPage();

      verify(() => AnalyticsRepository.instance.trackCloseEffortlessLoginPage())
          .called(1);
    });

    test('should track maybe later is pressed.', () {
      analyticsMixin.trackMaybeLater();

      verify(() => AnalyticsRepository.instance.trackMaybeLater()).called(1);
    });

    test('should track opening learn more page.', () {
      analyticsMixin.trackOpenLearnMorePage();

      verify(() => AnalyticsRepository.instance.trackOpenLearnMorePage())
          .called(1);
    });

    test('should track closing learn more page.', () {
      analyticsMixin.trackCloseLearnMorePage();

      verify(() => AnalyticsRepository.instance.trackCloseLearnMorePage())
          .called(1);
    });

    test('should track opening manage passkeys page.', () {
      analyticsMixin.trackOpenManagePasskeysPage();

      verify(() => AnalyticsRepository.instance.trackOpenManagePasskeysPage())
          .called(1);
    });

    test('should track closing manage passkeys page.', () {
      analyticsMixin.trackCloseManagePasskeysPage();

      verify(() => AnalyticsRepository.instance.trackCloseManagePasskeysPage())
          .called(1);
    });

    test('should track create passkey.', () {
      analyticsMixin.trackCreatePasskey();

      verify(() => AnalyticsRepository.instance.trackCreatePasskey()).called(1);
    });

    test('should track create passkey success.', () {
      analyticsMixin.trackCreatePasskeySuccess();

      verify(() => AnalyticsRepository.instance.trackCreatePasskeySuccess())
          .called(1);
    });

    test('should track passkey error.', () {
      analyticsMixin.trackPasskeyError('error message');

      verify(() =>
              AnalyticsRepository.instance.trackPasskeyError('error message'))
          .called(1);
    });

    test('should track continue trading.', () {
      analyticsMixin.trackContinueTrading();

      verify(() => AnalyticsRepository.instance.trackContinueTrading())
          .called(1);
    });

    test('should track add more passkeys.', () {
      analyticsMixin.trackAddMorePasskeys();

      verify(() => AnalyticsRepository.instance.trackAddMorePasskeys())
          .called(1);
    });

    test('should track rename passkey.', () {
      analyticsMixin.trackRenamePasskey();

      verify(() => AnalyticsRepository.instance.trackRenamePasskey()).called(1);
    });

    test('should track cancel rename passkey.', () {
      analyticsMixin.trackCancelRenamePasskey();

      verify(() => AnalyticsRepository.instance.trackCancelRenamePasskey())
          .called(1);
    });

    test('should track rename passkey success.', () {
      analyticsMixin.trackRenamePasskeySuccess();

      verify(() => AnalyticsRepository.instance.trackRenamePasskeySuccess())
          .called(1);
    });
  });
}
