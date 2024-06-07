/// [BasePasskeyAnalyticsRepository] defines the interface for analytics repositories.
abstract class BasePasskeyAnalyticsRepository {
  /// Track opening effortless login page.
  void trackOpenEffortlessLoginPage();

  /// Track closing effortless login page.
  void trackCloseEffortlessLoginPage();

  /// Track pressing maybe later button.
  void trackMaybeLater();

  /// Track opening learn more page.
  void trackOpenLearnMorePage();

  /// Track closing learn more page.
  void trackCloseLearnMorePage();

  /// Track opening manage passkeys page.
  void trackOpenManagePasskeysPage();

  /// Track closing manage passkeys page.
  void trackCloseManagePasskeysPage();

  /// Track pressing create passkey button.
  void trackCreatePasskey();

  /// Track create passkey success.
  void trackCreatePasskeySuccess();

  /// Track passkey error.
  void trackPasskeyError(String errorMessage);

  /// Track pressing continue trading button.
  void trackContinueTrading();

  /// Track pressing add more passkeys button.
  void trackAddMorePasskeys();

  /// Track pressing rename passkey button.
  void trackRenamePasskey();

  /// Track cancel rename passkey.
  void trackCancelRenamePasskey();

  /// Track rename passkey success.
  void trackRenamePasskeySuccess();
}
