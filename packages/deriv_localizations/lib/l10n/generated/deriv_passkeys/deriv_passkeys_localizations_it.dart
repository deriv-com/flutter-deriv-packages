import 'deriv_passkeys_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class DerivPasskeysLocalizationsIt extends DerivPasskeysLocalizations {
  DerivPasskeysLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get passkeyCreatedSuccessTitle => 'Fatto!';

  @override
  String passkeyCreatedSuccessMessage(String platformName) {
    return 'Il tuo account è ora protetto con una Biometric. Gestisci la tua Biometric tramite le impostazioni del tuo account $platformName.';
  }

  @override
  String get continueButtonText => 'Continua';

  @override
  String get unexpectedError => 'Si è verificato un errore imprevisto!';

  @override
  String get unexpectedErrorDescription => 'Riprova più tardi.';

  @override
  String get ok => 'Ok';

  @override
  String get experienceSaferLogins => 'Sperimenta accessi più sicuri';

  @override
  String get enhanceSecurity => 'Per una maggiore sicurezza basta un tocco.';

  @override
  String get here => 'qui';

  @override
  String get effortlessLogin => 'Accesso semplice con Biometrics';

  @override
  String get whatArePasskeys => 'Cosa sono le Biometric?';

  @override
  String get whatArePasskeysDescriptionPoint1 => 'Un\'alternativa sicura alle password.';

  @override
  String get whatArePasskeysDescriptionPoint2 => 'Sblocca il suo conto come il suo telefono - con la biometria, la scansione del volto o il PIN.';

  @override
  String get whyPasskeys => 'Perché la Biometric?';

  @override
  String get whyPasskeysDescription1 => 'Un ulteriore livello di sicurezza.';

  @override
  String get whyPasskeysDescription2 => 'Protegge dagli accessi non autorizzati e dal phishing.';

  @override
  String get howToCreatePasskey => 'Come creare una Biometric?';

  @override
  String get howToCreatePasskeyDescription1 => 'Vada a \'Impostazioni del conto\' su Deriv.';

  @override
  String get howToCreatePasskeyDescription2 => 'Può creare una sola Biometric per dispositivo.';

  @override
  String get p2pHowToCreatePasskey => 'Come creare una Biometric?';

  @override
  String get p2pHowToCreatePasskeyDescription1 => 'Vai a «Profilo» nella tua app Deriv P2P.';

  @override
  String get p2pHowToCreatePasskeyDescription2 => 'Tocca «Biometric» per creare la tua Biometric.';

  @override
  String get whereArePasskeysSaved => 'Dove vengono salvate la Biometric?';

  @override
  String get whereArePasskeysSavedDescriptionAndroid => 'Android: Gestore di password di Google.';

  @override
  String get whereArePasskeysSavedDescriptionIOS => 'iOS: Portachiavi iCloud.';

  @override
  String get whatHappensIfEmailChanged => 'Cosa succede se l\'email del mio account Deriv viene modificata?';

  @override
  String get whatHappensIfEmailChangedDescription1 => 'Nessun problema! La sua Biometric funziona ancora.';

  @override
  String get whatHappensIfEmailChangedDescription2 => 'Acceda a Deriv con la sua Biometric esistente.';

  @override
  String get tips => 'Suggerimento';

  @override
  String get beforeUsingPasskeys => 'Prima di utilizzare la Biometric';

  @override
  String get enableScreenLock => 'Abilita il blocco dello schermo sul tuo dispositivo.';

  @override
  String get signInGoogleOrIcloud => 'Accedi al tuo account Google o iCloud.';

  @override
  String get enableBluetooth => 'Abilita il Bluetooth.';

  @override
  String get noPasskeyFound => 'Nessuna Biometric trovata!';

  @override
  String get noPasskeyFoundDescription => 'Crea una Biometric per utilizzare questa funzione.';

  @override
  String get maybeLater => 'Forse più tardi';

  @override
  String get effortlessLoginWithPasskeys => 'Accesso semplice con Biometrics';

  @override
  String get learnMoreAboutPasskeys => 'Scopri di più sulle Biometric';

  @override
  String get noNeedToRememberPassword => 'Non è necessario ricordare una password';

  @override
  String get useYourBiometrics => 'Sicurezza avanzata con biometria o blocco dello schermo';

  @override
  String get syncAcrossDevices => 'Sincronizzazione su più dispositivi';

  @override
  String get createPasskey => 'Crea Biometric';

  @override
  String get unsupportedPlatform => 'Piattaforma non supportata';

  @override
  String get storedOn => 'Memorizzato su';

  @override
  String get lastUsed => 'Ultima volta';

  @override
  String get rename => 'Rinomina';

  @override
  String get revoke => 'Revoca';

  @override
  String get continueTradingButtonText => 'Continua il trading';

  @override
  String get addMorePasskeysButtonText => 'Più Biometrics';

  @override
  String get unableToSetupPasskey => 'Impossibile impostare la Biometric';

  @override
  String get unableToSetupPasskeyDescription => 'Abbiamo riscontrato un problema durante la configurazione della sua Biometric. Il processo potrebbe essere stato interrotto, oppure la sessione è scaduta. Provi di nuovo.';

  @override
  String get passkeysOffErrorTitle => 'Il servizio Biometrics non è disponibile';

  @override
  String get never => 'Mai';

  @override
  String get unable_to_process_your_request => 'Impossibile elaborare la tua richiesta';

  @override
  String get unable_to_process_your_request_description => 'Stiamo riscontrando un problema temporaneo nell\'elaborazione della tua richiesta. Riprova più tardi.';
}
