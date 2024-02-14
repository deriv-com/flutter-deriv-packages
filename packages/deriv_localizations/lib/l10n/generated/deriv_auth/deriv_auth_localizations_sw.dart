import 'deriv_auth_localizations.dart';

/// The translations for Swahili (`sw`).
class DerivAuthLocalizationsSw extends DerivAuthLocalizations {
  DerivAuthLocalizationsSw([String locale = 'sw']) : super(locale);

  @override
  String get labelNotAvailable => 'Haipatikani';

  @override
  String warnNotAvailableCountriesTitle(String app) {
    return '$app isn\'t available in your country';
  }

  @override
  String get actionOk => 'SAWA';

  @override
  String get warnNotAvailableCountries => 'If you have any questions, contact us via ';

  @override
  String get labelLiveChat => 'Mazungumzo mubashara';

  @override
  String get actionGetAFreeAccount => 'Get a free account';

  @override
  String get actionLogin => 'Ingia';

  @override
  String get labelTwoFactorAuth => 'Uthibitishaji-wa hatua mbili';

  @override
  String get informEnterTwoFactorAuthCode => 'Enter the 6-digit code from the authenticator app on your phone.';

  @override
  String get labelTwoFactorAuthenticationCode => '2FA code';

  @override
  String get actionProceed => 'Endelea';

  @override
  String get labelLogIn => 'Ingia';

  @override
  String get informLoginOptions => 'Or log in with';

  @override
  String get labelEmail => 'Barua pepe';

  @override
  String get labelPassword => 'Nenosiri';

  @override
  String get actionForgotPassword => 'Forgot password?';

  @override
  String get labelDontHaveAnAccountYet => 'Don’t have an account yet?';

  @override
  String get actionCreateANewAccount => 'Create a new account';

  @override
  String get informInvalidEmailFormat => 'Enter a valid email address';

  @override
  String get warnPasswordLength => 'Unapaswa kuingiza mchanganyiko wa tarakimu 8-25.';

  @override
  String get labelResetPassword => 'Reset password';

  @override
  String get labelChooseNewPass => 'Choose a new password';

  @override
  String get labelCreatePass => 'Password';

  @override
  String get informYourPassHasBeenReset => 'Your password has been reset';

  @override
  String get informRedirectLogin => 'You’ll need to log in with your new password. Hang on, we’re redirecting you.';

  @override
  String get actionResetPass => 'Weka upya nywila yangu';

  @override
  String get informInvalidPasswordFormat => 'Please enter a valid password format';

  @override
  String get labelCheckEmail => 'Angalia barua pepe yako';

  @override
  String informSendResetPasswordEmail(String email) {
    return 'We’ve sent a message to $email with a link to reset your password.';
  }

  @override
  String get informResetPassByEmail => 'Tutakutumia barua pepe yenye maelekezo ya kuweka upya nenosiri lako.';

  @override
  String get labelSelectCountry => 'Where do you live?';

  @override
  String get labelChooseCountry => 'Choose country';

  @override
  String get warnCountryNotAvailable => 'Unfortunately, Deriv is not available in your country.';

  @override
  String get actionNext => 'Ifuatayo';

  @override
  String get labelEmailIssueHeader => 'Ikiwa huoni barua pepe kutoka kwetu ndani ya dakika chache, mambo machache yanaweza kuwa yametokea:';

  @override
  String get labelEmailIssueSpam => 'Barua pepe iko kwenye folda yako ya spam (Wakati mwingine mambo yanapotelea huko).';

  @override
  String get labelEmailIssueWrongEmail => 'Kwa bahati mbaya ulitupa anwani nyingine ya barua pepe (Labda ya kazi au ya binafsi badala ya ile uliyokusudia).';

  @override
  String get labelEmailIssueTypo => 'Anwani ya barua pepe uliyoingiza ilikuwa na makosa (hutokea kwa ubora kwetu sote).';

  @override
  String get labelEmailIssueFirewall => 'We can\'t deliver the email to this address (Usually because of firewalls or filtering).';

  @override
  String get actionReenterEmail => 'Ingiza tena barua pepe yako na ujaribu tena';

  @override
  String get labelKeepPassword => 'Keep your account secure with a password';

  @override
  String get labelCreatePassword => 'Create a password';

  @override
  String get actionStartTrading => 'Anza biashara';

  @override
  String get actionPrevious => 'Previous';

  @override
  String get labelSignUp => 'Jisajili';

  @override
  String get labelOrSignUpWith => 'Au jisajili kwa';

  @override
  String get labelReferralInfoTitle => 'Affiliate referral code';

  @override
  String get infoReferralInfoDescription => 'An alphanumeric code provided by a Deriv affiliate, applicable for email sign-ups only.';

  @override
  String get labelGotReferralCode => 'Got a referral code?';

  @override
  String get labelHaveAccount => 'Tayari una akaunti?';

  @override
  String get actionCreateAccount => 'Unda demo akaunti';

  @override
  String get informInvalidReferralCode => 'The referral code you entered is invalid. Check and try again.';

  @override
  String get labelVerifyYourEmail => 'Verify your email';

  @override
  String get labelThanksEmail => 'Thanks for verifying your email';

  @override
  String get informLetsContinue => 'Let\'s continue.';

  @override
  String get actionContinue => 'Endelea';

  @override
  String get labelSearchCountry => 'Search country';

  @override
  String informVerificationEmailSent(String email) {
    return 'We\'ve sent a message to $email with a link to activate your account.';
  }

  @override
  String get actionEmailNotReceived => 'Hukupokea barua pepe yako?';

  @override
  String get informPasswordPolicy => 'Your password must have:';

  @override
  String get informPasswordPolicyLength => '8-25 characters';

  @override
  String get informPasswordPolicyLowerAndUpper => 'Upper and lower case letters';

  @override
  String get informPasswordPolicyNumber => 'At least one number';

  @override
  String get warnPasswordContainsSymbol => 'Use symbols for strong password.';

  @override
  String get labelReferralCode => 'Referral Code';

  @override
  String get actionTryAgain => 'Try Again';

  @override
  String get informInvalid2FACode => 'The code you entered is invalid. Check and try again.';

  @override
  String get informFailedAuthentication => 'Your email or password may be incorrect. Did you sign up with a social account? Check and try again.';

  @override
  String get informDeactivatedAccount => 'Your account is deactivated.';

  @override
  String get informFailedAuthorization => 'Authorization failed.';

  @override
  String get informInvalidResidence => 'Invalid residence.';

  @override
  String get informInvalidCredentials => 'Invalid credentials.';

  @override
  String get informMissingOtp => 'Missing one-time password.';

  @override
  String get informSelfClosed => 'Your account has been closed.';

  @override
  String get informUnexpectedError => 'An unexpected error occurred.';

  @override
  String get informUnsupportedCountry => 'Your country is not supported.';

  @override
  String get informExpiredAccount => 'Your account is expired';

  @override
  String get labelCountryConsentBrazil => 'I hereby confirm that my request for opening an account with Deriv to trade OTC products issued and offered exclusively outside Brazil was initiated by me. I fully understand that Deriv is not regulated by CVM and by approaching Deriv I intend to set up a relation with a foreign company.';

  @override
  String get informConnectionError => 'Connection error. Please try again later.';

  @override
  String get informSwitchAccountError => 'Switch account error. Please try again later.';

  @override
  String get labelDeveloper => 'Developer';

  @override
  String get labelEndpoint => 'Pointi ya mwisho';

  @override
  String get semanticEndpoint => 'Pointi ya mwisho';

  @override
  String get warnInvalidEndpoint => 'invalid endpoint';

  @override
  String get labelApplicationID => 'Application ID';

  @override
  String get semanticApplicationID => 'Application ID';

  @override
  String get warnInvalidApplicationID => 'invalid application ID';
}
