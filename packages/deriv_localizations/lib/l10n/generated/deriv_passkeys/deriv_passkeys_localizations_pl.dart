import 'deriv_passkeys_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class DerivPasskeysLocalizationsPl extends DerivPasskeysLocalizations {
  DerivPasskeysLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get passkeyCreatedSuccessTitle => 'Udało się!';

  @override
  String passkeyCreatedSuccessMessage(String platformName) {
    return 'Twoje konto jest teraz zabezpieczone przy użyciu biometrii. Zarządzaj swoimi danymi biometrycznymi za pomocą ustawień konta $platformName.';
  }

  @override
  String get continueButtonText => 'Kontynuuj';

  @override
  String get unexpectedError => 'Wystąpił nieoczekiwany błąd!';

  @override
  String get unexpectedErrorDescription => 'Spróbuj później.';

  @override
  String get ok => 'OK';

  @override
  String get experienceSaferLogins => 'Twój klucz do bezpiecznego logowania';

  @override
  String get enhanceSecurity => 'Zwiększone bezpieczeństwo jest na wyciągnięcie ręki.';

  @override
  String get here => 'tutaj';

  @override
  String get effortlessLogin => 'Łatwe logowanie za pomocą biometrii';

  @override
  String get whatArePasskeys => 'Czym są dane biometryczne?';

  @override
  String get whatArePasskeysDescriptionPoint1 => 'Bezpieczna alternatywa dla haseł.';

  @override
  String get whatArePasskeysDescriptionPoint2 => 'Odblokuj swoje konto jak telefon: za pomocą odcisku palca, skanowania twarzy lub PIN-u.';

  @override
  String get whyPasskeys => 'Dlaczego warto korzystać z biometrii?';

  @override
  String get whyPasskeysDescription1 => 'Dodatkowa warstwa bezpieczeństwa.';

  @override
  String get whyPasskeysDescription2 => 'Chroni przed nieautoryzowanym dostępem i phishingiem.';

  @override
  String get howToCreatePasskey => 'Jak włączyć biometrię?';

  @override
  String get howToCreatePasskeyDescription1 => 'Przejdź do sekcji „Ustawienia konta” na Deriv.';

  @override
  String get howToCreatePasskeyDescription2 => 'Naciśnij „Biometria”, aby utworzyć swoje dane biometryczne.';

  @override
  String get p2pHowToCreatePasskey => 'Jak włączyć biometrię?';

  @override
  String get p2pHowToCreatePasskeyDescription1 => 'Przejdź do sekcji „Profil” w aplikacji Deriv P2P.';

  @override
  String get p2pHowToCreatePasskeyDescription2 => 'Naciśnij „Biometria”, aby utworzyć swoje dane biometryczne.';

  @override
  String get whereArePasskeysSaved => 'Gdzie są przechowywane dane biometryczne?';

  @override
  String get whereArePasskeysSavedDescriptionAndroid => 'Android: menedżer haseł Google.';

  @override
  String get whereArePasskeysSavedDescriptionIOS => 'iOS: pęk kluczy iCloud.';

  @override
  String get whatHappensIfEmailChanged => 'Co się stanie, jeśli e-mail mojego konta Deriv zostanie zmieniony?';

  @override
  String get whatHappensIfEmailChangedDescription1 => 'Nie ma problemu! Twoje dane biometryczne nadal działają.';

  @override
  String get whatHappensIfEmailChangedDescription2 => 'Zaloguj się do Deriv przy użyciu istniejących danych biometrycznych.';

  @override
  String get tips => 'Porady';

  @override
  String get beforeUsingPasskeys => 'Przed użyciem biometrii';

  @override
  String get enableScreenLock => 'Włącz blokadę ekranu na swoim urządzeniu.';

  @override
  String get signInGoogleOrIcloud => 'Zaloguj się na swoje konto Google lub iCloud.';

  @override
  String get enableBluetooth => 'Włącz Bluetooth.';

  @override
  String get noPasskeyFound => 'Nie znaleziono danych biometrycznych!';

  @override
  String get noPasskeyFoundDescription => 'Aby korzystać z tej funkcji, utwórz biometrię.';

  @override
  String get maybeLater => 'Może później';

  @override
  String get effortlessLoginWithPasskeys => 'Łatwe logowanie za pomocą biometrii';

  @override
  String get learnMoreAboutPasskeys => 'Dowiedz się więcej o biometrii';

  @override
  String get noNeedToRememberPassword => 'Nie ma potrzeby zapamiętywania hasła';

  @override
  String get useYourBiometrics => 'Zwiększone bezpieczeństwo dzięki biometrii lub blokadzie ekranu';

  @override
  String get syncAcrossDevices => 'Synchronizacja między urządzeniami';

  @override
  String get createPasskey => 'Włącz biometrię';

  @override
  String get unsupportedPlatform => 'Nieobsługiwana platforma';

  @override
  String get storedOn => 'Przechowywane na';

  @override
  String get lastUsed => 'Ostatnio używane';

  @override
  String get rename => 'Zmień nazwę';

  @override
  String get revoke => 'Odwołaj';

  @override
  String get continueTradingButtonText => 'Kontynuuj handlowanie';

  @override
  String get addMorePasskeysButtonText => 'Dodaj nowe dane biometryczne';

  @override
  String get unableToSetupPasskey => 'Nie można ustawić biometrii';

  @override
  String get unableToSetupPasskeyDescription => 'Napotkaliśmy problem podczas konfigurowania Twoich danych biometrycznych. Proces mógł zostać przerwany lub upłynął limit czasu sesji. Spróbuj ponownie.';

  @override
  String get passkeysOffErrorTitle => 'Usługa logowania biometrycznego jest niedostępna';

  @override
  String get never => 'Nigdy';

  @override
  String get unable_to_process_your_request => 'Nie można przetworzyć żądania';

  @override
  String get unable_to_process_your_request_description => 'Mamy tymczasowy problem z przetwarzaniem Twojej prośby. Spróbuj ponownie później.';
}
