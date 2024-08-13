import 'deriv_passkeys_localizations.dart';

/// The translations for German (`de`).
class DerivPasskeysLocalizationsDe extends DerivPasskeysLocalizations {
  DerivPasskeysLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get passkeyCreatedSuccessTitle => 'Erfolg!';

  @override
  String passkeyCreatedSuccessMessage(String platformName) {
    return 'Ihr Konto ist jetzt mit einem Passkey gesichert. Verwalte deinen Passkey in deinen $platformName -Kontoeinstellungen.';
  }

  @override
  String get continueButtonText => 'Weiter';

  @override
  String get unexpectedError => 'Ein unerwarteter Fehler ist aufgetreten!';

  @override
  String get unexpectedErrorDescription => 'Bitte versuchen Sie es später erneut.';

  @override
  String get ok => 'Ok';

  @override
  String get experienceSaferLogins => 'Erleben Sie sicherere Logins';

  @override
  String get enhanceSecurity => 'Verbesserte Sicherheit ist nur einen Fingertipp entfernt.';

  @override
  String get here => 'hier';

  @override
  String get effortlessLogin => 'Müheloses Einloggen mit Passkeys';

  @override
  String get whatArePasskeys => 'Was sind Passkeys? ';

  @override
  String get whatArePasskeysDescriptionPoint1 => 'Sichere Alternative zu Passwörtern.';

  @override
  String get whatArePasskeysDescriptionPoint2 => 'Entsperren Sie Ihr Konto wie Ihr Telefon - mit biometrischen Daten, Gesichtsscan oder PIN.';

  @override
  String get whyPasskeys => 'Warum Passkeys?';

  @override
  String get whyPasskeysDescription1 => 'Zusätzliche Sicherheitsebene.';

  @override
  String get whyPasskeysDescription2 => 'Schützt vor unbefugtem Zugriff und Phishing.';

  @override
  String get howToCreatePasskey => 'Wie erstelle ich einen Passkey?';

  @override
  String get howToCreatePasskeyDescription1 => 'Gehen Sie zu \'Kontoeinstellungen\' auf Deriv.';

  @override
  String get howToCreatePasskeyDescription2 => 'Sie können einen Passkey pro Gerät erstellen.';

  @override
  String get p2pHowToCreatePasskey => 'Wie erstelle ich einen Passkey?';

  @override
  String get p2pHowToCreatePasskeyDescription1 => 'Gehen Sie in Ihrer Deriv P2P-App zu „Profil“.';

  @override
  String get p2pHowToCreatePasskeyDescription2 => 'Tippen Sie auf „Passkeys“, um Ihren Passkey zu erstellen.';

  @override
  String get whereArePasskeysSaved => 'Wo werden die Passkeys gespeichert?';

  @override
  String get whereArePasskeysSavedDescriptionAndroid => 'Android: Google Passwort-Manager.';

  @override
  String get whereArePasskeysSavedDescriptionIOS => 'iOS: iCloud-Schlüsselbund.';

  @override
  String get whatHappensIfEmailChanged => 'Was passiert, wenn die E-Mail-Adresse meines Deriv-Kontos geändert wird?';

  @override
  String get whatHappensIfEmailChangedDescription1 => 'Kein Problem! Ihr Passkey funktioniert noch.';

  @override
  String get whatHappensIfEmailChangedDescription2 => 'Melden Sie sich bei Deriv mit Ihrem bestehenden Passkey an.';

  @override
  String get tips => 'Tipps';

  @override
  String get beforeUsingPasskeys => 'Vor der Benutzung von Passkeys';

  @override
  String get enableScreenLock => 'Aktiviere die Bildschirmsperre auf deinem Gerät.';

  @override
  String get signInGoogleOrIcloud => 'Melde dich bei deinem Google- oder iCloud-Konto an.';

  @override
  String get enableBluetooth => 'Aktiviere Bluetooth.';

  @override
  String get noPasskeyFound => 'Kein Passkey gefunden!';

  @override
  String get noPasskeyFoundDescription => 'Bitte erstellen Sie einen Passkey, um diese Funktion zu nutzen.';

  @override
  String get maybeLater => 'Vielleicht später';

  @override
  String get effortlessLoginWithPasskeys => 'Müheloses Einloggen mit Passkeys';

  @override
  String get learnMoreAboutPasskeys => 'Erfahren Sie mehr über Passkeys';

  @override
  String get noNeedToRememberPassword => 'Sie müssen sich kein Passwort merken';

  @override
  String get useYourBiometrics => 'Erhöhte Sicherheit durch Biometrie oder Bildschirmsperre';

  @override
  String get syncAcrossDevices => 'Geräteübergreifend synchronisieren';

  @override
  String get createPasskey => 'Passkeyerstellen';

  @override
  String get unsupportedPlatform => 'Plattform wird nicht unterstützt';

  @override
  String get storedOn => 'Gespeichert am';

  @override
  String get lastUsed => 'Zuletzt verwendet';

  @override
  String get rename => 'Umbenennen';

  @override
  String get revoke => 'Widerrufen';

  @override
  String get continueTradingButtonText => 'Handel fortsetzen';

  @override
  String get addMorePasskeysButtonText => 'Mehr Passkeys';

  @override
  String get unableToSetupPasskey => 'Passkey kann nicht eingerichtet werden';

  @override
  String get unableToSetupPasskeyDescription => 'Beim Einrichten Ihres Passkey ist ein Problem aufgetreten. Der Vorgang wurde möglicherweise unterbrochen oder die Sitzung wurde unterbrochen. Bitte versuchen Sie es erneut.';

  @override
  String get passkeysOffErrorTitle => 'Der Dienst Passkeys ist nicht verfügbar';

  @override
  String get never => 'Niemals';

  @override
  String get unable_to_process_your_request => 'Ihre Anfrage konnte nicht bearbeitet werden';

  @override
  String get unable_to_process_your_request_description => 'Wir haben ein vorübergehendes Problem bei der Bearbeitung Ihrer Anfrage. Bitte versuchen Sie es später erneut.';
}
