import 'package:deriv_passkeys/src/data/repositories/passkey_analytics_repository.dart';
import 'package:deriv_passkeys/src/domain/base_repositories/base_passkey_analytics_repository.dart';
import 'package:flutter/foundation.dart';

/// Mixin that provides analytics tracking functions.
mixin PasskeyEventTrackingMixin implements BasePasskeyAnalyticsRepository {
  /// The analytics repository.
  @visibleForTesting
  BasePasskeyAnalyticsRepository get analyticsRepository =>
      AnalyticsRepository.instance;

  @override
  void trackOpenEffortlessLoginPage() =>
      analyticsRepository.trackOpenEffortlessLoginPage();

  @override
  void trackCloseEffortlessLoginPage() =>
      analyticsRepository.trackCloseEffortlessLoginPage();

  @override
  void trackMaybeLater() => analyticsRepository.trackMaybeLater();

  @override
  void trackOpenLearnMorePage() => analyticsRepository.trackOpenLearnMorePage();

  @override
  void trackCloseLearnMorePage() =>
      analyticsRepository.trackCloseLearnMorePage();

  @override
  void trackOpenManagePasskeysPage() =>
      analyticsRepository.trackOpenManagePasskeysPage();

  @override
  void trackCloseManagePasskeysPage() =>
      analyticsRepository.trackCloseManagePasskeysPage();

  @override
  void trackCreatePasskey() => analyticsRepository.trackCreatePasskey();

  @override
  void trackCreatePasskeySuccess() =>
      analyticsRepository.trackCreatePasskeySuccess();

  @override
  void trackPasskeyError(String errorMessage) =>
      analyticsRepository.trackPasskeyError(errorMessage);

  @override
  void trackContinueTrading() => analyticsRepository.trackContinueTrading();

  @override
  void trackAddMorePasskeys() => analyticsRepository.trackAddMorePasskeys();

  @override
  void trackRenamePasskey() => analyticsRepository.trackRenamePasskey();

  @override
  void trackCancelRenamePasskey() =>
      analyticsRepository.trackCancelRenamePasskey();

  @override
  void trackRenamePasskeySuccess() =>
      analyticsRepository.trackRenamePasskeySuccess();
}
