import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'deriv_passkeys_localizations_ar.dart';
import 'deriv_passkeys_localizations_bn.dart';
import 'deriv_passkeys_localizations_de.dart';
import 'deriv_passkeys_localizations_en.dart';
import 'deriv_passkeys_localizations_es.dart';
import 'deriv_passkeys_localizations_fr.dart';
import 'deriv_passkeys_localizations_it.dart';
import 'deriv_passkeys_localizations_km.dart';
import 'deriv_passkeys_localizations_ko.dart';
import 'deriv_passkeys_localizations_mn.dart';
import 'deriv_passkeys_localizations_pl.dart';
import 'deriv_passkeys_localizations_pt.dart';
import 'deriv_passkeys_localizations_ru.dart';
import 'deriv_passkeys_localizations_si.dart';
import 'deriv_passkeys_localizations_sw.dart';
import 'deriv_passkeys_localizations_th.dart';
import 'deriv_passkeys_localizations_tr.dart';
import 'deriv_passkeys_localizations_uz.dart';
import 'deriv_passkeys_localizations_vi.dart';
import 'deriv_passkeys_localizations_zh.dart';

// ignore_for_file: type=lint

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
  DerivPasskeysLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static DerivPasskeysLocalizations of(BuildContext context) {
    return Localizations.of<DerivPasskeysLocalizations>(
        context, DerivPasskeysLocalizations)!;
  }

  static const LocalizationsDelegate<DerivPasskeysLocalizations> delegate =
      _DerivPasskeysLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('bn'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('it'),
    Locale('km'),
    Locale('ko'),
    Locale('mn'),
    Locale('pl'),
    Locale('pt'),
    Locale('ru'),
    Locale('si'),
    Locale('sw'),
    Locale('th'),
    Locale('tr'),
    Locale('uz'),
    Locale('vi'),
    Locale('zh', 'CN'),
    Locale('zh', 'TW'),
    Locale('zh')
  ];

  /// No description provided for @passkeyCreatedSuccessTitle.
  ///
  /// In en, this message translates to:
  /// **'Success!'**
  String get passkeyCreatedSuccessTitle;

  /// No description provided for @passkeyCreatedSuccessMessage.
  ///
  /// In en, this message translates to:
  /// **'Your account is now secured with a biometrics. Manage your biometric data through your {platformName} account settings.'**
  String passkeyCreatedSuccessMessage(String platformName);

  /// No description provided for @continueButtonText.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButtonText;

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

  /// No description provided for @experienceSaferLogins.
  ///
  /// In en, this message translates to:
  /// **'Your key to safer logins'**
  String get experienceSaferLogins;

  /// No description provided for @enhanceSecurity.
  ///
  /// In en, this message translates to:
  /// **'Use fingerprint, face recognition, or other biometric data to log in easily and securely.'**
  String get enhanceSecurity;

  /// No description provided for @here.
  ///
  /// In en, this message translates to:
  /// **'here'**
  String get here;

  /// No description provided for @effortlessLogin.
  ///
  /// In en, this message translates to:
  /// **'Effortless login with biometrics'**
  String get effortlessLogin;

  /// No description provided for @whatArePasskeys.
  ///
  /// In en, this message translates to:
  /// **'What are biometrics?'**
  String get whatArePasskeys;

  /// No description provided for @whatArePasskeysDescriptionPoint1.
  ///
  /// In en, this message translates to:
  /// **'A secure alternative to passwords.'**
  String get whatArePasskeysDescriptionPoint1;

  /// No description provided for @whatArePasskeysDescriptionPoint2.
  ///
  /// In en, this message translates to:
  /// **'Unlock your account using fingerprint, face recognition, or device PIN.'**
  String get whatArePasskeysDescriptionPoint2;

  /// No description provided for @whyPasskeys.
  ///
  /// In en, this message translates to:
  /// **'Why use biometrics?'**
  String get whyPasskeys;

  /// No description provided for @whyPasskeysDescription1.
  ///
  /// In en, this message translates to:
  /// **'Shields against unauthorised access.'**
  String get whyPasskeysDescription1;

  /// No description provided for @whyPasskeysDescription2.
  ///
  /// In en, this message translates to:
  /// **'Protects from phishing attempts.'**
  String get whyPasskeysDescription2;

  /// No description provided for @howToCreatePasskey.
  ///
  /// In en, this message translates to:
  /// **'How to enable biometrics?'**
  String get howToCreatePasskey;

  /// No description provided for @howToCreatePasskeyDescription1.
  ///
  /// In en, this message translates to:
  /// **'Go to ‘Account Settings’ on Deriv.'**
  String get howToCreatePasskeyDescription1;

  /// No description provided for @howToCreatePasskeyDescription2.
  ///
  /// In en, this message translates to:
  /// **'Tap ‘Biometrics‘ to create your biometrics.'**
  String get howToCreatePasskeyDescription2;

  /// No description provided for @p2pHowToCreatePasskey.
  ///
  /// In en, this message translates to:
  /// **'How to enable biometrics?'**
  String get p2pHowToCreatePasskey;

  /// No description provided for @p2pHowToCreatePasskeyDescription1.
  ///
  /// In en, this message translates to:
  /// **'Go to ‘Profile‘ in your Deriv P2P app.'**
  String get p2pHowToCreatePasskeyDescription1;

  /// No description provided for @p2pHowToCreatePasskeyDescription2.
  ///
  /// In en, this message translates to:
  /// **'Tap ‘Biometrics‘ to create your biometrics.'**
  String get p2pHowToCreatePasskeyDescription2;

  /// No description provided for @whereArePasskeysSaved.
  ///
  /// In en, this message translates to:
  /// **'Where is biometric data stored?'**
  String get whereArePasskeysSaved;

  /// No description provided for @whereArePasskeysSavedDescriptionAndroid.
  ///
  /// In en, this message translates to:
  /// **'Android: Google password manager.'**
  String get whereArePasskeysSavedDescriptionAndroid;

  /// No description provided for @whereArePasskeysSavedDescriptionIOS.
  ///
  /// In en, this message translates to:
  /// **'iOS: iCloud keychain.'**
  String get whereArePasskeysSavedDescriptionIOS;

  /// No description provided for @whatHappensIfEmailChanged.
  ///
  /// In en, this message translates to:
  /// **'What if I change the email on my Deriv account?'**
  String get whatHappensIfEmailChanged;

  /// No description provided for @whatHappensIfEmailChangedDescription1.
  ///
  /// In en, this message translates to:
  /// **'No problem! Your biometrics still works.'**
  String get whatHappensIfEmailChangedDescription1;

  /// No description provided for @whatHappensIfEmailChangedDescription2.
  ///
  /// In en, this message translates to:
  /// **'You can log in using your existing biometrics.'**
  String get whatHappensIfEmailChangedDescription2;

  /// No description provided for @tips.
  ///
  /// In en, this message translates to:
  /// **'Tips'**
  String get tips;

  /// No description provided for @beforeUsingPasskeys.
  ///
  /// In en, this message translates to:
  /// **'Before using biometrics'**
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

  /// No description provided for @noPasskeyFound.
  ///
  /// In en, this message translates to:
  /// **'No biometrics found!'**
  String get noPasskeyFound;

  /// No description provided for @noPasskeyFoundDescription.
  ///
  /// In en, this message translates to:
  /// **'Please create a biometrics to use this feature.'**
  String get noPasskeyFoundDescription;

  /// No description provided for @maybeLater.
  ///
  /// In en, this message translates to:
  /// **'Maybe later'**
  String get maybeLater;

  /// No description provided for @effortlessLoginWithPasskeys.
  ///
  /// In en, this message translates to:
  /// **'Effortless login with biometrics'**
  String get effortlessLoginWithPasskeys;

  /// No description provided for @learnMoreAboutPasskeys.
  ///
  /// In en, this message translates to:
  /// **'Learn more about biometrics'**
  String get learnMoreAboutPasskeys;

  /// No description provided for @noNeedToRememberPassword.
  ///
  /// In en, this message translates to:
  /// **'No need to remember a password'**
  String get noNeedToRememberPassword;

  /// No description provided for @useYourBiometrics.
  ///
  /// In en, this message translates to:
  /// **'Enhanced security with biometrics or screen lock'**
  String get useYourBiometrics;

  /// No description provided for @syncAcrossDevices.
  ///
  /// In en, this message translates to:
  /// **'Sync across devices'**
  String get syncAcrossDevices;

  /// No description provided for @createPasskey.
  ///
  /// In en, this message translates to:
  /// **'Enable biometrics'**
  String get createPasskey;

  /// No description provided for @unsupportedPlatform.
  ///
  /// In en, this message translates to:
  /// **'Unsupported Platform'**
  String get unsupportedPlatform;

  /// No description provided for @storedOn.
  ///
  /// In en, this message translates to:
  /// **'Stored on'**
  String get storedOn;

  /// No description provided for @lastUsed.
  ///
  /// In en, this message translates to:
  /// **'Last used'**
  String get lastUsed;

  /// No description provided for @rename.
  ///
  /// In en, this message translates to:
  /// **'Rename'**
  String get rename;

  /// No description provided for @revoke.
  ///
  /// In en, this message translates to:
  /// **'Revoke'**
  String get revoke;

  /// No description provided for @continueTradingButtonText.
  ///
  /// In en, this message translates to:
  /// **'Trade now'**
  String get continueTradingButtonText;

  /// No description provided for @addMorePasskeysButtonText.
  ///
  /// In en, this message translates to:
  /// **'Add new biometrics'**
  String get addMorePasskeysButtonText;

  /// No description provided for @unableToSetupPasskey.
  ///
  /// In en, this message translates to:
  /// **'Unable to setup biometrics'**
  String get unableToSetupPasskey;

  /// No description provided for @unableToSetupPasskeyDescription.
  ///
  /// In en, this message translates to:
  /// **'We encountered an issue while setting up your biometrics. The process might have been interrupted, or the session timed out. Please try again.'**
  String get unableToSetupPasskeyDescription;

  /// No description provided for @passkeysOffErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'The Biometrics service is unavailable'**
  String get passkeysOffErrorTitle;

  /// No description provided for @never.
  ///
  /// In en, this message translates to:
  /// **'Never'**
  String get never;

  /// No description provided for @unable_to_process_your_request.
  ///
  /// In en, this message translates to:
  /// **'Unable to process your request'**
  String get unable_to_process_your_request;

  /// No description provided for @unable_to_process_your_request_description.
  ///
  /// In en, this message translates to:
  /// **'We’re experiencing a temporary issue in processing your request. Please try again later.'**
  String get unable_to_process_your_request_description;
}

class _DerivPasskeysLocalizationsDelegate
    extends LocalizationsDelegate<DerivPasskeysLocalizations> {
  const _DerivPasskeysLocalizationsDelegate();

  @override
  Future<DerivPasskeysLocalizations> load(Locale locale) {
    return SynchronousFuture<DerivPasskeysLocalizations>(
        lookupDerivPasskeysLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'ar',
        'bn',
        'de',
        'en',
        'es',
        'fr',
        'it',
        'km',
        'ko',
        'mn',
        'pl',
        'pt',
        'ru',
        'si',
        'sw',
        'th',
        'tr',
        'uz',
        'vi',
        'zh'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_DerivPasskeysLocalizationsDelegate old) => false;
}

DerivPasskeysLocalizations lookupDerivPasskeysLocalizations(Locale locale) {
  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'zh':
      {
        switch (locale.countryCode) {
          case 'CN':
            return DerivPasskeysLocalizationsZhCn();
          case 'TW':
            return DerivPasskeysLocalizationsZhTw();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return DerivPasskeysLocalizationsAr();
    case 'bn':
      return DerivPasskeysLocalizationsBn();
    case 'de':
      return DerivPasskeysLocalizationsDe();
    case 'en':
      return DerivPasskeysLocalizationsEn();
    case 'es':
      return DerivPasskeysLocalizationsEs();
    case 'fr':
      return DerivPasskeysLocalizationsFr();
    case 'it':
      return DerivPasskeysLocalizationsIt();
    case 'km':
      return DerivPasskeysLocalizationsKm();
    case 'ko':
      return DerivPasskeysLocalizationsKo();
    case 'mn':
      return DerivPasskeysLocalizationsMn();
    case 'pl':
      return DerivPasskeysLocalizationsPl();
    case 'pt':
      return DerivPasskeysLocalizationsPt();
    case 'ru':
      return DerivPasskeysLocalizationsRu();
    case 'si':
      return DerivPasskeysLocalizationsSi();
    case 'sw':
      return DerivPasskeysLocalizationsSw();
    case 'th':
      return DerivPasskeysLocalizationsTh();
    case 'tr':
      return DerivPasskeysLocalizationsTr();
    case 'uz':
      return DerivPasskeysLocalizationsUz();
    case 'vi':
      return DerivPasskeysLocalizationsVi();
    case 'zh':
      return DerivPasskeysLocalizationsZh();
  }

  throw FlutterError(
      'DerivPasskeysLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
