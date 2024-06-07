import 'package:deriv_passkeys/src/data/repositories/passkey_analytics_repository.dart';
import 'package:deriv_passkeys/src/domain/base_repositories/base_passkey_analytics_repository.dart';
import 'package:flutter/foundation.dart';

/// Mixin that provides analytics tracking functions.
mixin PasskeyEventTrackingMixin implements BasePasskeyAnalyticsRepository {
  /// The analytics repository.
  @visibleForTesting
  BasePasskeyAnalyticsRepository get analyticsRepository =>
      AnalyticsRepository.instance;

  /// Track opening effortless login page.
  @override
  void trackOpenEffortlessLoginPage() =>
      analyticsRepository.trackOpenEffortlessLoginPage();

  /// Track closing effortless login page.
  @override
  void trackCloseEffortlessLoginPage() =>
      analyticsRepository.trackCloseEffortlessLoginPage();

  /// Track pressing maybe later button.
  @override
  void trackMaybeLater() => analyticsRepository.trackMaybeLater();

  /// Track opening learn more page.
  @override
  void trackOpenLearnMorePage() => analyticsRepository.trackOpenLearnMorePage();

  /// Track closing learn more page.
  @override
  void trackCloseLearnMorePage() =>
      analyticsRepository.trackCloseLearnMorePage();

  /// Track opening manage passkeys page.
  @override
  void trackOpenManagePasskeysPage() =>
      analyticsRepository.trackOpenManagePasskeysPage();

  /// Track closing manage passkeys page.
  @override
  void trackCloseManagePasskeysPage() =>
      analyticsRepository.trackCloseManagePasskeysPage();

  /// Track pressing create passkey button.
  @override
  void trackCreatePasskey() => analyticsRepository.trackCreatePasskey();

  /// Track create passkey success.
  @override
  void trackCreatePasskeySuccess() =>
      analyticsRepository.trackCreatePasskeySuccess();

  /// Track passkey error.
  @override
  void trackPasskeyError(String errorMessage) =>
      analyticsRepository.trackPasskeyError(errorMessage);

  /// Track pressing continue trading button.
  @override
  void trackContinueTrading() => analyticsRepository.trackContinueTrading();

  /// Track pressing add more passkeys button.
  @override
  void trackAddMorePasskeys() => analyticsRepository.trackAddMorePasskeys();

  /// Track pressing rename passkey button.
  @override
  void trackRenamePasskey() => analyticsRepository.trackRenamePasskey();

  /// Track cancel rename passkey.
  @override
  void trackCancelRenamePasskey() =>
      analyticsRepository.trackCancelRenamePasskey();

  /// Track rename passkey success.
  @override
  void trackRenamePasskeySuccess() =>
      analyticsRepository.trackRenamePasskeySuccess();
}
