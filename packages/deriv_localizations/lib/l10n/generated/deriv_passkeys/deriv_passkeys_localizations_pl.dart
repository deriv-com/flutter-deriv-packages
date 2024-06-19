import 'deriv_passkeys_localizations.dart';

/// The translations for Polish (`pl`).
class DerivPasskeysLocalizationsPl extends DerivPasskeysLocalizations {
  DerivPasskeysLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get passkeyCreatedSuccessTitle => 'Udało się!';

  @override
  String passkeyCreatedSuccessMessage(String platformName) {
    return 'Twoje konto jest teraz zabezpieczone passkey. Zarządzaj swoim passkey za pomocą ustawień konta $platformName.';
  }

  @override
  String get continueButtonText => 'Kontynuuj';

  @override
  String get unexpectedError => 'Wystąpił nieoczekiwany błąd!';

  @override
  String get unexpectedErrorDescription => 'Spróbuj później.';

  @override
  String get ok => 'Ok';

  @override
  String get experienceSaferLogins => 'Doświadcz bezpieczniejszych logowań';

  @override
  String get enhanceSecurity => 'Zwiększone bezpieczeństwo jest na wyciągnięcie ręki.';

  @override
  String get here => 'tutaj';

  @override
  String get effortlessLogin => 'Łatwe logowanie za pomocą passkeys';

  @override
  String get whatArePasskeys => 'Czym są passkeys?';

  @override
  String get whatArePasskeysDescriptionPoint1 => 'Bezpieczna alternatywa dla haseł.';

  @override
  String get whatArePasskeysDescriptionPoint2 => 'Odblokuj swoje konto jak telefon - za pomocą danych biometrycznych, skanowania twarzy lub PIN-u.';

  @override
  String get whyPasskeys => 'Dlaczego Passkeys?';

  @override
  String get whyPasskeysDescription1 => 'Dodatkowa warstwa bezpieczeństwa.';

  @override
  String get whyPasskeysDescription2 => 'Chroni przed nieautoryzowanym dostępem i phishingiem.';

  @override
  String get howToCreatePasskey => 'Jak utworzyć passkey?';

  @override
  String get howToCreatePasskeyDescription1 => 'Przejdź do ‘Ustawień konta’ na Deriv.';

  @override
  String get howToCreatePasskeyDescription2 => 'Możesz utworzyć jedno hasło na urządzenie.';

  @override
  String get p2pHowToCreatePasskey => 'Jak utworzyć klucz hasłowy?';

  @override
  String get p2pHowToCreatePasskeyDescription1 => 'Przejdź do „Profil” w aplikacji Deriv P2P.';

  @override
  String get p2pHowToCreatePasskeyDescription2 => 'Stuknij „Kody haseł”, aby utworzyć klucz hasła.';

  @override
  String get whereArePasskeysSaved => 'Gdzie są zapisywane passkeys?';

  @override
  String get whereArePasskeysSavedDescriptionAndroid => 'Android: menedżer haseł Google.';

  @override
  String get whereArePasskeysSavedDescriptionIOS => 'iOS: pęk kluczy iCloud.';

  @override
  String get whatHappensIfEmailChanged => 'Co się stanie, jeśli e-mail mojego konta Deriv zostanie zmieniony?';

  @override
  String get whatHappensIfEmailChangedDescription1 => 'Bez problemu! Twój Passkey nadal działa.';

  @override
  String get whatHappensIfEmailChangedDescription2 => 'Zaloguj się do Deriv przy użyciu istniejącego Passkey.';

  @override
  String get tips => 'Porady';

  @override
  String get beforeUsingPasskeys => 'Przed użyciem passkeys';

  @override
  String get enableScreenLock => 'Włącz blokadę ekranu na swoim urządzeniu.';

  @override
  String get signInGoogleOrIcloud => 'Zaloguj się na swoje konto Google lub iCloud.';

  @override
  String get enableBluetooth => 'Włącz Bluetooth.';

  @override
  String get noPasskeyFound => 'Nie znaleziono passkey!';

  @override
  String get noPasskeyFoundDescription => 'Aby korzystać z tej funkcji, utwórz passkey.';

  @override
  String get maybeLater => 'Może później';

  @override
  String get effortlessLoginWithPasskeys => 'Łatwe logowanie za pomocą passkeys';

  @override
  String get learnMoreAboutPasskeys => 'Dowiedz się więcej o passkeys';

  @override
  String get noNeedToRememberPassword => 'Nie ma potrzeby zapamiętywania hasła';

  @override
  String get useYourBiometrics => 'Zwiększone bezpieczeństwo dzięki biometrii lub blokadzie ekranu';

  @override
  String get syncAcrossDevices => 'Synchronizacja między urządzeniami';

  @override
  String get createPasskey => 'Utwórz passkey';

  @override
  String get unsupportedPlatform => 'Nieobsługiwana platforma';

  @override
  String get storedOn => 'Przechowywane na';

  @override
  String get lastUsed => 'Ostatnio używane';

  @override
  String get rename => 'Zmień nazwę';

  @override
  String get revoke => 'Odwołać';

  @override
  String get continueTradingButtonText => 'Kontynuuj handlowanie';

  @override
  String get addMorePasskeysButtonText => 'Więcej passkeys';

  @override
  String get unableToSetupPasskey => 'Nie można ustawić passkey';

  @override
  String get unableToSetupPasskeyDescription => 'Napotkaliśmy problem podczas konfigurowania Passkey. Proces mógł zostać przerwany lub upłynął limit czasu sesji. Proszę spróbuj ponownie.';

  @override
  String get passkeysOffErrorTitle => 'Usługa Passkeys jest niedostępna';

  @override
  String get never => 'Nigdy';

  @override
  String get unable_to_process_your_request => 'Nie można przetworzyć żądania';

  @override
  String get unable_to_process_your_request_description => 'Mamy tymczasowy problem z przetwarzaniem Twojej prośby. Spróbuj ponownie później.';
}
