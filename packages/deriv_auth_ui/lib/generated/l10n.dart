// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class DerivAuthUILocalization {
  DerivAuthUILocalization();

  static DerivAuthUILocalization? _current;

  static DerivAuthUILocalization get current {
    assert(_current != null,
        'No instance of DerivAuthUILocalization was loaded. Try to initialize the DerivAuthUILocalization delegate before accessing DerivAuthUILocalization.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<DerivAuthUILocalization> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = DerivAuthUILocalization();
      DerivAuthUILocalization._current = instance;

      return instance;
    });
  }

  static DerivAuthUILocalization of(BuildContext context) {
    final instance = DerivAuthUILocalization.maybeOf(context);
    assert(instance != null,
        'No instance of DerivAuthUILocalization present in the widget tree. Did you add DerivAuthUILocalization.delegate in localizationsDelegates?');
    return instance!;
  }

  static DerivAuthUILocalization? maybeOf(BuildContext context) {
    return Localizations.of<DerivAuthUILocalization>(
        context, DerivAuthUILocalization);
  }

  /// `Not available`
  String get labelNotAvailable {
    return Intl.message(
      'Not available',
      name: 'labelNotAvailable',
      desc: '',
      args: [],
    );
  }

  /// `{app} isn't available in your country`
  String warnNotAvailableCountriesTitle(String app) {
    return Intl.message(
      '$app isn\'t available in your country',
      name: 'warnNotAvailableCountriesTitle',
      desc: 'A message with a single parameter',
      args: [app],
    );
  }

  /// `If you have any questions, contact us via `
  String get warnNotAvailableCountries {
    return Intl.message(
      'If you have any questions, contact us via ',
      name: 'warnNotAvailableCountries',
      desc: '',
      args: [],
    );
  }

  /// `Live chat`
  String get labelLiveChat {
    return Intl.message(
      'Live chat',
      name: 'labelLiveChat',
      desc: '',
      args: [],
    );
  }

  /// `Get a free account`
  String get actionGetAFreeAccount {
    return Intl.message(
      'Get a free account',
      name: 'actionGetAFreeAccount',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get actionLogin {
    return Intl.message(
      'Log in',
      name: 'actionLogin',
      desc: '',
      args: [],
    );
  }

  /// `Two-factor authentication`
  String get labelTwoFactorAuth {
    return Intl.message(
      'Two-factor authentication',
      name: 'labelTwoFactorAuth',
      desc: '',
      args: [],
    );
  }

  /// `Enter the 6-digit code from the authenticator app on your phone.`
  String get informEnterTwoFactorAuthCode {
    return Intl.message(
      'Enter the 6-digit code from the authenticator app on your phone.',
      name: 'informEnterTwoFactorAuthCode',
      desc: '',
      args: [],
    );
  }

  /// `2FA code`
  String get labelTwoFactorAuthenticationCode {
    return Intl.message(
      '2FA code',
      name: 'labelTwoFactorAuthenticationCode',
      desc: '',
      args: [],
    );
  }

  /// `Proceed`
  String get actionProceed {
    return Intl.message(
      'Proceed',
      name: 'actionProceed',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get labelLogIn {
    return Intl.message(
      'Log in',
      name: 'labelLogIn',
      desc: '',
      args: [],
    );
  }

  /// `Or log in with`
  String get informLoginOptions {
    return Intl.message(
      'Or log in with',
      name: 'informLoginOptions',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back!`
  String get labelLoginWelcomeBack {
    return Intl.message(
      'Welcome back!',
      name: 'labelLoginWelcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `It's good to see you again. Log in to start trading.`
  String get labelLoginGreeting {
    return Intl.message(
      'It\'s good to see you again. Log in to start trading.',
      name: 'labelLoginGreeting',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get labelEmail {
    return Intl.message(
      'Email',
      name: 'labelEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get labelPassword {
    return Intl.message(
      'Password',
      name: 'labelPassword',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get actionForgotPassword {
    return Intl.message(
      'Forgot password?',
      name: 'actionForgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Don’t have an account yet?`
  String get labelDontHaveAnAccountYet {
    return Intl.message(
      'Don’t have an account yet?',
      name: 'labelDontHaveAnAccountYet',
      desc: '',
      args: [],
    );
  }

  /// `Create a new account`
  String get actionCreateANewAccount {
    return Intl.message(
      'Create a new account',
      name: 'actionCreateANewAccount',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid email address`
  String get informInvalidEmailFormat {
    return Intl.message(
      'Enter a valid email address',
      name: 'informInvalidEmailFormat',
      desc: '',
      args: [],
    );
  }

  /// `You should enter 8-25 characters.`
  String get warnPasswordLength {
    return Intl.message(
      'You should enter 8-25 characters.',
      name: 'warnPasswordLength',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get labelResetPassword {
    return Intl.message(
      'Reset Password',
      name: 'labelResetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Choose a new password`
  String get labelChooseNewPass {
    return Intl.message(
      'Choose a new password',
      name: 'labelChooseNewPass',
      desc: '',
      args: [],
    );
  }

  /// `Create a password`
  String get labelCreatePass {
    return Intl.message(
      'Create a password',
      name: 'labelCreatePass',
      desc: '',
      args: [],
    );
  }

  /// `Your password has been reset`
  String get informYourPassHasBeenReset {
    return Intl.message(
      'Your password has been reset',
      name: 'informYourPassHasBeenReset',
      desc: '',
      args: [],
    );
  }

  /// `You’ll need to log in with your new password. Hang on, we’re redirecting you.`
  String get informRedirectLogin {
    return Intl.message(
      'You’ll need to log in with your new password. Hang on, we’re redirecting you.',
      name: 'informRedirectLogin',
      desc: '',
      args: [],
    );
  }

  /// `Reset my password`
  String get actionResetPass {
    return Intl.message(
      'Reset my password',
      name: 'actionResetPass',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid password format`
  String get informInvalidPasswordFormat {
    return Intl.message(
      'Please enter a valid password format',
      name: 'informInvalidPasswordFormat',
      desc: '',
      args: [],
    );
  }

  /// `Check your email`
  String get labelCheckEmail {
    return Intl.message(
      'Check your email',
      name: 'labelCheckEmail',
      desc: '',
      args: [],
    );
  }

  /// `We’ve sent a message to {email} with a link to reset your password.`
  String informSendResetPasswordEmail(String email) {
    return Intl.message(
      'We’ve sent a message to $email with a link to reset your password.',
      name: 'informSendResetPasswordEmail',
      desc: 'A message with a single parameter',
      args: [email],
    );
  }

  /// `We'll email you instructions to reset your password.`
  String get informResetPassByEmail {
    return Intl.message(
      'We\'ll email you instructions to reset your password.',
      name: 'informResetPassByEmail',
      desc: '',
      args: [],
    );
  }

  /// `Where do you live?`
  String get labelSelectCountry {
    return Intl.message(
      'Where do you live?',
      name: 'labelSelectCountry',
      desc: '',
      args: [],
    );
  }

  /// `Choose country`
  String get labelChooseCountry {
    return Intl.message(
      'Choose country',
      name: 'labelChooseCountry',
      desc: '',
      args: [],
    );
  }

  /// `Unfortunately, Deriv is not available in your country.`
  String get warnCountryNotAvailable {
    return Intl.message(
      'Unfortunately, Deriv is not available in your country.',
      name: 'warnCountryNotAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get actionNext {
    return Intl.message(
      'Next',
      name: 'actionNext',
      desc: '',
      args: [],
    );
  }

  /// `If you don't see an email from us within a few minutes, a few things could have happened:`
  String get labelEmailIssueHeader {
    return Intl.message(
      'If you don\'t see an email from us within a few minutes, a few things could have happened:',
      name: 'labelEmailIssueHeader',
      desc: '',
      args: [],
    );
  }

  /// `The email is in your spam folder (Sometimes things get lost there).`
  String get labelEmailIssueSpam {
    return Intl.message(
      'The email is in your spam folder (Sometimes things get lost there).',
      name: 'labelEmailIssueSpam',
      desc: '',
      args: [],
    );
  }

  /// `You accidentally gave us another email address (Usually a work or a personal one instead of the one you meant).`
  String get labelEmailIssueWrongEmail {
    return Intl.message(
      'You accidentally gave us another email address (Usually a work or a personal one instead of the one you meant).',
      name: 'labelEmailIssueWrongEmail',
      desc: '',
      args: [],
    );
  }

  /// `The email address you entered had a mistake or typo (happens to the best of us).`
  String get labelEmailIssueTypo {
    return Intl.message(
      'The email address you entered had a mistake or typo (happens to the best of us).',
      name: 'labelEmailIssueTypo',
      desc: '',
      args: [],
    );
  }

  /// `We can't deliver the email to this address (Usually because of firewalls or filtering).`
  String get labelEmailIssueFirewall {
    return Intl.message(
      'We can\'t deliver the email to this address (Usually because of firewalls or filtering).',
      name: 'labelEmailIssueFirewall',
      desc: '',
      args: [],
    );
  }

  /// `Re-enter your email and try again`
  String get actionReenterEmail {
    return Intl.message(
      'Re-enter your email and try again',
      name: 'actionReenterEmail',
      desc: '',
      args: [],
    );
  }

  /// `Keep your account secure with a password`
  String get labelKeepPassword {
    return Intl.message(
      'Keep your account secure with a password',
      name: 'labelKeepPassword',
      desc: '',
      args: [],
    );
  }

  /// `Create a password`
  String get labelCreatePassword {
    return Intl.message(
      'Create a password',
      name: 'labelCreatePassword',
      desc: '',
      args: [],
    );
  }

  /// `Start trading`
  String get actionStartTrading {
    return Intl.message(
      'Start trading',
      name: 'actionStartTrading',
      desc: '',
      args: [],
    );
  }

  /// `Previous`
  String get actionPrevious {
    return Intl.message(
      'Previous',
      name: 'actionPrevious',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get labelSignUp {
    return Intl.message(
      'Sign up',
      name: 'labelSignUp',
      desc: '',
      args: [],
    );
  }

  /// `Or sign up with`
  String get labelOrSignUpWith {
    return Intl.message(
      'Or sign up with',
      name: 'labelOrSignUpWith',
      desc: '',
      args: [],
    );
  }

  /// `Affiliate referral code`
  String get labelReferralInfoTitle {
    return Intl.message(
      'Affiliate referral code',
      name: 'labelReferralInfoTitle',
      desc: '',
      args: [],
    );
  }

  /// `An alphanumeric code provided by a Deriv affiliate, applicable for email sign-ups only.`
  String get infoReferralInfoDescription {
    return Intl.message(
      'An alphanumeric code provided by a Deriv affiliate, applicable for email sign-ups only.',
      name: 'infoReferralInfoDescription',
      desc: '',
      args: [],
    );
  }

  /// `Got a referral code?`
  String get labelGotReferralCode {
    return Intl.message(
      'Got a referral code?',
      name: 'labelGotReferralCode',
      desc: '',
      args: [],
    );
  }

  /// `Start trading with Deriv`
  String get labelStartTradingWithDeriv {
    return Intl.message(
      'Start trading with Deriv',
      name: 'labelStartTradingWithDeriv',
      desc: '',
      args: [],
    );
  }

  /// `Join over 2.5 million traders worldwide who love trading on Deriv.`
  String get labelSignupPageDescription {
    return Intl.message(
      'Join over 2.5 million traders worldwide who love trading on Deriv.',
      name: 'labelSignupPageDescription',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get labelHaveAccount {
    return Intl.message(
      'Already have an account?',
      name: 'labelHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Create free demo account`
  String get actionCreateAccount {
    return Intl.message(
      'Create free demo account',
      name: 'actionCreateAccount',
      desc: '',
      args: [],
    );
  }

  /// `The referral code you entered is invalid. Check and try again.`
  String get informInvalidReferralCode {
    return Intl.message(
      'The referral code you entered is invalid. Check and try again.',
      name: 'informInvalidReferralCode',
      desc: '',
      args: [],
    );
  }

  /// `Verify your email`
  String get labelVerifyYourEmail {
    return Intl.message(
      'Verify your email',
      name: 'labelVerifyYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Thanks for verifying your email`
  String get labelThanksEmail {
    return Intl.message(
      'Thanks for verifying your email',
      name: 'labelThanksEmail',
      desc: '',
      args: [],
    );
  }

  /// `Let's continue.`
  String get informLetsContinue {
    return Intl.message(
      'Let\'s continue.',
      name: 'informLetsContinue',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get actionContinue {
    return Intl.message(
      'Continue',
      name: 'actionContinue',
      desc: '',
      args: [],
    );
  }

  /// `Search country`
  String get labelSearchCountry {
    return Intl.message(
      'Search country',
      name: 'labelSearchCountry',
      desc: '',
      args: [],
    );
  }

  /// `We've sent a message to {email} with a link to activate your account.`
  String informVerificationEmailSent(String email) {
    return Intl.message(
      'We\'ve sent a message to $email with a link to activate your account.',
      name: 'informVerificationEmailSent',
      desc: 'A message with a single parameter',
      args: [email],
    );
  }

  /// `Didn't receive your email?`
  String get actionEmailNotReceived {
    return Intl.message(
      'Didn\'t receive your email?',
      name: 'actionEmailNotReceived',
      desc: '',
      args: [],
    );
  }

  /// `Your password must have:`
  String get informPasswordPolicy {
    return Intl.message(
      'Your password must have:',
      name: 'informPasswordPolicy',
      desc: '',
      args: [],
    );
  }

  /// `8-25 characters`
  String get informPasswordPolicyLength {
    return Intl.message(
      '8-25 characters',
      name: 'informPasswordPolicyLength',
      desc: '',
      args: [],
    );
  }

  /// `Upper and lower case letters`
  String get informPasswordPolicyLowerAndUpper {
    return Intl.message(
      'Upper and lower case letters',
      name: 'informPasswordPolicyLowerAndUpper',
      desc: '',
      args: [],
    );
  }

  /// `At least one number`
  String get informPasswordPolicyNumber {
    return Intl.message(
      'At least one number',
      name: 'informPasswordPolicyNumber',
      desc: '',
      args: [],
    );
  }

  /// `Use symbols for strong password.`
  String get warnPasswordContainsSymbol {
    return Intl.message(
      'Use symbols for strong password.',
      name: 'warnPasswordContainsSymbol',
      desc: '',
      args: [],
    );
  }

  /// `Referral Code`
  String get labelReferralCode {
    return Intl.message(
      'Referral Code',
      name: 'labelReferralCode',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate
    extends LocalizationsDelegate<DerivAuthUILocalization> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<DerivAuthUILocalization> load(Locale locale) =>
      DerivAuthUILocalization.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
