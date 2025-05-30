import 'deriv_auth_localizations.dart';

/// The translations for Italian (`it`).
class DerivAuthLocalizationsIt extends DerivAuthLocalizations {
  DerivAuthLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get labelNotAvailable => 'Non disponibile';

  @override
  String warnNotAvailableCountriesTitle(String app) {
    return '$app non è disponibile nel tuo Paese';
  }

  @override
  String get actionOk => 'OK';

  @override
  String get warnNotAvailableCountries => 'Se hai domande, non esitare a contattarci tramite ';

  @override
  String get labelLiveChat => 'Chat live';

  @override
  String get actionSignUpForFree => 'Registrati gratis';

  @override
  String get actionLogin => 'Accedi';

  @override
  String get labelTwoFactorAuth => 'Autenticazione a due fattori';

  @override
  String get informEnterTwoFactorAuthCode => 'Inserisca il codice a 6 cifre dall\'app Authenticator sul suo telefono.';

  @override
  String get labelTwoFactorAuthenticationCode => 'Codice 2FA';

  @override
  String get actionProceed => 'Continua';

  @override
  String get labelLogIn => 'Accedi';

  @override
  String get informLoginOptions => 'Oppure accedi con';

  @override
  String get labelEmail => 'E-mail';

  @override
  String get labelPassword => 'Password';

  @override
  String get actionForgotPassword => 'Hai dimenticato la password?';

  @override
  String get labelDontHaveAnAccountYet => 'Non ha ancora un account?';

  @override
  String get actionCreateANewAccount => 'Crea un nuovo conto';

  @override
  String get informInvalidEmailFormat => 'Inserisca un indirizzo e-mail valido';

  @override
  String get warnPasswordLength => 'È necessario inserire da 8 a 25 caratteri.';

  @override
  String get labelResetPassword => 'Reimposta la password';

  @override
  String get labelChooseNewPass => 'Scegli una nuova password';

  @override
  String get labelCreatePass => 'Password';

  @override
  String get informYourPassHasBeenReset => 'La sua password è stata reimpostata';

  @override
  String get informRedirectLogin => 'Dovrà accedere con la nuova password. Aspetti, la stiamo reindirizzando.';

  @override
  String get actionResetPass => 'Reimposta la password';

  @override
  String get informInvalidPasswordFormat => 'Inserisci un formato della password valido';

  @override
  String get labelCheckEmail => 'Controlla la tua casella di posta';

  @override
  String informSendResetPasswordEmail(String email) {
    return 'Abbiamo inviato un messaggio a $email con un link per reimpostare la sua password.';
  }

  @override
  String get informResetPassByEmail => 'Ti manderemo una e-mail con le istruzioni per reimpostare la password.';

  @override
  String get labelSelectCountry => 'Dove vivi?';

  @override
  String get labelChooseCountry => 'Seleziona il Paese';

  @override
  String get warnCountryNotAvailable => 'Deriv non è disponibile nel tuo Paese.';

  @override
  String get actionNext => 'Successivo';

  @override
  String get labelEmailIssueHeader => 'Se non ricevi una e-mail da parte nostra entro pochi minuti, potrebbero esserci stati dei problemi:';

  @override
  String get labelEmailIssueSpam => 'L\' e-mail è nella cartella spam (dove alle volte finiscono i messaggi).';

  @override
  String get labelEmailIssueWrongEmail => 'Hai erroneamente indicato un altro indirizzo e-mail (normalmente quello di lavoro o personale, invece di quello che intendevi usare).';

  @override
  String get labelEmailIssueTypo => 'L\'indirizzo e-mail inserito contiene un errore o un refuso (è un errore comune, non preoccuparti!).';

  @override
  String get labelEmailIssueFirewall => 'Non possiamo inviare l\'e-mail a questo indirizzo (di solito a causa di filtri o firewall).';

  @override
  String get actionReenterEmail => 'Reinserisci e-mail e prova ancora';

  @override
  String get labelKeepPassword => 'Mantieni in sicurezza il tuo conto con una password';

  @override
  String get labelCreatePassword => 'Crea una password';

  @override
  String get actionStartTrading => 'Inizia il trading';

  @override
  String get actionPrevious => 'Precedente';

  @override
  String get labelSignUp => 'Registrati';

  @override
  String get labelOrSignUpWith => 'Oppure registrati con';

  @override
  String get labelReferralInfoTitle => 'Codice di riferimento dell\'affiliato';

  @override
  String get infoReferralInfoDescription => 'Un codice alfanumerico fornito da un affiliato Deriv, applicabile solo per le iscrizioni via e-mail.';

  @override
  String get labelGotReferralCode => 'Ha un codice di riferimento?';

  @override
  String get labelHaveAccount => 'Hai già un account?';

  @override
  String get actionCreateAccount => 'Crea un conto di prova gratuito';

  @override
  String get informInvalidReferralCode => 'Il codice di riferimento inserito non è valido. Controlli e riprovi.';

  @override
  String get labelVerifyYourEmail => 'Verifica la tua email';

  @override
  String get labelThanksEmail => 'Grazie per aver verificato la tua e-mail';

  @override
  String get informLetsContinue => 'Continuiamo.';

  @override
  String get actionContinue => 'Continua';

  @override
  String get labelSearchCountry => 'Ricerca per Paese';

  @override
  String informVerificationEmailSent(String email) {
    return 'Abbiamo inviato un messaggio a $email con un link per attivare il suo account.';
  }

  @override
  String get actionEmailNotReceived => 'Non hai ricevuto l\'e-mail?';

  @override
  String get informPasswordPolicy => 'La sua password deve avere:';

  @override
  String get informPasswordPolicyLength => '8-25 caratteri';

  @override
  String get informPasswordPolicyLowerAndUpper => 'Lettere maiuscole e minuscole';

  @override
  String get informPasswordPolicyNumber => 'Almeno un numero';

  @override
  String get warnPasswordContainsSymbol => 'Utilizzi i simboli per una password forte.';

  @override
  String get labelReferralCode => 'Codice di riferimento';

  @override
  String get actionTryAgain => 'Riprova';

  @override
  String get informInvalid2FACode => 'Il codice inserito non è valido. Controlli e riprovi.';

  @override
  String get informFailedAuthentication => 'La sua e-mail o la sua password potrebbero essere errate. Si è iscritto con un account social? Controlli e riprovi.';

  @override
  String get informDeactivatedAccount => 'Il tuo account è disattivato.';

  @override
  String get informFailedAuthorization => 'Autorizzazione non riuscita.';

  @override
  String get informInvalidResidence => 'Residenza non valida.';

  @override
  String get informInvalidCredentials => 'Credenziali non valide.';

  @override
  String get informMissingOtp => 'Password monouso mancante.';

  @override
  String get informSelfClosed => 'Questo conto è stato chiuso.';

  @override
  String get informUnexpectedError => 'Ein unerwarteter Fehler ist aufgetreten.';

  @override
  String get informUnsupportedCountry => 'Il tuo Paese non è supportato.';

  @override
  String get informExpiredAccount => 'Il tuo account è scaduto';

  @override
  String get labelCountryConsentBrazil => 'Con la presente confermo che la mia richiesta di apertura di un conto presso Deriv per negoziare prodotti OTC emessi e offerti esclusivamente al di fuori del Brasile è stata avviata da me. Sono pienamente consapevole che Deriv non è regolamentata dal CVM e che rivolgendomi a Deriv intendo instaurare un rapporto con una società straniera.';

  @override
  String get informConnectionError => 'Errore di connessione. Riprova più tardi.';

  @override
  String get informSwitchAccountError => 'Errore nel cambio di account. Riprova più tardi.';

  @override
  String get labelDeveloper => 'Sviluppatore';

  @override
  String get labelEndpoint => 'Termine';

  @override
  String get semanticEndpoint => 'Termine';

  @override
  String get warnInvalidEndpoint => 'termine non valido';

  @override
  String get labelApplicationID => 'ID applicazione';

  @override
  String get semanticApplicationID => 'ID applicazione';

  @override
  String get warnInvalidApplicationID => 'ID applicazione non valido';

  @override
  String get labelLanguage => 'Lingua';
}
