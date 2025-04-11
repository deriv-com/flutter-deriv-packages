import 'deriv_auth_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class DerivAuthLocalizationsPl extends DerivAuthLocalizations {
  DerivAuthLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get labelNotAvailable => 'Niedostępne';

  @override
  String warnNotAvailableCountriesTitle(String app) {
    return 'Plik $app nie jest dostępny w Twoim kraju';
  }

  @override
  String get actionOk => 'OK';

  @override
  String get warnNotAvailableCountries => 'Jeśli mają Państwo jakiekolwiek pytania, prosimy o kontakt ';

  @override
  String get labelLiveChat => 'Czat na żywo';

  @override
  String get actionSignUpForFree => 'Zarejestruj się za darmo';

  @override
  String get actionLogin => 'Zaloguj';

  @override
  String get labelTwoFactorAuth => 'Uwierzytelnianie dwuskładnikowe';

  @override
  String get informEnterTwoFactorAuthCode => 'Proszę wprowadzić 6-cyfrowy kod z aplikacji uwierzytelniającej w telefonie.';

  @override
  String get labelTwoFactorAuthenticationCode => 'Kod dwuskładnikowy';

  @override
  String get actionProceed => 'Kontynuuj';

  @override
  String get labelLogIn => 'Zaloguj';

  @override
  String get informLoginOptions => 'Lub zaloguj się przez';

  @override
  String get labelEmail => 'E-mail';

  @override
  String get labelPassword => 'Hasło';

  @override
  String get actionForgotPassword => 'Nie pamiętasz hasła?';

  @override
  String get labelDontHaveAnAccountYet => 'Nie mają Państwo jeszcze konta?';

  @override
  String get actionCreateANewAccount => 'Załóż nowe konto';

  @override
  String get informInvalidEmailFormat => 'Proszę wprowadzić prawidłowy adres e-mail';

  @override
  String get warnPasswordLength => 'Wprowadź od 8 do 25 znaków.';

  @override
  String get labelResetPassword => 'Zresetuj hasło';

  @override
  String get labelChooseNewPass => 'Wybierz nowe hasło';

  @override
  String get labelCreatePass => 'Hasło';

  @override
  String get informYourPassHasBeenReset => 'Państwa hasło zostało zresetowane';

  @override
  String get informRedirectLogin => 'Proszę zalogować się przy użyciu nowego hasła. Proszę poczekać, przekierowujemy Pana/Panią.';

  @override
  String get actionResetPass => 'Zresetuj moje hasło';

  @override
  String get informInvalidPasswordFormat => 'Wprowadź prawidłowy format hasła';

  @override
  String get labelCheckEmail => 'Sprawdź swój adres e-mail';

  @override
  String informSendResetPasswordEmail(String email) {
    return 'Wysłaliśmy wiadomość na adres $email z linkiem umożliwiającym zresetowanie hasła.';
  }

  @override
  String get informResetPassByEmail => 'Prześlemy Ci wiadomość e-mail z instrukcją resetowania hasła.';

  @override
  String get labelSelectCountry => 'Gdzie mieszkasz?';

  @override
  String get labelChooseCountry => 'Wybierz kraj';

  @override
  String get warnCountryNotAvailable => 'Niestety Deriv jest niedostępny w Twoim kraju.';

  @override
  String get actionNext => 'Następny';

  @override
  String get labelEmailIssueHeader => 'Jeśli nie widzisz wiadomości e-mail od nas już od kilku minut, kilka rzeczy może być tego powodem:';

  @override
  String get labelEmailIssueSpam => 'Wiadomość e-mail trafiła do folderu spam (czasami wiadomości się tam gubią).';

  @override
  String get labelEmailIssueWrongEmail => 'Przez przypadek podałeś/podałaś nam inny adres e-mail (zazwyczaj jest to adres e-mail z pracy lun osobisty, zamiast właściwego).';

  @override
  String get labelEmailIssueTypo => 'Wprowadzony przez Ciebie adres e-mail zawiera błąd lub literówkę (zdarza się najlepszym).';

  @override
  String get labelEmailIssueFirewall => 'Nie jesteśmy w stanie dostarczyć wiadomości e-mail pod ten adres (zazwyczaj z powodu zapory ogniowej lub filtrów).';

  @override
  String get actionReenterEmail => 'Wprowadź email i spróbuj ponownie';

  @override
  String get labelKeepPassword => 'Zabezpiecz swoje konto hasłem';

  @override
  String get labelCreatePassword => 'Utwórz hasło';

  @override
  String get actionStartTrading => 'Rozpocznij handlowanie';

  @override
  String get actionPrevious => 'Poprzedni';

  @override
  String get labelSignUp => 'Zarejestruj się';

  @override
  String get labelOrSignUpWith => 'Lub zarejestruj się przy użyciu';

  @override
  String get labelReferralInfoTitle => 'Kod polecający partnera';

  @override
  String get infoReferralInfoDescription => 'Kod alfanumeryczny dostarczony przez partnera Deriv, mający zastosowanie wyłącznie do rejestracji e-mail.';

  @override
  String get labelGotReferralCode => 'Mają Państwo kod polecający?';

  @override
  String get labelHaveAccount => 'Masz już konto?';

  @override
  String get actionCreateAccount => 'Utwórz darmowe konto demonstracyjne';

  @override
  String get informInvalidReferralCode => 'Wprowadzony kod polecający jest nieprawidłowy. Proszę sprawdzić i spróbować ponownie.';

  @override
  String get labelVerifyYourEmail => 'Zweryfikuj adres e-mail';

  @override
  String get labelThanksEmail => 'Dziękujemy za zweryfikowanie adresu e-mail';

  @override
  String get informLetsContinue => 'Proszę kontynuować.';

  @override
  String get actionContinue => 'Kontynuuj';

  @override
  String get labelSearchCountry => 'Proszę wyszukać kraj';

  @override
  String informVerificationEmailSent(String email) {
    return 'Wysłaliśmy wiadomość na adres $email z linkiem do aktywacji Państwa konta.';
  }

  @override
  String get actionEmailNotReceived => 'Wiadomość e-mail nie dotarła?';

  @override
  String get informPasswordPolicy => 'Państwa hasło musi zawierać:';

  @override
  String get informPasswordPolicyLength => '8-25 znaków';

  @override
  String get informPasswordPolicyLowerAndUpper => 'Wielkie i małe litery';

  @override
  String get informPasswordPolicyNumber => 'Co najmniej jeden numer';

  @override
  String get warnPasswordContainsSymbol => 'Proszę używać symboli dla silnego hasła.';

  @override
  String get labelReferralCode => 'Kod polecenia';

  @override
  String get actionTryAgain => 'Spróbuj ponownie';

  @override
  String get informInvalid2FACode => 'Wprowadzony kod jest nieprawidłowy. Proszę sprawdzić i spróbować ponownie.';

  @override
  String get informFailedAuthentication => 'Państwa adres e-mail lub hasło mogą być nieprawidłowe. Czy zarejestrował(a) się Pan(i) za pomocą konta społecznościowego? Proszę sprawdzić i spróbować ponownie.';

  @override
  String get informDeactivatedAccount => 'Twoje konto jest dezaktywowane.';

  @override
  String get informFailedAuthorization => 'Autoryzacja nie powiodła się.';

  @override
  String get informInvalidResidence => 'Nieprawidłowe miejsce zamieszkania.';

  @override
  String get informInvalidCredentials => 'Nieprawidłowe poświadczenia.';

  @override
  String get informMissingOtp => 'Brakujące jednorazowe hasło.';

  @override
  String get informSelfClosed => 'To konto zostało zamknięte.';

  @override
  String get informUnexpectedError => 'Wystąpił nieoczekiwany błąd.';

  @override
  String get informUnsupportedCountry => 'Twój kraj nie jest wspierany.';

  @override
  String get informExpiredAccount => 'Twoje konto wygasło';

  @override
  String get labelCountryConsentBrazil => 'Niniejszym potwierdzam, że mój wniosek o otwarcie rachunku w Deriv w celu handlu produktami OTC emitowanymi i oferowanymi wyłącznie poza Brazylią został zainicjowany przeze mnie. W pełni rozumiem, że Deriv nie jest regulowany przez CVM i zwracając się do Deriv, zamierzam nawiązać relację z zagraniczną firmą.';

  @override
  String get informConnectionError => 'Błąd połączenia. Spróbuj ponownie później.';

  @override
  String get informSwitchAccountError => 'Błąd przełączania konta. Spróbuj ponownie później.';

  @override
  String get labelDeveloper => 'Deweloper';

  @override
  String get labelEndpoint => 'Punkt końcowy';

  @override
  String get semanticEndpoint => 'punkt końcowy';

  @override
  String get warnInvalidEndpoint => 'nieprawidłowy punkt końcowy';

  @override
  String get labelApplicationID => 'ID aplikacji';

  @override
  String get semanticApplicationID => 'ID aplikacji';

  @override
  String get warnInvalidApplicationID => 'nieprawidłowe ID aplikacji';

  @override
  String get labelLanguage => 'Język';
}
