import 'deriv_passkeys_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class DerivPasskeysLocalizationsEn extends DerivPasskeysLocalizations {
  DerivPasskeysLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get passkeyCreatedSuccessTitle => 'Success!';

  @override
  String passkeyCreatedSuccessMessage(String platformName) {
    return 'Your account is now secured with a biometrics. Manage your biometric data through your $platformName account settings.';
  }

  @override
  String get continueButtonText => 'Continue';

  @override
  String get unexpectedError => 'An unexpected error occurred!';

  @override
  String get unexpectedErrorDescription => 'Please try again later.';

  @override
  String get ok => 'Ok';

  @override
  String get experienceSaferLogins => 'Your key to safer logins';

  @override
  String get enhanceSecurity => 'Use fingerprint, face recognition, or other biometric data to log in easily and securely.';

  @override
  String get here => 'here';

  @override
  String get effortlessLogin => 'Effortless login with biometrics';

  @override
  String get whatArePasskeys => 'What are biometrics?';

  @override
  String get whatArePasskeysDescriptionPoint1 => 'A secure alternative to passwords.';

  @override
  String get whatArePasskeysDescriptionPoint2 => 'Unlock your account using fingerprint, face recognition, or device PIN.';

  @override
  String get whyPasskeys => 'Why use biometrics?';

  @override
  String get whyPasskeysDescription1 => 'Shields against unauthorised access.';

  @override
  String get whyPasskeysDescription2 => 'Protects from phishing attempts.';

  @override
  String get howToCreatePasskey => 'How to enable biometrics?';

  @override
  String get howToCreatePasskeyDescription1 => 'Go to ‘Account Settings’ on Deriv.';

  @override
  String get howToCreatePasskeyDescription2 => 'Tap ‘Biometrics‘ to create your biometrics.';

  @override
  String get p2pHowToCreatePasskey => 'How to enable biometrics?';

  @override
  String get p2pHowToCreatePasskeyDescription1 => 'Go to ‘Profile‘ in your Deriv P2P app.';

  @override
  String get p2pHowToCreatePasskeyDescription2 => 'Tap ‘Biometrics‘ to create your biometrics.';

  @override
  String get whereArePasskeysSaved => 'Where is biometric data stored?';

  @override
  String get whereArePasskeysSavedDescriptionAndroid => 'Android: Google password manager.';

  @override
  String get whereArePasskeysSavedDescriptionIOS => 'iOS: iCloud keychain.';

  @override
  String get whatHappensIfEmailChanged => 'What if I change the email on my Deriv account?';

  @override
  String get whatHappensIfEmailChangedDescription1 => 'No problem! Your biometrics still works.';

  @override
  String get whatHappensIfEmailChangedDescription2 => 'You can log in using your existing biometrics.';

  @override
  String get tips => 'Tips';

  @override
  String get beforeUsingPasskeys => 'Before using biometrics';

  @override
  String get enableScreenLock => 'Enable screen lock on your device.';

  @override
  String get signInGoogleOrIcloud => 'Sign in to your Google or iCloud account.';

  @override
  String get enableBluetooth => 'Enable Bluetooth.';

  @override
  String get noPasskeyFound => 'No biometrics found!';

  @override
  String get noPasskeyFoundDescription => 'Please create a biometrics to use this feature.';

  @override
  String get maybeLater => 'Maybe later';

  @override
  String get effortlessLoginWithPasskeys => 'Effortless login with biometrics';

  @override
  String get learnMoreAboutPasskeys => 'Learn more about biometrics';

  @override
  String get noNeedToRememberPassword => 'No need to remember a password';

  @override
  String get useYourBiometrics => 'Enhanced security with biometrics or screen lock';

  @override
  String get syncAcrossDevices => 'Sync across devices';

  @override
  String get createPasskey => 'Enable biometrics';

  @override
  String get unsupportedPlatform => 'Unsupported Platform';

  @override
  String get storedOn => 'Stored on';

  @override
  String get lastUsed => 'Last used';

  @override
  String get rename => 'Rename';

  @override
  String get revoke => 'Revoke';

  @override
  String get continueTradingButtonText => 'Trade now';

  @override
  String get addMorePasskeysButtonText => 'Add new biometrics';

  @override
  String get unableToSetupPasskey => 'Unable to setup biometrics';

  @override
  String get unableToSetupPasskeyDescription => 'We encountered an issue while setting up your biometrics. The process might have been interrupted, or the session timed out. Please try again.';

  @override
  String get passkeysOffErrorTitle => 'The Biometrics service is unavailable';

  @override
  String get never => 'Never';

  @override
  String get unable_to_process_your_request => 'Unable to process your request';

  @override
  String get unable_to_process_your_request_description => 'We’re experiencing a temporary issue in processing your request. Please try again later.';
}
