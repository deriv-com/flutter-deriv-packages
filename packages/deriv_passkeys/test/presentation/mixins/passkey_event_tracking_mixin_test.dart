import 'package:deriv_passkeys/src/data/repositories/passkey_analytics_repository.dart';
import 'package:deriv_passkeys/src/presentation/mixins/passkey_event_tracking_mixin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

final class MockAnalyticsRepository extends Mock
    implements AnalyticsRepository {}

// class AnalyticsMixinObject = Object with AnalyticsMixin;

class AnalyticsMixinObject with PasskeyEventTrackingMixin {}

void main() {
  group('Analytics mixin tests:\n', () {
    late final MockAnalyticsRepository mockRepository;
    late final AnalyticsMixinObject analyticsMixin;

    setUpAll(() {
      mockRepository = MockAnalyticsRepository();
      when(() => mockRepository.trackOpenEffortlessLoginPage())
          .thenAnswer((_) async {});
      when(() => mockRepository.trackOpenLearnMorePage()).thenAnswer((_) {});

      AnalyticsRepository.initForTesting(mockRepository);

      analyticsMixin = AnalyticsMixinObject();
    });

    test('Analytics mixin has a AnalyticsRepository parameter.', () {
      final AnalyticsMixinObject analyticsMixin = AnalyticsMixinObject();

      expect(analyticsMixin.analyticsRepository, mockRepository);
    });

    test('should track opening effortlessLoginPage.', () {
      analyticsMixin.trackOpenEffortlessLoginPage();

      verify(() => mockRepository.trackOpenEffortlessLoginPage()).called(1);
    });

    test('should track closing effortlessLoginPage.', () {
      analyticsMixin.trackCloseEffortlessLoginPage();

      verify(() => mockRepository.trackCloseEffortlessLoginPage()).called(1);
    });

    test('should track maybe later is pressed.', () {
      analyticsMixin.trackMaybeLater();

      verify(() => mockRepository.trackMaybeLater()).called(1);
    });

    test('should track opening learn more page.', () {
      analyticsMixin.trackOpenLearnMorePage();

      verify(() => mockRepository.trackOpenLearnMorePage()).called(1);
    });

    test('should track closing learn more page.', () {
      analyticsMixin.trackCloseLearnMorePage();

      verify(() => mockRepository.trackCloseLearnMorePage()).called(1);
    });

    test('should track opening manage passkeys page.', () {
      analyticsMixin.trackOpenManagePasskeysPage();

      verify(() => mockRepository.trackOpenManagePasskeysPage()).called(1);
    });

    test('should track closing manage passkeys page.', () {
      analyticsMixin.trackCloseManagePasskeysPage();

      verify(() => mockRepository.trackCloseManagePasskeysPage()).called(1);
    });

    test('should track create passkey.', () {
      analyticsMixin.trackCreatePasskey();

      verify(() => mockRepository.trackCreatePasskey()).called(1);
    });

    test('should track create passkey success.', () {
      analyticsMixin.trackCreatePasskeySuccess();

      verify(() => mockRepository.trackCreatePasskeySuccess()).called(1);
    });

    test('should track passkey error.', () {
      analyticsMixin.trackPasskeyError('error message');

      verify(() => mockRepository.trackPasskeyError('error message')).called(1);
    });

    test('should track continue trading.', () {
      analyticsMixin.trackContinueTrading();

      verify(() => mockRepository.trackContinueTrading()).called(1);
    });

    test('should track add more passkeys.', () {
      analyticsMixin.trackAddMorePasskeys();

      verify(() => mockRepository.trackAddMorePasskeys()).called(1);
    });

    test('should track rename passkey.', () {
      analyticsMixin.trackRenamePasskey();

      verify(() => mockRepository.trackRenamePasskey()).called(1);
    });

    test('should track cancel rename passkey.', () {
      analyticsMixin.trackCancelRenamePasskey();

      verify(() => mockRepository.trackCancelRenamePasskey()).called(1);
    });

    test('should track rename passkey success.', () {
      analyticsMixin.trackRenamePasskeySuccess();

      verify(() => mockRepository.trackRenamePasskeySuccess()).called(1);
    });
  });
}
