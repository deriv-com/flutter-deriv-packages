import 'deriv_auth_localizations.dart';

/// The translations for French (`fr`).
class DerivAuthLocalizationsFr extends DerivAuthLocalizations {
  DerivAuthLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get labelNotAvailable => 'Non disponible';

  @override
  String warnNotAvailableCountriesTitle(String app) {
    return '$app n\'est pas disponible dans votre pays';
  }

  @override
  String get actionOk => 'OK';

  @override
  String get warnNotAvailableCountries =>
      'Si vous avez des questions, contactez-nous par ';

  @override
  String get labelLiveChat => 'Chat en direct';

  @override
  String get actionSignUpForFree => 'Inscrivez-vous gratuitement';

  @override
  String get actionLogin => 'Se connecter';

  @override
  String get labelTwoFactorAuth => 'Authentification à deux facteurs';

  @override
  String get informEnterTwoFactorAuthCode =>
      'Saisissez le code à 6 chiffres qui s\'affiche sur l\'application d\'authentification de votre téléphone.';

  @override
  String get labelTwoFactorAuthenticationCode => 'code 2FA';

  @override
  String get actionProceed => 'Continuer';

  @override
  String get labelLogIn => 'Se connecter';

  @override
  String get informLoginOptions => 'Ou connectez-vous avec';

  @override
  String get labelEmail => 'E-mail';

  @override
  String get labelPassword => 'Mot de passe';

  @override
  String get actionForgotPassword => 'Mot de passe oublié ?';

  @override
  String get labelDontHaveAnAccountYet => 'Vous n\'avez pas encore de compte ?';

  @override
  String get actionCreateANewAccount => 'Créer un compte';

  @override
  String get informInvalidEmailFormat => 'Saisissez une adresse e-mail valide';

  @override
  String get warnPasswordLength => 'Vous devez saisir entre 6 à 25 caractères.';

  @override
  String get labelResetPassword => 'Réinitialiser le mot';

  @override
  String get labelChooseNewPass => 'Définir un nouveau mot de passe';

  @override
  String get labelCreatePass => 'Mot de passe';

  @override
  String get informYourPassHasBeenReset =>
      'Votre mot de passe a été réinitialisé';

  @override
  String get informRedirectLogin =>
      'Vous devrez vous connecter à l\'aide de votre nouveau mot de passe. Patientez, nous vous redirigeons.';

  @override
  String get actionResetPass => 'Réinitialiser mon mot de passe';

  @override
  String get informInvalidPasswordFormat =>
      'Veuillez saisir un mot de passe valide';

  @override
  String get labelCheckEmail => 'Vérifiez votre e-mail';

  @override
  String informSendResetPasswordEmail(String email) {
    return 'Nous avons envoyé un message à l\'adresse $email contenant un lien de réinitialisation de votre mot de passe.';
  }

  @override
  String get informResetPassByEmail =>
      'Nous vous enverrons des instructions par e-mail pour la réinitialisation de votre mot de passe.';

  @override
  String get labelSelectCountry => 'Où résidez-vous ?';

  @override
  String get labelChooseCountry => 'Sélectionnez votre pays';

  @override
  String get warnCountryNotAvailable =>
      'Malheureusement, Deriv n\'est pas disponible dans votre pays.';

  @override
  String get actionNext => 'Suivant';

  @override
  String get labelEmailIssueHeader =>
      'Si vous ne recevez pas un courriel de notre part dans les minutes qui suivent, cela peut être dû aux raisons suivantes :';

  @override
  String get labelEmailIssueSpam =>
      'L\'e-mail se trouve dans votre dossier spam (parfois des choses s\'y perdent).';

  @override
  String get labelEmailIssueWrongEmail =>
      'Vous nous avez involontairement fourni une autre adresse électronique (généralement une adresse professionnelle ou personnelle différente de celle que vous vouliez fournir).';

  @override
  String get labelEmailIssueTypo =>
      'L\'adresse e-mail que vous avez fournie comportait une erreur ou une faute de frappe (cela arrive même aux meilleurs d\'entre nous).';

  @override
  String get labelEmailIssueFirewall =>
      'Nous ne parvenons pas à envoyer d\'e-mail à cette adresse (généralement en raison de pare-feu ou de filtrage).';

  @override
  String get actionReenterEmail =>
      'Saisissez à nouveau votre e-mail et réessayez';

  @override
  String get labelKeepPassword => 'Protégez votre compte avec un mot de passe';

  @override
  String get labelCreatePassword => 'Créer un mot de passe';

  @override
  String get actionStartTrading => 'Commencer à trader';

  @override
  String get actionPrevious => 'Précédent';

  @override
  String get labelSignUp => 'S\'inscrire';

  @override
  String get labelOrSignUpWith => 'Ou inscrivez-vous avec';

  @override
  String get labelReferralInfoTitle => 'Code de parrainage de l\'affilié';

  @override
  String get infoReferralInfoDescription =>
      'Code alphanumérique fourni par un affilié Deriv, applicable uniquement pour les inscriptions par e-mail.';

  @override
  String get labelGotReferralCode => 'Vous avez un code de parrainage ?';

  @override
  String get labelHaveAccount => 'Vous avez déjà un compte ?';

  @override
  String get actionCreateAccount => 'Créer un compte démo';

  @override
  String get informInvalidReferralCode =>
      'Le code de parrainage que vous avez saisi n\'est pas valide. Vérifiez et réessayez.';

  @override
  String get labelVerifyYourEmail => 'Vérifiez votre e-mail';

  @override
  String get labelThanksEmail => 'Merci d\'avoir vérifié votre e-mail';

  @override
  String get informLetsContinue => 'Poursuivons.';

  @override
  String get actionContinue => 'Continuer';

  @override
  String get labelSearchCountry => 'Rechercher un pays';

  @override
  String informVerificationEmailSent(String email) {
    return 'Nous avons envoyé un message à l\'adresse $email contenant un lien d\'activation de votre compte.';
  }

  @override
  String get actionEmailNotReceived => 'Vous n\'avez pas reçu d\'e-mail ?';

  @override
  String get informPasswordPolicy => 'Votre mot de passe doit comporter :';

  @override
  String get informPasswordPolicyLength => 'Entre 8 à 25 caractères';

  @override
  String get informPasswordPolicyLowerAndUpper =>
      'Des lettres majuscules et minuscules';

  @override
  String get informPasswordPolicyNumber => 'Au moins un chiffre';

  @override
  String get warnPasswordContainsSymbol =>
      'Utilisez des symboles pour obtenir un mot de passe fort.';

  @override
  String get labelReferralCode => 'Code de parrainage';

  @override
  String get actionTryAgain => 'Réessayer';

  @override
  String get informInvalid2FACode =>
      'Le code que vous avez saisi n\'est pas valide. Vérifiez et réessayez.';

  @override
  String get informFailedAuthentication =>
      'Votre adresse e-mail ou votre mot de passe est peut-être incorrect. Vous êtes-vous inscrit avec un compte social ? Vérifiez et réessayez.';

  @override
  String get informDeactivatedAccount => 'Votre compte est désactivé.';

  @override
  String get informFailedAuthorization => 'Échec de l\'autorisation.';

  @override
  String get informInvalidResidence => 'Résidence non valide.';

  @override
  String get informInvalidCredentials =>
      'Informations d\'identification non valides.';

  @override
  String get informMissingOtp => 'Mot de passe à usage unique manquant.';

  @override
  String get informSelfClosed => 'Votre compte a été fermé.';

  @override
  String get informUnexpectedError => 'Une erreur inattendue s\'est produite.';

  @override
  String get informUnsupportedCountry =>
      'Votre pays n\'est pas pris en charge.';

  @override
  String get informExpiredAccount => 'Votre compte a expiré';

  @override
  String get labelCountryConsentBrazil =>
      'Je confirme par la présente que ma demande d\'ouverture d\'un compte auprès de Deriv pour y trader des produits OTC émis et offerts exclusivement en dehors du Brésil a été initiée par moi-même. Je comprends parfaitement que Deriv n\'est pas réglementé par la Commission brésilienne des valeurs mobilières et des échanges (CVM) et qu\'en contactant Deriv, j\'ai l\'intention d\'établir une relation avec une société étrangère.';

  @override
  String get informConnectionError =>
      'Erreur de connexion. Veuillez réessayer ultérieurement.';

  @override
  String get informSwitchAccountError =>
      'Erreur de changement de compte. Veuillez réessayer ultérieurement.';

  @override
  String get labelDeveloper => 'Développeur';

  @override
  String get labelEndpoint => 'Point de terminaison';

  @override
  String get semanticEndpoint => 'Point de terminaison';

  @override
  String get warnInvalidEndpoint => 'point de terminaison non valide';

  @override
  String get labelApplicationID => 'Identifiant de l\'application';

  @override
  String get semanticApplicationID => 'Identifiant de l\'application';

  @override
  String get warnInvalidApplicationID =>
      'identifiant de l\'application non valide';

  @override
  String get labelLanguage => 'Langue';
}
