import 'deriv_passkeys_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class DerivPasskeysLocalizationsDe extends DerivPasskeysLocalizations {
  DerivPasskeysLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get passkeyCreatedSuccessTitle => 'Erfolg!';

  @override
  String passkeyCreatedSuccessMessage(String platformName) {
    return 'Ihr Konto ist jetzt mit biometrischen Daten gesichert. Verwalten Sie Ihre biometrischen Daten über die Kontoeinstellungen von $platformName.';
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
  String get experienceSaferLogins => 'Ihr Schlüssel zu sichereren Logins';

  @override
  String get enhanceSecurity => 'Verwenden Sie Fingerabdruck, Gesichtserkennung oder andere biometrische Daten, um sich einfach und sicher anzumelden.';

  @override
  String get here => 'hier';

  @override
  String get effortlessLogin => 'Mühelose Anmeldung mit biometrischen Daten';

  @override
  String get whatArePasskeys => 'Was sind biometrischen Daten?';

  @override
  String get whatArePasskeysDescriptionPoint1 => 'Sichere Alternative zu Passwörtern.';

  @override
  String get whatArePasskeysDescriptionPoint2 => 'Entsperren Sie Ihr Konto wie Ihr Telefon - mit biometrischen Daten, Gesichtsscan oder PIN.';

  @override
  String get whyPasskeys => 'Warum biometrischen Daten?';

  @override
  String get whyPasskeysDescription1 => 'Schutzmechanismen gegen unautorisierten Zugriff.';

  @override
  String get whyPasskeysDescription2 => 'Schützt vor Phishing-Versuchen.';

  @override
  String get howToCreatePasskey => 'Wie aktiviere ich biometrische Daten?';

  @override
  String get howToCreatePasskeyDescription1 => 'Gehen Sie zu \'Kontoeinstellungen\' auf Deriv.';

  @override
  String get howToCreatePasskeyDescription2 => 'Tippen Sie auf „Biometrischen Daten“, um Ihre biometrischen Daten zu erstellen.';

  @override
  String get p2pHowToCreatePasskey => 'Wie erstelle ich einen biometrische Daten?';

  @override
  String get p2pHowToCreatePasskeyDescription1 => 'Gehen Sie in Ihrer Deriv P2P-App zu „Profil“.';

  @override
  String get p2pHowToCreatePasskeyDescription2 => 'Tippen Sie auf „Biometrische Daten“, um Ihre biometrische Daten zu erstellen.';

  @override
  String get whereArePasskeysSaved => 'Wo werden die biometrische Daten gespeichert?';

  @override
  String get whereArePasskeysSavedDescriptionAndroid => 'Android: Google Passwort-Manager.';

  @override
  String get whereArePasskeysSavedDescriptionIOS => 'iOS: iCloud keychain.';

  @override
  String get whatHappensIfEmailChanged => 'Was passiert, wenn die E-Mail-Adresse meines Deriv-Kontos geändert wird?';

  @override
  String get whatHappensIfEmailChangedDescription1 => 'Kein Problem! Ihr Biometrics funktioniert noch.';

  @override
  String get whatHappensIfEmailChangedDescription2 => 'Melden Sie sich bei Deriv mit Ihrem bestehenden biometrische Daten an.';

  @override
  String get tips => 'Tipps';

  @override
  String get beforeUsingPasskeys => 'Vor der Benutzung von biometrische Daten';

  @override
  String get enableScreenLock => 'Aktivieren Sie die Bildschirmsperre auf Ihrem Gerät.';

  @override
  String get signInGoogleOrIcloud => 'Melden Sie sich bei Ihrem Google- oder iCloud-Konto an.';

  @override
  String get enableBluetooth => 'Aktivieren Sie Bluetooth.';

  @override
  String get noPasskeyFound => 'Keine biometrischen Daten gefunden!';

  @override
  String get noPasskeyFoundDescription => 'Bitte richten Sie biometrische Daten ein, um diese Funktion nutzen zu können.';

  @override
  String get maybeLater => 'Vielleicht später';

  @override
  String get effortlessLoginWithPasskeys => 'Müheloses Einloggen mit biometrischen Daten';

  @override
  String get learnMoreAboutPasskeys => 'Erfahren Sie mehr über biometrischen Daten';

  @override
  String get noNeedToRememberPassword => 'Sie müssen sich kein Passwort merken';

  @override
  String get useYourBiometrics => 'Erhöhte Sicherheit durch biometrische Daten oder Bildschirmsperre';

  @override
  String get syncAcrossDevices => 'Geräteübergreifend synchronisieren';

  @override
  String get createPasskey => 'Biometrische Daten aktivieren';

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
  String get addMorePasskeysButtonText => 'Neue biometrische Daten hinzufügen';

  @override
  String get unableToSetupPasskey => 'Biometrische Daten kann nicht eingerichtet werden';

  @override
  String get unableToSetupPasskeyDescription => 'Beim Einrichten Ihrer biometrischen Daten ist ein Problem aufgetreten. Der Vorgang wurde möglicherweise unterbrochen oder die Sitzung ist abgelaufen. Bitte versuchen Sie es erneut.';

  @override
  String get passkeysOffErrorTitle => 'Der Dienst „biometrischen Daten“ ist nicht verfügbar';

  @override
  String get never => 'Niemals';

  @override
  String get unable_to_process_your_request => 'Ihre Anfrage konnte nicht bearbeitet werden';

  @override
  String get unable_to_process_your_request_description => 'Wir haben ein vorübergehendes Problem bei der Bearbeitung Ihrer Anfrage. Bitte versuchen Sie es später erneut.';
}
