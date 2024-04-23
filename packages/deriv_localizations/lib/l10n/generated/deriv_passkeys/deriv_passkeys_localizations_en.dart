import 'deriv_passkeys_localizations.dart';

/// The translations for English (`en`).
class DerivPasskeysLocalizationsEn extends DerivPasskeysLocalizations {
  DerivPasskeysLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get passkeyCreatedSuccessTitle => 'Success!';

  @override
  String passkeyCreatedSuccessMessage(String platformName) {
    return 'Your account is now secured with a passkey. Manage your passkey through your $platformName account settings.';
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
  String get createPassKey => 'Create Passkey';

  @override
  String get experienceSaferLogins => 'Experience safer logins';

  @override
  String get enhanceSecurity => 'To enhance your security, tap Create passkey';

  @override
  String get here => 'here';

  @override
  String get effortlessLogin => 'Effortless login with passkeys';

  @override
  String get whatArePasskeys => 'What are passkeys?';

  @override
  String get whatArePasskeysDescriptionPoint1 => 'Secure alternative to passwords.';

  @override
  String get whatArePasskeysDescriptionPoint2 => 'Unlock your account like your phone - with biometrics, face scan or PIN.';

  @override
  String get whyPasskeys => 'Why passkeys?';

  @override
  String get whyPasskeysDescription1 => 'Extra security layer.';

  @override
  String get whyPasskeysDescription2 => 'Shields against unauthorised access and phishing.';

  @override
  String get howToCreatePasskey => 'How to create a passkey?';

  @override
  String get howToCreatePasskeyDescription1 => 'Go to ‘Account Settings’ on Deriv.';

  @override
  String get howToCreatePasskeyDescription2 => 'You can create one passkey per device.';

  @override
  String get whereArePasskeysSaved => 'Where are passkeys saved?';

  @override
  String get whereArePasskeysSavedDescriptionAndroid => 'Android: Google password manager.';

  @override
  String get whereArePasskeysSavedDescriptionIOS => 'iOS: iCloud keychain.';

  @override
  String get whatHappensIfEmailChanged => 'What happens if my Deriv account email is changed?';

  @override
  String get whatHappensIfEmailChangedDescription1 => 'No problem! Your passkey still works.';

  @override
  String get whatHappensIfEmailChangedDescription2 => 'Sign in to Deriv with your existing passkey.';

  @override
  String get tips => 'Tips';

  @override
  String get beforeUsingPasskeys => 'Before using passkeys';

  @override
  String get enableScreenLock => 'Enable screen lock on your device.';

  @override
  String get signInGoogleOrIcloud => 'Sign in to your Google or iCloud account.';

  @override
  String get enableBluetooth => 'Enable Bluetooth.';

  @override
  String get noPasskeyFound => 'No passkey found!';

  @override
  String get noPasskeyFoundDescription => 'Please create a passkey to use this feature.';

  @override
  String get maybeLater => 'Maybe later';

  @override
  String get effortlessLoginWithPasskeys => 'Effortless login with passkeys';

  @override
  String get learnMoreAboutPasskeys => 'Learn more about passkeys';

  @override
  String get noNeedToRememberPassword => 'No need to remember a password';

  @override
  String get useYourBiometrics => 'Enhanced security with biometrics or screen lock';

  @override
  String get syncAcrossAllDevices => 'Sync across all devices';

  @override
  String get createPasskey => 'Create Passkey';

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
  String get continueTradingButtonText => 'Continue Trading';

  @override
  String get addMorePasskeysButtonText => 'Add More Passkeys';
}
