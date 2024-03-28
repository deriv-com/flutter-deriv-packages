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
  String get whatArePasskeysDescription => 'Passkeys are a security measure that lets you log in the same way you unlock your device: with a fingerprint, a face scan, or a screen lock PIN.';

  @override
  String get whyPasskeys => 'Why passkeys?';

  @override
  String get whyPasskeysDescription => 'Passkeys are an added layer of security that protects your account against unauthorised access and phishing attacks.';

  @override
  String get howToCreatePasskey => 'How to create a passkey?';

  @override
  String get howToCreatePasskeyDescription => 'Go to ‘Account Settings’ to set up your passkey. Each device can only save one passkey; however, iOS users may still see the \"Create passkey\" button due to iOS’s ability to save passkeys on other devices.';

  @override
  String get whereArePasskeysSaved => 'Where are passkeys saved?';

  @override
  String get whereArePasskeysSavedDescription => 'Passkeys are saved in your Google password manager for Android devices and in iCloud keychain on iOS devices to help you sign in on other devices.';

  @override
  String get whatHappensIfEmailChanged => 'What happens if my Deriv account email is changed?';

  @override
  String get whatHappensIfEmailChangedDescription => 'Even if you change your email address, you can still continue to log in to your Deriv account with the same passkey.';

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
}
