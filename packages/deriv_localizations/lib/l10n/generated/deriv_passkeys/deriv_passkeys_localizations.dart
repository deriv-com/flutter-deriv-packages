import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'deriv_passkeys_localizations_en.dart';

/// Callers can lookup localized strings with an instance of DerivPasskeysLocalizations
/// returned by `DerivPasskeysLocalizations.of(context)`.
///
/// Applications need to include `DerivPasskeysLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'deriv_passkeys/deriv_passkeys_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: DerivPasskeysLocalizations.localizationsDelegates,
///   supportedLocales: DerivPasskeysLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the DerivPasskeysLocalizations.supportedLocales
/// property.
abstract class DerivPasskeysLocalizations {
  DerivPasskeysLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static DerivPasskeysLocalizations? of(BuildContext context) {
    return Localizations.of<DerivPasskeysLocalizations>(context, DerivPasskeysLocalizations);
  }

  static const LocalizationsDelegate<DerivPasskeysLocalizations> delegate = _DerivPasskeysLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en')
  ];

  /// No description provided for @passkeyCreatedSuccessTitle.
  ///
  /// In en, this message translates to:
  /// **'Success!'**
  String get passkeyCreatedSuccessTitle;

  /// No description provided for @passkeyCreatedSuccessMessage.
  ///
  /// In en, this message translates to:
  /// **'Your account is now secured with a passkey. Manage your passkey through your {platformName} account settings.'**
  String passkeyCreatedSuccessMessage(String platformName);

  /// No description provided for @continue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continue;

  /// No description provided for @unexpectedError.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred!'**
  String get unexpectedError;

  /// No description provided for @unexpectedErrorDescription.
  ///
  /// In en, this message translates to:
  /// **'Please try again later.'**
  String get unexpectedErrorDescription;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'Ok'**
  String get ok;

  /// No description provided for @createPassKey.
  ///
  /// In en, this message translates to:
  /// **'Create Passkey'**
  String get createPassKey;

  /// No description provided for @experienceSaferLogins.
  ///
  /// In en, this message translates to:
  /// **'Experience safer logins'**
  String get experienceSaferLogins;

  /// No description provided for @enhanceSecurity.
  ///
  /// In en, this message translates to:
  /// **'To enhance your security, tap Create passkey'**
  String get enhanceSecurity;

  /// No description provided for @here.
  ///
  /// In en, this message translates to:
  /// **'here'**
  String get here;

  /// No description provided for @effortlessLogin.
  ///
  /// In en, this message translates to:
  /// **'Effortless login with passkeys'**
  String get effortlessLogin;

  /// No description provided for @whatArePasskeys.
  ///
  /// In en, this message translates to:
  /// **'What are passkeys?'**
  String get whatArePasskeys;

  /// No description provided for @whatArePasskeysDescription.
  ///
  /// In en, this message translates to:
  /// **'Passkeys are a security measure that lets you log in the same way you unlock your device: with a fingerprint, a face scan, or a screen lock PIN.'**
  String get whatArePasskeysDescription;

  /// No description provided for @whyPasskeys.
  ///
  /// In en, this message translates to:
  /// **'Why passkeys?'**
  String get whyPasskeys;

  /// No description provided for @whyPasskeysDescription.
  ///
  /// In en, this message translates to:
  /// **'Passkeys are an added layer of security that protects your account against unauthorised access and phishing attacks.'**
  String get whyPasskeysDescription;

  /// No description provided for @howToCreatePasskey.
  ///
  /// In en, this message translates to:
  /// **'How to create a passkey?'**
  String get howToCreatePasskey;

  /// No description provided for @howToCreatePasskeyDescription.
  ///
  /// In en, this message translates to:
  /// **'Go to ‘Account Settings’ to set up your passkey. Each device can only save one passkey; however, iOS users may still see the \"Create passkey\" button due to iOS’s ability to save passkeys on other devices.'**
  String get howToCreatePasskeyDescription;

  /// No description provided for @whereArePasskeysSaved.
  ///
  /// In en, this message translates to:
  /// **'Where are passkeys saved?'**
  String get whereArePasskeysSaved;

  /// No description provided for @whereArePasskeysSavedDescription.
  ///
  /// In en, this message translates to:
  /// **'Passkeys are saved in your Google password manager for Android devices and in iCloud keychain on iOS devices to help you sign in on other devices.'**
  String get whereArePasskeysSavedDescription;

  /// No description provided for @whatHappensIfEmailChanged.
  ///
  /// In en, this message translates to:
  /// **'What happens if my Deriv account email is changed?'**
  String get whatHappensIfEmailChanged;

  /// No description provided for @whatHappensIfEmailChangedDescription.
  ///
  /// In en, this message translates to:
  /// **'Even if you change your email address, you can still continue to log in to your Deriv account with the same passkey.'**
  String get whatHappensIfEmailChangedDescription;

  /// No description provided for @tips.
  ///
  /// In en, this message translates to:
  /// **'Tips'**
  String get tips;

  /// No description provided for @beforeUsingPasskeys.
  ///
  /// In en, this message translates to:
  /// **'Before using passkeys'**
  String get beforeUsingPasskeys;

  /// No description provided for @enableScreenLock.
  ///
  /// In en, this message translates to:
  /// **'Enable screen lock on your device.'**
  String get enableScreenLock;

  /// No description provided for @signInGoogleOrIcloud.
  ///
  /// In en, this message translates to:
  /// **'Sign in to your Google or iCloud account.'**
  String get signInGoogleOrIcloud;

  /// No description provided for @enableBluetooth.
  ///
  /// In en, this message translates to:
  /// **'Enable Bluetooth.'**
  String get enableBluetooth;
}

class _DerivPasskeysLocalizationsDelegate extends LocalizationsDelegate<DerivPasskeysLocalizations> {
  const _DerivPasskeysLocalizationsDelegate();

  @override
  Future<DerivPasskeysLocalizations> load(Locale locale) {
    return SynchronousFuture<DerivPasskeysLocalizations>(lookupDerivPasskeysLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_DerivPasskeysLocalizationsDelegate old) => false;
}

DerivPasskeysLocalizations lookupDerivPasskeysLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return DerivPasskeysLocalizationsEn();
  }

  throw FlutterError(
    'DerivPasskeysLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
