import 'deriv_auth_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class DerivAuthLocalizationsDe extends DerivAuthLocalizations {
  DerivAuthLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get labelNotAvailable => 'Nicht verfügbar';

  @override
  String warnNotAvailableCountriesTitle(String app) {
    return '$app ist in deinem Land nicht verfügbar';
  }

  @override
  String get actionOk => 'Okay';

  @override
  String get warnNotAvailableCountries => 'Wenn Sie Fragen haben, kontaktieren Sie uns über ';

  @override
  String get labelLiveChat => 'Live-chat';

  @override
  String get actionSignUpForFree => 'Melde dich kostenlos an';

  @override
  String get actionLogin => 'Anmelden';

  @override
  String get labelTwoFactorAuth => 'Zwei-Faktor-Authentifizierung';

  @override
  String get informEnterTwoFactorAuthCode => 'Geben Sie den 6-stelligen Code aus der Authentifizierungs-App auf Ihrem Telefon ein.';

  @override
  String get labelTwoFactorAuthenticationCode => '2FA-Kode';

  @override
  String get actionProceed => 'Fortfahren';

  @override
  String get labelLogIn => 'Anmelden';

  @override
  String get informLoginOptions => 'Oder melden Sie sich an mit';

  @override
  String get labelEmail => 'E-Mail';

  @override
  String get labelPassword => 'Passwort';

  @override
  String get actionForgotPassword => 'Passwort vergessen?';

  @override
  String get labelDontHaveAnAccountYet => 'Sie haben noch kein Konto?';

  @override
  String get actionCreateANewAccount => 'Erstelle ein neues Konto';

  @override
  String get informInvalidEmailFormat => 'Geben Sie eine gültige E-Mail Adresse ein';

  @override
  String get warnPasswordLength => 'Sie sollten 6-25 Zeichen eingeben.';

  @override
  String get labelResetPassword => 'Passwort zurücksetzen';

  @override
  String get labelChooseNewPass => 'Wählen Sie ein neues Passwort';

  @override
  String get labelCreatePass => 'Passwort';

  @override
  String get informYourPassHasBeenReset => 'Ihr Passwort wurde zurückgesetzt';

  @override
  String get informRedirectLogin => 'Sie müssen sich mit Ihrem neuen Passwort anmelden. Warten Sie, wir leiten Sie weiter.';

  @override
  String get actionResetPass => 'Setze mein Passwort zurück';

  @override
  String get informInvalidPasswordFormat => 'Bitte geben Sie ein gültiges Passwortformat ein';

  @override
  String get labelCheckEmail => 'Prüfen Sie Ihre E-Mail';

  @override
  String informSendResetPasswordEmail(String email) {
    return 'Wir haben eine Nachricht an $email mit einem Link zum Zurücksetzen Ihres Passworts gesendet.';
  }

  @override
  String get informResetPassByEmail => 'Wir werden Ihnen per E-Mail Anweisungen zum Zurücksetzen Ihres Passworts zusenden.';

  @override
  String get labelSelectCountry => 'Wo wohnen Sie?';

  @override
  String get labelChooseCountry => 'Land wählen';

  @override
  String get warnCountryNotAvailable => 'Leider ist Deriv in Ihrem Land nicht verfügbar.';

  @override
  String get actionNext => 'Weiter';

  @override
  String get labelEmailIssueHeader => 'Wenn Sie innerhalb weniger Minuten keine E-Mail von uns sehen, könnten einige Dinge passiert sein:';

  @override
  String get labelEmailIssueSpam => 'Die E-Mail befindet sich in Ihrem Spam-Ordner (manchmal gehen dort Dinge verloren).';

  @override
  String get labelEmailIssueWrongEmail => 'Sie haben uns versehentlich eine andere E-Mail-Adresse gegeben (normalerweise eine geschäftliche oder eine persönliche Adresse anstelle der von Ihnen meinten).';

  @override
  String get labelEmailIssueTypo => 'Die von Ihnen eingegebene E-Mail-Adresse hatte einen Fehler oder Tippfehler (passiert den Besten von uns).';

  @override
  String get labelEmailIssueFirewall => 'Wir können die E-Mail an diese Adresse nicht zustellen (in der Regel aufgrund von Firewalls oder Filtern).';

  @override
  String get actionReenterEmail => 'Gib deine E-Mail-Adresse erneut ein und versuche es erneut';

  @override
  String get labelKeepPassword => 'Schützen Sie Ihr Konto mit einem Passwort';

  @override
  String get labelCreatePassword => 'Erstelle ein Passwort';

  @override
  String get actionStartTrading => 'Beginnen Sie zu Handeln';

  @override
  String get actionPrevious => 'Vorherige';

  @override
  String get labelSignUp => 'Anmelden';

  @override
  String get labelOrSignUpWith => 'Oder melden Sie sich bei';

  @override
  String get labelReferralInfoTitle => 'Empfehlungscode für Partner';

  @override
  String get infoReferralInfoDescription => 'Ein alphanumerischer Code, der von einem Deriv-Partner bereitgestellt wird und nur für E-Mail-Anmeldungen gilt.';

  @override
  String get labelGotReferralCode => 'Haben Sie einen Empfehlungscode?';

  @override
  String get labelHaveAccount => 'Haben Sie schon ein Konto?';

  @override
  String get actionCreateAccount => 'Kostenloses Demo-Konto erstellen';

  @override
  String get informInvalidReferralCode => 'Der von Ihnen eingegebene Empfehlungscode ist ungültig. Überprüfen Sie ihn und versuchen Sie es erneut.';

  @override
  String get labelVerifyYourEmail => 'Überprüfen Sie Ihre E-Mail';

  @override
  String get labelThanksEmail => 'Danke, dass du deine E-Mail verifiziert hast';

  @override
  String get informLetsContinue => 'Lassen Sie uns fortfahren.';

  @override
  String get actionContinue => 'Weiter';

  @override
  String get labelSearchCountry => 'Land suchen';

  @override
  String informVerificationEmailSent(String email) {
    return 'Wir haben eine Nachricht an $email mit einem Link zur Aktivierung Ihres Kontos gesendet.';
  }

  @override
  String get actionEmailNotReceived => 'Haben Sie Ihre E-Mail nicht erhalten?';

  @override
  String get informPasswordPolicy => 'Ihr Passwort muss Folgendes enthalten:';

  @override
  String get informPasswordPolicyLength => '8-25 Zeichen';

  @override
  String get informPasswordPolicyLowerAndUpper => 'Groß- und Kleinbuchstaben';

  @override
  String get informPasswordPolicyNumber => 'Mindestens eine Nummer';

  @override
  String get warnPasswordContainsSymbol => 'Verwenden Sie Symbole für ein sicheres Passwort.';

  @override
  String get labelReferralCode => 'Empfehlungscode';

  @override
  String get actionTryAgain => 'Erneut versuchen';

  @override
  String get informInvalid2FACode => 'Der von Ihnen eingegebene Code ist ungültig. Überprüfen Sie ihn und versuchen Sie es erneut.';

  @override
  String get informFailedAuthentication => 'Ihre E-Mail oder Ihr Passwort ist möglicherweise falsch. Haben Sie sich mit einem sozialen Konto angemeldet? Überprüfen Sie es und versuchen Sie es erneut.';

  @override
  String get informDeactivatedAccount => 'Ihr Konto ist deaktiviert.';

  @override
  String get informFailedAuthorization => 'Die Autorisierung ist fehlgeschlagen.';

  @override
  String get informInvalidResidence => 'Ungültiger Wohnsitz.';

  @override
  String get informInvalidCredentials => 'Ungültige Anmeldeinformationen.';

  @override
  String get informMissingOtp => 'Fehlendes Einmalpasswort.';

  @override
  String get informSelfClosed => 'Ihr Konto wurde geschlossen.';

  @override
  String get informUnexpectedError => 'Ein unerwarteter Fehler ist aufgetreten.';

  @override
  String get informUnsupportedCountry => 'Ihr Land wird nicht unterstützt.';

  @override
  String get informExpiredAccount => 'Ihr Konto ist abgelaufen';

  @override
  String get labelCountryConsentBrazil => 'Ich bestätige hiermit, dass mein Antrag auf Eröffnung eines Kontos bei Deriv für den Handel mit OTC-Produkten, die ausschließlich außerhalb Brasiliens ausgegeben und angeboten werden, von mir initiiert wurde. Ich verstehe voll und ganz, dass Deriv nicht von CVM reguliert wird, und indem ich mich an Deriv wende, beabsichtige ich, eine Beziehung zu einem ausländischen Unternehmen aufzubauen.';

  @override
  String get informConnectionError => 'Verbindungsfehler. Bitte versuchen Sie es später erneut.';

  @override
  String get informSwitchAccountError => 'Fehler beim Kontowechsel. Bitte versuchen Sie es später erneut.';

  @override
  String get labelDeveloper => 'Entwickler';

  @override
  String get labelEndpoint => 'Endpunkt';

  @override
  String get semanticEndpoint => 'Endpunkt';

  @override
  String get warnInvalidEndpoint => 'Ungültiger Endpunkt';

  @override
  String get labelApplicationID => 'Anwendungs-ID';

  @override
  String get semanticApplicationID => 'Anwendungs-ID';

  @override
  String get warnInvalidApplicationID => 'ungültige Anwendungs-ID';

  @override
  String get labelLanguage => 'Sprache';
}
