import 'deriv_passkeys_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class DerivPasskeysLocalizationsFr extends DerivPasskeysLocalizations {
  DerivPasskeysLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get passkeyCreatedSuccessTitle => 'Effectué !';

  @override
  String passkeyCreatedSuccessMessage(String platformName) {
    return 'Votre compte est désormais sécurisé par une passkey. Gérez votre passkey à partir de vos paramètres de compte $platformName.';
  }

  @override
  String get continueButtonText => 'Continuer';

  @override
  String get unexpectedError => 'Une erreur inattendue s\'est produite !';

  @override
  String get unexpectedErrorDescription => 'Veuillez réessayer plus tard.';

  @override
  String get ok => 'Ok';

  @override
  String get experienceSaferLogins => 'Bénéficiez de connexions plus sûres';

  @override
  String get enhanceSecurity => 'Une sécurité renforcée est à portée de main.';

  @override
  String get here => 'ici';

  @override
  String get effortlessLogin => 'Connexion facile à l\'aide de passkeys';

  @override
  String get whatArePasskeys => 'Que sont les passkeys ?';

  @override
  String get whatArePasskeysDescriptionPoint1 => 'Alternative sécurisée aux mots de passe.';

  @override
  String get whatArePasskeysDescriptionPoint2 => 'Déverrouillez votre compte comme votre téléphone - par biométrie, scan du visage ou code PIN.';

  @override
  String get whyPasskeys => 'Pourquoi choisir des passkeys ?';

  @override
  String get whyPasskeysDescription1 => 'Couche de sécurité supplémentaire.';

  @override
  String get whyPasskeysDescription2 => 'Protège contre les accès non autorisés et le phishing.';

  @override
  String get howToCreatePasskey => 'Comment créer une passkey ?';

  @override
  String get howToCreatePasskeyDescription1 => 'Allez dans \"Paramètres du compte\" sur Deriv.';

  @override
  String get howToCreatePasskeyDescription2 => 'Vous pouvez créer une Passkey par appareil.';

  @override
  String get p2pHowToCreatePasskey => 'Comment créer une clé d\'accès ?';

  @override
  String get p2pHowToCreatePasskeyDescription1 => 'Accéder à « Profil » dans votre application Deriv P2P.';

  @override
  String get p2pHowToCreatePasskeyDescription2 => 'Appuyez sur « Clés d\'accès » pour créer votre clé d\'accès.';

  @override
  String get whereArePasskeysSaved => 'Où sont enregistrées les passkeys ?';

  @override
  String get whereArePasskeysSavedDescriptionAndroid => 'Android : Gestionnaire de mots de passe Google.';

  @override
  String get whereArePasskeysSavedDescriptionIOS => 'iOS : trousseau iCloud.';

  @override
  String get whatHappensIfEmailChanged => 'Que se passe-t-il si l\'adresse e-mail de mon compte Deriv est modifiée ?';

  @override
  String get whatHappensIfEmailChangedDescription1 => 'Pas de problème ! Votre Passkey fonctionne toujours.';

  @override
  String get whatHappensIfEmailChangedDescription2 => 'Connectez-vous à Deriv avec votre Passkey existant.';

  @override
  String get tips => 'Conseils';

  @override
  String get beforeUsingPasskeys => 'Avant d\'utiliser la passkey :';

  @override
  String get enableScreenLock => 'Activez le verrouillage de l\'écran sur votre appareil.';

  @override
  String get signInGoogleOrIcloud => 'Connectez-vous à votre compte Google ou iCloud.';

  @override
  String get enableBluetooth => 'Activer Bluetooth.';

  @override
  String get noPasskeyFound => 'Aucun passkey n\'a été trouvé !';

  @override
  String get noPasskeyFoundDescription => 'Veuillez créer une passkey pour utiliser cette fonctionnalité.';

  @override
  String get maybeLater => 'Peut-être plus tard';

  @override
  String get effortlessLoginWithPasskeys => 'Connexion facile à l\'aide de passkeys';

  @override
  String get learnMoreAboutPasskeys => 'En savoir plus sur les passkeys';

  @override
  String get noNeedToRememberPassword => 'Pas besoin de mémoriser un mot de passe';

  @override
  String get useYourBiometrics => 'Sécurité renforcée grâce à la biométrie ou au verrouillage de l\'écran';

  @override
  String get syncAcrossDevices => 'Synchronisation sur tous les appareils';

  @override
  String get createPasskey => 'Créer une passkey';

  @override
  String get unsupportedPlatform => 'Plateforme non prise en charge';

  @override
  String get storedOn => 'Stocké sur ';

  @override
  String get lastUsed => 'Dernière utilisation';

  @override
  String get rename => 'Renommer';

  @override
  String get revoke => 'Révoquer';

  @override
  String get continueTradingButtonText => 'Poursuivre les opérations de trading';

  @override
  String get addMorePasskeysButtonText => 'Ajouter plus de Passkeys';

  @override
  String get unableToSetupPasskey => 'Impossible de configurer la Passkey';

  @override
  String get unableToSetupPasskeyDescription => 'Nous avons rencontré un problème lors de l\'établissement de votre Passkey. Il se peut que le processus ait été interrompu ou que la session ait expiré. Veuillez réessayer.';

  @override
  String get passkeysOffErrorTitle => 'Le service Passkeys est indisponible';

  @override
  String get never => 'Jamais';

  @override
  String get unable_to_process_your_request => 'Impossible de traiter votre demande';

  @override
  String get unable_to_process_your_request_description => 'Nous rencontrons un problème temporaire lors du traitement de votre demande. Veuillez réessayer ultérieurement.';
}
