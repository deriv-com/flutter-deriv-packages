import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'deriv_auth_localizations_ar.dart';
import 'deriv_auth_localizations_bn.dart';
import 'deriv_auth_localizations_de.dart';
import 'deriv_auth_localizations_en.dart';
import 'deriv_auth_localizations_es.dart';
import 'deriv_auth_localizations_fr.dart';
import 'deriv_auth_localizations_it.dart';
import 'deriv_auth_localizations_km.dart';
import 'deriv_auth_localizations_ko.dart';
import 'deriv_auth_localizations_mn.dart';
import 'deriv_auth_localizations_pl.dart';
import 'deriv_auth_localizations_pt.dart';
import 'deriv_auth_localizations_ru.dart';
import 'deriv_auth_localizations_si.dart';
import 'deriv_auth_localizations_sw.dart';
import 'deriv_auth_localizations_th.dart';
import 'deriv_auth_localizations_tr.dart';
import 'deriv_auth_localizations_uz.dart';
import 'deriv_auth_localizations_vi.dart';
import 'deriv_auth_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of DerivAuthLocalizations
/// returned by `DerivAuthLocalizations.of(context)`.
///
/// Applications need to include `DerivAuthLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'deriv_auth/deriv_auth_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: DerivAuthLocalizations.localizationsDelegates,
///   supportedLocales: DerivAuthLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the DerivAuthLocalizations.supportedLocales
/// property.
abstract class DerivAuthLocalizations {
  DerivAuthLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static DerivAuthLocalizations of(BuildContext context) {
    return Localizations.of<DerivAuthLocalizations>(
        context, DerivAuthLocalizations)!;
  }

  static const LocalizationsDelegate<DerivAuthLocalizations> delegate =
      _DerivAuthLocalizationsDelegate();

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

  /// No description provided for @labelNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'Not available'**
  String get labelNotAvailable;

  /// A message with a single parameter
  ///
  /// In en, this message translates to:
  /// **'{app} isn\'t available in your country'**
  String warnNotAvailableCountriesTitle(String app);

  /// No description provided for @actionOk.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get actionOk;

  /// No description provided for @warnNotAvailableCountries.
  ///
  /// In en, this message translates to:
  /// **'If you have any questions, contact us via '**
  String get warnNotAvailableCountries;

  /// No description provided for @labelLiveChat.
  ///
  /// In en, this message translates to:
  /// **'Live chat'**
  String get labelLiveChat;

  /// No description provided for @actionSignUpForFree.
  ///
  /// In en, this message translates to:
  /// **'Sign up for free'**
  String get actionSignUpForFree;

  /// No description provided for @actionLogin.
  ///
  /// In en, this message translates to:
  /// **'Log in'**
  String get actionLogin;

  /// No description provided for @labelTwoFactorAuth.
  ///
  /// In en, this message translates to:
  /// **'Two-factor authentication'**
  String get labelTwoFactorAuth;

  /// No description provided for @informEnterTwoFactorAuthCode.
  ///
  /// In en, this message translates to:
  /// **'Enter the 6-digit code from the authenticator app on your phone.'**
  String get informEnterTwoFactorAuthCode;

  /// No description provided for @labelTwoFactorAuthenticationCode.
  ///
  /// In en, this message translates to:
  /// **'2FA code'**
  String get labelTwoFactorAuthenticationCode;

  /// No description provided for @actionProceed.
  ///
  /// In en, this message translates to:
  /// **'Proceed'**
  String get actionProceed;

  /// No description provided for @labelLogIn.
  ///
  /// In en, this message translates to:
  /// **'Log in'**
  String get labelLogIn;

  /// No description provided for @informLoginOptions.
  ///
  /// In en, this message translates to:
  /// **'Or log in with'**
  String get informLoginOptions;

  /// No description provided for @labelEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get labelEmail;

  /// No description provided for @labelPassword.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get labelPassword;

  /// No description provided for @actionForgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get actionForgotPassword;

  /// No description provided for @labelDontHaveAnAccountYet.
  ///
  /// In en, this message translates to:
  /// **'Don’t have an account yet?'**
  String get labelDontHaveAnAccountYet;

  /// No description provided for @actionCreateANewAccount.
  ///
  /// In en, this message translates to:
  /// **'Create a new account'**
  String get actionCreateANewAccount;

  /// No description provided for @informInvalidEmailFormat.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid email address'**
  String get informInvalidEmailFormat;

  /// No description provided for @warnPasswordLength.
  ///
  /// In en, this message translates to:
  /// **'You should enter 6-25 characters.'**
  String get warnPasswordLength;

  /// No description provided for @labelResetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset password'**
  String get labelResetPassword;

  /// No description provided for @labelChooseNewPass.
  ///
  /// In en, this message translates to:
  /// **'Choose a new password'**
  String get labelChooseNewPass;

  /// No description provided for @labelCreatePass.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get labelCreatePass;

  /// No description provided for @informYourPassHasBeenReset.
  ///
  /// In en, this message translates to:
  /// **'Your password has been reset'**
  String get informYourPassHasBeenReset;

  /// No description provided for @informRedirectLogin.
  ///
  /// In en, this message translates to:
  /// **'You’ll need to log in with your new password. Hang on, we’re redirecting you.'**
  String get informRedirectLogin;

  /// No description provided for @actionResetPass.
  ///
  /// In en, this message translates to:
  /// **'Reset my password'**
  String get actionResetPass;

  /// No description provided for @informInvalidPasswordFormat.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid password format'**
  String get informInvalidPasswordFormat;

  /// No description provided for @labelCheckEmail.
  ///
  /// In en, this message translates to:
  /// **'Check your email'**
  String get labelCheckEmail;

  /// A message with a single parameter
  ///
  /// In en, this message translates to:
  /// **'We’ve sent a message to {email} with a link to reset your password.'**
  String informSendResetPasswordEmail(String email);

  /// No description provided for @informResetPassByEmail.
  ///
  /// In en, this message translates to:
  /// **'We\'ll email you instructions to reset your password.'**
  String get informResetPassByEmail;

  /// No description provided for @labelSelectCountry.
  ///
  /// In en, this message translates to:
  /// **'Where do you live?'**
  String get labelSelectCountry;

  /// No description provided for @labelChooseCountry.
  ///
  /// In en, this message translates to:
  /// **'Choose country'**
  String get labelChooseCountry;

  /// No description provided for @warnCountryNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'Unfortunately, Deriv is not available in your country.'**
  String get warnCountryNotAvailable;

  /// No description provided for @actionNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get actionNext;

  /// No description provided for @labelEmailIssueHeader.
  ///
  /// In en, this message translates to:
  /// **'If you don\'t see an email from us within a few minutes, a few things could have happened:'**
  String get labelEmailIssueHeader;

  /// No description provided for @labelEmailIssueSpam.
  ///
  /// In en, this message translates to:
  /// **'The email is in your spam folder (Sometimes things get lost there).'**
  String get labelEmailIssueSpam;

  /// No description provided for @labelEmailIssueWrongEmail.
  ///
  /// In en, this message translates to:
  /// **'You accidentally gave us another email address (Usually a work or a personal one instead of the one you meant).'**
  String get labelEmailIssueWrongEmail;

  /// No description provided for @labelEmailIssueTypo.
  ///
  /// In en, this message translates to:
  /// **'The email address you entered had a mistake or typo (happens to the best of us).'**
  String get labelEmailIssueTypo;

  /// No description provided for @labelEmailIssueFirewall.
  ///
  /// In en, this message translates to:
  /// **'We can\'t deliver the email to this address (Usually because of firewalls or filtering).'**
  String get labelEmailIssueFirewall;

  /// No description provided for @actionReenterEmail.
  ///
  /// In en, this message translates to:
  /// **'Re-enter your email and try again'**
  String get actionReenterEmail;

  /// No description provided for @labelKeepPassword.
  ///
  /// In en, this message translates to:
  /// **'Keep your account secure with a password'**
  String get labelKeepPassword;

  /// No description provided for @labelCreatePassword.
  ///
  /// In en, this message translates to:
  /// **'Create a password'**
  String get labelCreatePassword;

  /// No description provided for @actionStartTrading.
  ///
  /// In en, this message translates to:
  /// **'Start trading'**
  String get actionStartTrading;

  /// No description provided for @actionPrevious.
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get actionPrevious;

  /// No description provided for @labelSignUp.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get labelSignUp;

  /// No description provided for @labelOrSignUpWith.
  ///
  /// In en, this message translates to:
  /// **'Or sign up with'**
  String get labelOrSignUpWith;

  /// No description provided for @labelReferralInfoTitle.
  ///
  /// In en, this message translates to:
  /// **'Affiliate referral code'**
  String get labelReferralInfoTitle;

  /// No description provided for @infoReferralInfoDescription.
  ///
  /// In en, this message translates to:
  /// **'An alphanumeric code provided by a Deriv affiliate, applicable for email sign-ups only.'**
  String get infoReferralInfoDescription;

  /// No description provided for @labelGotReferralCode.
  ///
  /// In en, this message translates to:
  /// **'Got a referral code?'**
  String get labelGotReferralCode;

  /// No description provided for @labelHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get labelHaveAccount;

  /// No description provided for @actionCreateAccount.
  ///
  /// In en, this message translates to:
  /// **'Create free demo account'**
  String get actionCreateAccount;

  /// No description provided for @informInvalidReferralCode.
  ///
  /// In en, this message translates to:
  /// **'The referral code you entered is invalid. Check and try again.'**
  String get informInvalidReferralCode;

  /// No description provided for @labelVerifyYourEmail.
  ///
  /// In en, this message translates to:
  /// **'Verify your email'**
  String get labelVerifyYourEmail;

  /// No description provided for @labelThanksEmail.
  ///
  /// In en, this message translates to:
  /// **'Thanks for verifying your email'**
  String get labelThanksEmail;

  /// No description provided for @informLetsContinue.
  ///
  /// In en, this message translates to:
  /// **'Let\'s continue.'**
  String get informLetsContinue;

  /// No description provided for @actionContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get actionContinue;

  /// No description provided for @labelSearchCountry.
  ///
  /// In en, this message translates to:
  /// **'Search country'**
  String get labelSearchCountry;

  /// A message with a single parameter
  ///
  /// In en, this message translates to:
  /// **'We\'ve sent a message to {email} with a link to activate your account.'**
  String informVerificationEmailSent(String email);

  /// No description provided for @actionEmailNotReceived.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t receive your email?'**
  String get actionEmailNotReceived;

  /// No description provided for @informPasswordPolicy.
  ///
  /// In en, this message translates to:
  /// **'Your password must have:'**
  String get informPasswordPolicy;

  /// No description provided for @informPasswordPolicyLength.
  ///
  /// In en, this message translates to:
  /// **'8-25 characters'**
  String get informPasswordPolicyLength;

  /// No description provided for @informPasswordPolicyLowerAndUpper.
  ///
  /// In en, this message translates to:
  /// **'Upper and lower case letters'**
  String get informPasswordPolicyLowerAndUpper;

  /// No description provided for @informPasswordPolicyNumber.
  ///
  /// In en, this message translates to:
  /// **'At least one number'**
  String get informPasswordPolicyNumber;

  /// No description provided for @warnPasswordContainsSymbol.
  ///
  /// In en, this message translates to:
  /// **'Use symbols for strong password.'**
  String get warnPasswordContainsSymbol;

  /// No description provided for @labelReferralCode.
  ///
  /// In en, this message translates to:
  /// **'Referral Code'**
  String get labelReferralCode;

  /// No description provided for @actionTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get actionTryAgain;

  /// No description provided for @informInvalid2FACode.
  ///
  /// In en, this message translates to:
  /// **'The code you entered is invalid. Check and try again.'**
  String get informInvalid2FACode;

  /// No description provided for @informFailedAuthentication.
  ///
  /// In en, this message translates to:
  /// **'Your email or password may be incorrect. Did you sign up with a social account? Check and try again.'**
  String get informFailedAuthentication;

  /// No description provided for @informDeactivatedAccount.
  ///
  /// In en, this message translates to:
  /// **'Your account is deactivated.'**
  String get informDeactivatedAccount;

  /// No description provided for @informFailedAuthorization.
  ///
  /// In en, this message translates to:
  /// **'Authorization failed.'**
  String get informFailedAuthorization;

  /// No description provided for @informInvalidResidence.
  ///
  /// In en, this message translates to:
  /// **'Invalid residence.'**
  String get informInvalidResidence;

  /// No description provided for @informInvalidCredentials.
  ///
  /// In en, this message translates to:
  /// **'Invalid credentials.'**
  String get informInvalidCredentials;

  /// No description provided for @informMissingOtp.
  ///
  /// In en, this message translates to:
  /// **'Missing one-time password.'**
  String get informMissingOtp;

  /// No description provided for @informSelfClosed.
  ///
  /// In en, this message translates to:
  /// **'Your account has been closed.'**
  String get informSelfClosed;

  /// No description provided for @informUnexpectedError.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred.'**
  String get informUnexpectedError;

  /// No description provided for @informUnsupportedCountry.
  ///
  /// In en, this message translates to:
  /// **'Your country is not supported.'**
  String get informUnsupportedCountry;

  /// No description provided for @informExpiredAccount.
  ///
  /// In en, this message translates to:
  /// **'Your account is expired'**
  String get informExpiredAccount;

  /// No description provided for @labelCountryConsentBrazil.
  ///
  /// In en, this message translates to:
  /// **'I hereby confirm that my request for opening an account with Deriv to trade OTC products issued and offered exclusively outside Brazil was initiated by me. I fully understand that Deriv is not regulated by CVM and by approaching Deriv I intend to set up a relation with a foreign company.'**
  String get labelCountryConsentBrazil;

  /// No description provided for @informConnectionError.
  ///
  /// In en, this message translates to:
  /// **'Connection error. Please try again later.'**
  String get informConnectionError;

  /// No description provided for @informSwitchAccountError.
  ///
  /// In en, this message translates to:
  /// **'Switch account error. Please try again later.'**
  String get informSwitchAccountError;

  /// No description provided for @labelDeveloper.
  ///
  /// In en, this message translates to:
  /// **'Developer'**
  String get labelDeveloper;

  /// No description provided for @labelEndpoint.
  ///
  /// In en, this message translates to:
  /// **'Endpoint'**
  String get labelEndpoint;

  /// No description provided for @semanticEndpoint.
  ///
  /// In en, this message translates to:
  /// **'Endpoint'**
  String get semanticEndpoint;

  /// No description provided for @warnInvalidEndpoint.
  ///
  /// In en, this message translates to:
  /// **'invalid endpoint'**
  String get warnInvalidEndpoint;

  /// No description provided for @labelApplicationID.
  ///
  /// In en, this message translates to:
  /// **'Application ID'**
  String get labelApplicationID;

  /// No description provided for @semanticApplicationID.
  ///
  /// In en, this message translates to:
  /// **'Application ID'**
  String get semanticApplicationID;

  /// No description provided for @warnInvalidApplicationID.
  ///
  /// In en, this message translates to:
  /// **'invalid application ID'**
  String get warnInvalidApplicationID;

  /// No description provided for @labelLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get labelLanguage;
}

class _DerivAuthLocalizationsDelegate
    extends LocalizationsDelegate<DerivAuthLocalizations> {
  const _DerivAuthLocalizationsDelegate();

  @override
  Future<DerivAuthLocalizations> load(Locale locale) {
    return SynchronousFuture<DerivAuthLocalizations>(
        lookupDerivAuthLocalizations(locale));
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
  bool shouldReload(_DerivAuthLocalizationsDelegate old) => false;
}

DerivAuthLocalizations lookupDerivAuthLocalizations(Locale locale) {
  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'zh':
      {
        switch (locale.countryCode) {
          case 'CN':
            return DerivAuthLocalizationsZhCn();
          case 'TW':
            return DerivAuthLocalizationsZhTw();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return DerivAuthLocalizationsAr();
    case 'bn':
      return DerivAuthLocalizationsBn();
    case 'de':
      return DerivAuthLocalizationsDe();
    case 'en':
      return DerivAuthLocalizationsEn();
    case 'es':
      return DerivAuthLocalizationsEs();
    case 'fr':
      return DerivAuthLocalizationsFr();
    case 'it':
      return DerivAuthLocalizationsIt();
    case 'km':
      return DerivAuthLocalizationsKm();
    case 'ko':
      return DerivAuthLocalizationsKo();
    case 'mn':
      return DerivAuthLocalizationsMn();
    case 'pl':
      return DerivAuthLocalizationsPl();
    case 'pt':
      return DerivAuthLocalizationsPt();
    case 'ru':
      return DerivAuthLocalizationsRu();
    case 'si':
      return DerivAuthLocalizationsSi();
    case 'sw':
      return DerivAuthLocalizationsSw();
    case 'th':
      return DerivAuthLocalizationsTh();
    case 'tr':
      return DerivAuthLocalizationsTr();
    case 'uz':
      return DerivAuthLocalizationsUz();
    case 'vi':
      return DerivAuthLocalizationsVi();
    case 'zh':
      return DerivAuthLocalizationsZh();
  }

  throw FlutterError(
      'DerivAuthLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
