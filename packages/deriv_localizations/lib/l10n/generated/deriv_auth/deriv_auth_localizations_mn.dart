import 'deriv_auth_localizations.dart';

/// The translations for Mongolian (`mn`).
class DerivAuthLocalizationsMn extends DerivAuthLocalizations {
  DerivAuthLocalizationsMn([String locale = 'mn']) : super(locale);

  @override
  String get labelNotAvailable => 'Not available';

  @override
  String warnNotAvailableCountriesTitle(String app) {
    return '$app isn\'t available in your country';
  }

  @override
  String get actionOk => 'OK';

  @override
  String get warnNotAvailableCountries => 'If you have any questions, contact us via ';

  @override
  String get labelLiveChat => 'Live chat';

  @override
  String get actionSignUpForFree => 'Sign up for free';

  @override
  String get actionLogin => 'Log in';

  @override
  String get labelTwoFactorAuth => 'Two-factor authentication';

  @override
  String get informEnterTwoFactorAuthCode => 'Enter the 6-digit code from the authenticator app on your phone.';

  @override
  String get labelTwoFactorAuthenticationCode => '2FA code';

  @override
  String get actionProceed => 'Proceed';

  @override
  String get labelLogIn => 'Log in';

  @override
  String get informLoginOptions => 'Or log in with';

  @override
  String get labelEmail => 'Email';

  @override
  String get labelPassword => 'Password';

  @override
  String get actionForgotPassword => 'Forgot password?';

  @override
  String get labelDontHaveAnAccountYet => 'Don’t have an account yet?';

  @override
  String get actionCreateANewAccount => 'Create a new account';

  @override
  String get informInvalidEmailFormat => 'Enter a valid email address';

  @override
  String get warnPasswordLength => 'You should enter 6-25 characters.';

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
  String get actionResetPass => 'Reset my password';

  @override
  String get informInvalidPasswordFormat => 'Please enter a valid password format';

  @override
  String get labelCheckEmail => 'Check your email';

  @override
  String informSendResetPasswordEmail(String email) {
    return 'We’ve sent a message to $email with a link to reset your password.';
  }

  @override
  String get informResetPassByEmail => 'We\'ll email you instructions to reset your password.';

  @override
  String get labelSelectCountry => 'Where do you live?';

  @override
  String get labelChooseCountry => 'Choose country';

  @override
  String get warnCountryNotAvailable => 'Unfortunately, Deriv is not available in your country.';

  @override
  String get actionNext => 'Next';

  @override
  String get labelEmailIssueHeader => 'If you don\'t see an email from us within a few minutes, a few things could have happened:';

  @override
  String get labelEmailIssueSpam => 'The email is in your spam folder (Sometimes things get lost there).';

  @override
  String get labelEmailIssueWrongEmail => 'You accidentally gave us another email address (Usually a work or a personal one instead of the one you meant).';

  @override
  String get labelEmailIssueTypo => 'The email address you entered had a mistake or typo (happens to the best of us).';

  @override
  String get labelEmailIssueFirewall => 'We can\'t deliver the email to this address (Usually because of firewalls or filtering).';

  @override
  String get actionReenterEmail => 'Re-enter your email and try again';

  @override
  String get labelKeepPassword => 'Keep your account secure with a password';

  @override
  String get labelCreatePassword => 'Create a password';

  @override
  String get actionStartTrading => 'Start trading';

  @override
  String get actionPrevious => 'Previous';

  @override
  String get labelSignUp => 'Sign up';

  @override
  String get labelOrSignUpWith => 'Or sign up with';

  @override
  String get labelReferralInfoTitle => 'Affiliate referral code';

  @override
  String get infoReferralInfoDescription => 'An alphanumeric code provided by a Deriv affiliate, applicable for email sign-ups only.';

  @override
  String get labelGotReferralCode => 'Got a referral code?';

  @override
  String get labelHaveAccount => 'Already have an account?';

  @override
  String get actionCreateAccount => 'Create free demo account';

  @override
  String get informInvalidReferralCode => 'The referral code you entered is invalid. Check and try again.';

  @override
  String get labelVerifyYourEmail => 'Verify your email';

  @override
  String get labelThanksEmail => 'Thanks for verifying your email';

  @override
  String get informLetsContinue => 'Let\'s continue.';

  @override
  String get actionContinue => 'Continue';

  @override
  String get labelSearchCountry => 'Search country';

  @override
  String informVerificationEmailSent(String email) {
    return 'We\'ve sent a message to $email with a link to activate your account.';
  }

  @override
  String get actionEmailNotReceived => 'Didn\'t receive your email?';

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
  String get labelEndpoint => 'Endpoint';

  @override
  String get semanticEndpoint => 'Endpoint';

  @override
  String get warnInvalidEndpoint => 'invalid endpoint';

  @override
  String get labelApplicationID => 'Application ID';

  @override
  String get semanticApplicationID => 'Application ID';

  @override
  String get warnInvalidApplicationID => 'invalid application ID';

  @override
  String get labelLanguage => 'Language';
}
