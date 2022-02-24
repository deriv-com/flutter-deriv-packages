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

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `I accept`
  String get actionAccept {
    return Intl.message(
      'I accept',
      name: 'actionAccept',
      desc: '',
      args: [],
    );
  }

  /// `Add account`
  String get actionAddAccount {
    return Intl.message(
      'Add account',
      name: 'actionAddAccount',
      desc: '',
      args: [],
    );
  }

  /// `I have read and agree to the `
  String get actionAgreeToTnCPart1 {
    return Intl.message(
      'I have read and agree to the ',
      name: 'actionAgreeToTnCPart1',
      desc: '',
      args: [],
    );
  }

  /// ` of the Deriv website.`
  String get actionAgreeToTnCPart2 {
    return Intl.message(
      ' of the Deriv website.',
      name: 'actionAgreeToTnCPart2',
      desc: '',
      args: [],
    );
  }

  /// `Call Spread`
  String get actionCallSpread {
    return Intl.message(
      'Call Spread',
      name: 'actionCallSpread',
      desc: '',
      args: [],
    );
  }

  /// `CANCEL`
  String get actionCancel {
    return Intl.message(
      'CANCEL',
      name: 'actionCancel',
      desc: '',
      args: [],
    );
  }

  /// `Clear`
  String get actionClear {
    return Intl.message(
      'Clear',
      name: 'actionClear',
      desc: '',
      args: [],
    );
  }

  /// `Complete form`
  String get actionCompleteForm {
    return Intl.message(
      'Complete form',
      name: 'actionCompleteForm',
      desc: '',
      args: [],
    );
  }

  /// `Contact us`
  String get actionContactUs {
    return Intl.message(
      'Contact us',
      name: 'actionContactUs',
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

  /// `Create free demo account`
  String get actionCreateAccount {
    return Intl.message(
      'Create free demo account',
      name: 'actionCreateAccount',
      desc: '',
      args: [],
    );
  }

  /// `Delete All`
  String get actionDelete {
    return Intl.message(
      'Delete All',
      name: 'actionDelete',
      desc: '',
      args: [],
    );
  }

  /// `Deposit now`
  String get actionDepositNow {
    return Intl.message(
      'Deposit now',
      name: 'actionDepositNow',
      desc: '',
      args: [],
    );
  }

  /// `Dismiss`
  String get actionDismiss {
    return Intl.message(
      'Dismiss',
      name: 'actionDismiss',
      desc: '',
      args: [],
    );
  }

  /// `Don't ask me again.`
  String get actionDontAskAgain {
    return Intl.message(
      'Don\'t ask me again.',
      name: 'actionDontAskAgain',
      desc: '',
      args: [],
    );
  }

  /// `Down`
  String get actionDown {
    return Intl.message(
      'Down',
      name: 'actionDown',
      desc: '',
      args: [],
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

  /// `Fall`
  String get actionFall {
    return Intl.message(
      'Fall',
      name: 'actionFall',
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

  /// `GIVE FEEDBACK`
  String get actionGiveFeedback {
    return Intl.message(
      'GIVE FEEDBACK',
      name: 'actionGiveFeedback',
      desc: '',
      args: [],
    );
  }

  /// `Go Back to trading`
  String get actionGoBackToTrading {
    return Intl.message(
      'Go Back to trading',
      name: 'actionGoBackToTrading',
      desc: '',
      args: [],
    );
  }

  /// `Go Back`
  String get actionGoBack {
    return Intl.message(
      'Go Back',
      name: 'actionGoBack',
      desc: '',
      args: [],
    );
  }

  /// `GOT IT`
  String get actionGotIt {
    return Intl.message(
      'GOT IT',
      name: 'actionGotIt',
      desc: '',
      args: [],
    );
  }

  /// `LATER`
  String get actionLater {
    return Intl.message(
      'LATER',
      name: 'actionLater',
      desc: '',
      args: [],
    );
  }

  /// `LEAVE`
  String get actionLeave {
    return Intl.message(
      'LEAVE',
      name: 'actionLeave',
      desc: '',
      args: [],
    );
  }

  /// `Log in to Deriv.com`
  String get actionLoginToDeriv {
    return Intl.message(
      'Log in to Deriv.com',
      name: 'actionLoginToDeriv',
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

  /// `Maybe later`
  String get actionMaybeLater {
    return Intl.message(
      'Maybe later',
      name: 'actionMaybeLater',
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

  /// `I am not a PEP, and I have not been a PEP in the last 12 months.`
  String get actionNotPEP {
    return Intl.message(
      'I am not a PEP, and I have not been a PEP in the last 12 months.',
      name: 'actionNotPEP',
      desc: '',
      args: [],
    );
  }

  /// `NO`
  String get actionNo {
    return Intl.message(
      'NO',
      name: 'actionNo',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get actionOK {
    return Intl.message(
      'OK',
      name: 'actionOK',
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

  /// `Put Spread`
  String get actionPutSpread {
    return Intl.message(
      'Put Spread',
      name: 'actionPutSpread',
      desc: '',
      args: [],
    );
  }

  /// `Read less`
  String get actionReadLess {
    return Intl.message(
      'Read less',
      name: 'actionReadLess',
      desc: '',
      args: [],
    );
  }

  /// `Read more`
  String get actionReadMore {
    return Intl.message(
      'Read more',
      name: 'actionReadMore',
      desc: '',
      args: [],
    );
  }

  /// `Read terms and conditions`
  String get actionReadTnC {
    return Intl.message(
      'Read terms and conditions',
      name: 'actionReadTnC',
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

  /// `Remind later`
  String get actionRemindLater {
    return Intl.message(
      'Remind later',
      name: 'actionRemindLater',
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

  /// `Retry`
  String get actionRetry {
    return Intl.message(
      'Retry',
      name: 'actionRetry',
      desc: '',
      args: [],
    );
  }

  /// `Rise`
  String get actionRise {
    return Intl.message(
      'Rise',
      name: 'actionRise',
      desc: '',
      args: [],
    );
  }

  /// `SAVE`
  String get actionSave {
    return Intl.message(
      'SAVE',
      name: 'actionSave',
      desc: '',
      args: [],
    );
  }

  /// `See open markets`
  String get actionSeeOpenMarkets {
    return Intl.message(
      'See open markets',
      name: 'actionSeeOpenMarkets',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get actionSignUp {
    return Intl.message(
      'Sign up',
      name: 'actionSignUp',
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

  /// `STAY ON THIS PAGE`
  String get actionStay {
    return Intl.message(
      'STAY ON THIS PAGE',
      name: 'actionStay',
      desc: '',
      args: [],
    );
  }

  /// `Try again`
  String get actionTryAgain {
    return Intl.message(
      'Try again',
      name: 'actionTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Try synthetic indices`
  String get actionTrySyntheticIndices {
    return Intl.message(
      'Try synthetic indices',
      name: 'actionTrySyntheticIndices',
      desc: '',
      args: [],
    );
  }

  /// `Update now`
  String get actionUpdateNow {
    return Intl.message(
      'Update now',
      name: 'actionUpdateNow',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get actionUpdate {
    return Intl.message(
      'Update',
      name: 'actionUpdate',
      desc: '',
      args: [],
    );
  }

  /// `Upgrade`
  String get actionUpgrade {
    return Intl.message(
      'Upgrade',
      name: 'actionUpgrade',
      desc: '',
      args: [],
    );
  }

  /// `Up`
  String get actionUp {
    return Intl.message(
      'Up',
      name: 'actionUp',
      desc: '',
      args: [],
    );
  }

  /// `Verify address`
  String get actionVerifyAddress {
    return Intl.message(
      'Verify address',
      name: 'actionVerifyAddress',
      desc: '',
      args: [],
    );
  }

  /// `Verify identity`
  String get actionVerifyIdentity {
    return Intl.message(
      'Verify identity',
      name: 'actionVerifyIdentity',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get actionVerify {
    return Intl.message(
      'Verify',
      name: 'actionVerify',
      desc: '',
      args: [],
    );
  }

  /// `YES`
  String get actionYes {
    return Intl.message(
      'YES',
      name: 'actionYes',
      desc: '',
      args: [],
    );
  }

  /// `What do you think about our app?`
  String get askAboutApp {
    return Intl.message(
      'What do you think about our app?',
      name: 'askAboutApp',
      desc: '',
      args: [],
    );
  }

  /// `Delete all?`
  String get askDeleteAll {
    return Intl.message(
      'Delete all?',
      name: 'askDeleteAll',
      desc: '',
      args: [],
    );
  }

  /// `Would you like to update your app now?`
  String get askWouldLikeToUpdate {
    return Intl.message(
      'Would you like to update your app now?',
      name: 'askWouldLikeToUpdate',
      desc: '',
      args: [],
    );
  }

  /// `You have yet to receive any notifications`
  String get infoEmptyNotifications {
    return Intl.message(
      'You have yet to receive any notifications',
      name: 'infoEmptyNotifications',
      desc: '',
      args: [],
    );
  }

  /// `If you need help, please `
  String get informAccountDeactivationDescription1 {
    return Intl.message(
      'If you need help, please ',
      name: 'informAccountDeactivationDescription1',
      desc: '',
      args: [],
    );
  }

  /// `contact us`
  String get informAccountDeactivationDescription2 {
    return Intl.message(
      'contact us',
      name: 'informAccountDeactivationDescription2',
      desc: '',
      args: [],
    );
  }

  /// ` via live chat.`
  String get informAccountDeactivationDescription3 {
    return Intl.message(
      ' via live chat.',
      name: 'informAccountDeactivationDescription3',
      desc: '',
      args: [],
    );
  }

  /// `Your account has been deactivated`
  String get informAccountDeactivation {
    return Intl.message(
      'Your account has been deactivated',
      name: 'informAccountDeactivation',
      desc: '',
      args: [],
    );
  }

  /// `Win payout if if exit spot is also equal to entry spot`
  String get informAllowEquals {
    return Intl.message(
      'Win payout if if exit spot is also equal to entry spot',
      name: 'informAllowEquals',
      desc: '',
      args: [],
    );
  }

  /// `Please check your email and click on the link provided to reset your password.`
  String get informCheckEmailDescription {
    return Intl.message(
      'Please check your email and click on the link provided to reset your password.',
      name: 'informCheckEmailDescription',
      desc: '',
      args: [],
    );
  }

  /// `Check your email`
  String get informCheckEmailTitle {
    return Intl.message(
      'Check your email',
      name: 'informCheckEmailTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please come back in`
  String get informComebackInHint {
    return Intl.message(
      'Please come back in',
      name: 'informComebackInHint',
      desc: '',
      args: [],
    );
  }

  /// `{commissionPercentageValue}% of ({stake} {currencySymbol} * {multiplierValue})`
  String informCommissionHint(Object commissionPercentageValue, Object stake,
      Object currencySymbol, Object multiplierValue) {
    return Intl.message(
      '$commissionPercentageValue% of ($stake $currencySymbol * $multiplierValue)',
      name: 'informCommissionHint',
      desc: '',
      args: [commissionPercentageValue, stake, currencySymbol, multiplierValue],
    );
  }

  /// `Your account is deactivated. Please contact us via live chat.`
  String get informDeactivatedAccount {
    return Intl.message(
      'Your account is deactivated. Please contact us via live chat.',
      name: 'informDeactivatedAccount',
      desc: '',
      args: [],
    );
  }

  /// `Allows you to cancel your trade within a chosen time frame should the market move against your favour.`
  String get informDealCancellationHint {
    return Intl.message(
      'Allows you to cancel your trade within a chosen time frame should the market move against your favour.',
      name: 'informDealCancellationHint',
      desc: '',
      args: [],
    );
  }

  /// `Once you delete all news, you can't undo it.`
  String get informDeleteCantUndo {
    return Intl.message(
      'Once you delete all news, you can\'t undo it.',
      name: 'informDeleteCantUndo',
      desc: '',
      args: [],
    );
  }

  /// `Deposit now to start trading`
  String get informDepositNow {
    return Intl.message(
      'Deposit now to start trading',
      name: 'informDepositNow',
      desc: '',
      args: [],
    );
  }

  /// `Enter the two-factor authentication (2FA) code from the authenticator app on your phone.`
  String get informEnterTwoFactorAuthCode {
    return Intl.message(
      'Enter the two-factor authentication (2FA) code from the authenticator app on your phone.',
      name: 'informEnterTwoFactorAuthCode',
      desc: '',
      args: [],
    );
  }

  /// `Your contract will be closed automatically at the next available asset price when the duration exceeds {duration}.`
  String informExpiryDuration(Object duration) {
    return Intl.message(
      'Your contract will be closed automatically at the next available asset price when the duration exceeds $duration.',
      name: 'informExpiryDuration',
      desc: '',
      args: [duration],
    );
  }

  /// `Enjoy using this app? Got ideas for improvement?\n\nTell us how to make this app better for you.`
  String get informFeedbackRecommendation {
    return Intl.message(
      'Enjoy using this app? Got ideas for improvement?\n\nTell us how to make this app better for you.',
      name: 'informFeedbackRecommendation',
      desc: '',
      args: [],
    );
  }

  /// `Help us improve our app with a quick survey.`
  String get informFeedback {
    return Intl.message(
      'Help us improve our app with a quick survey.',
      name: 'informFeedback',
      desc: '',
      args: [],
    );
  }

  /// `Deal cancellation is not supported for \nthis market.`
  String get informInactiveDealCancellationHint {
    return Intl.message(
      'Deal cancellation is not supported for \nthis market.',
      name: 'informInactiveDealCancellationHint',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email format`
  String get informInvalidEmailFormat {
    return Intl.message(
      'Please enter a valid email format',
      name: 'informInvalidEmailFormat',
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

  /// `You've been logged out`
  String get informLoggedOutHint {
    return Intl.message(
      'You\'ve been logged out',
      name: 'informLoggedOutHint',
      desc: '',
      args: [],
    );
  }

  /// `If you're a `
  String get informLoginBinaryUsers1 {
    return Intl.message(
      'If you\'re a ',
      name: 'informLoginBinaryUsers1',
      desc: '',
      args: [],
    );
  }

  /// ` user, log in with your `
  String get informLoginBinaryUsers2 {
    return Intl.message(
      ' user, log in with your ',
      name: 'informLoginBinaryUsers2',
      desc: '',
      args: [],
    );
  }

  /// ` username and password.`
  String get informLoginBinaryUsers3 {
    return Intl.message(
      ' username and password.',
      name: 'informLoginBinaryUsers3',
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

  /// `This market is closed. It will reopen at {time} (GMT) on {date}.`
  String informMarketClosedAndReopeningHint(Object time, Object date) {
    return Intl.message(
      'This market is closed. It will reopen at $time (GMT) on $date.',
      name: 'informMarketClosedAndReopeningHint',
      desc: '',
      args: [time, date],
    );
  }

  /// `This market is closed`
  String get informMarketClosedHint {
    return Intl.message(
      'This market is closed',
      name: 'informMarketClosedHint',
      desc: '',
      args: [],
    );
  }

  /// `{time} (GMT) on {date}`
  String informMarketReopenTimeHint(Object time, Object date) {
    return Intl.message(
      '$time (GMT) on $date',
      name: 'informMarketReopenTimeHint',
      desc: '',
      args: [time, date],
    );
  }

  /// `Your gross profit is the percentage \nchange in market price times your \ntrade amount and the multiplier \nchosen here.`
  String get informMultiplierHint {
    return Intl.message(
      'Your gross profit is the percentage \nchange in market price times your \ntrade amount and the multiplier \nchosen here.',
      name: 'informMultiplierHint',
      desc: '',
      args: [],
    );
  }

  /// `Thank you for downloading Deriv GO.\n\nWe want to make Deriv GO better for you. If you have any suggestions to improve this app, hit the Feedback button to let us know.`
  String get informNewUserFeedbackRecommendationPart {
    return Intl.message(
      'Thank you for downloading Deriv GO.\n\nWe want to make Deriv GO better for you. If you have any suggestions to improve this app, hit the Feedback button to let us know.',
      name: 'informNewUserFeedbackRecommendationPart',
      desc: '',
      args: [],
    );
  }

  /// `A new version of Deriv GO is available.`
  String get informNewVersion {
    return Intl.message(
      'A new version of Deriv GO is available.',
      name: 'informNewVersion',
      desc: '',
      args: [],
    );
  }

  /// `You have yet to update either take profit or stop loss`
  String get informNoHistory {
    return Intl.message(
      'You have yet to update either take profit or stop loss',
      name: 'informNoHistory',
      desc: '',
      args: [],
    );
  }

  /// `Please update your app to continue using Deriv GO.`
  String get informPleaseUpdateUsing {
    return Intl.message(
      'Please update your app to continue using Deriv GO.',
      name: 'informPleaseUpdateUsing',
      desc: '',
      args: [],
    );
  }

  /// `Please update your app`
  String get informPleaseUpdate {
    return Intl.message(
      'Please update your app',
      name: 'informPleaseUpdate',
      desc: '',
      args: [],
    );
  }

  /// `We will now redirect you to the login page.`
  String get informRedirectLogin {
    return Intl.message(
      'We will now redirect you to the login page.',
      name: 'informRedirectLogin',
      desc: '',
      args: [],
    );
  }

  /// `It will reopen at`
  String get informReopenAtHint {
    return Intl.message(
      'It will reopen at',
      name: 'informReopenAtHint',
      desc: '',
      args: [],
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

  /// `Please log in to our website to reactivate your account. `
  String get informSelfClosedDescription1 {
    return Intl.message(
      'Please log in to our website to reactivate your account. ',
      name: 'informSelfClosedDescription1',
      desc: '',
      args: [],
    );
  }

  /// `Contact us via live chat`
  String get informSelfClosedDescription2 {
    return Intl.message(
      'Contact us via live chat',
      name: 'informSelfClosedDescription2',
      desc: '',
      args: [],
    );
  }

  /// ` if you need help.`
  String get informSelfClosedDescription3 {
    return Intl.message(
      ' if you need help.',
      name: 'informSelfClosedDescription3',
      desc: '',
      args: [],
    );
  }

  /// `Reactivating your account?`
  String get informSelfClosedTitle {
    return Intl.message(
      'Reactivating your account?',
      name: 'informSelfClosedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your session has expired. Please log in to continue.`
  String get informSessionExpiredHint {
    return Intl.message(
      'Your session has expired. Please log in to continue.',
      name: 'informSessionExpiredHint',
      desc: '',
      args: [],
    );
  }

  /// `When your current loss equals or \nexceeds {stopOutPercentageValue}% of your trade amount, your \ncontract will be closed at the nearest \navailable asset price.`
  String informStopOutHint(Object stopOutPercentageValue) {
    return Intl.message(
      'When your current loss equals or \nexceeds $stopOutPercentageValue% of your trade amount, your \ncontract will be closed at the nearest \navailable asset price.',
      name: 'informStopOutHint',
      desc: '',
      args: [stopOutPercentageValue],
    );
  }

  /// `Strong passwords contain at least 8 characters, combine uppercase and lowercase letters, numbers, and symbols.`
  String get informStrongPassword {
    return Intl.message(
      'Strong passwords contain at least 8 characters, combine uppercase and lowercase letters, numbers, and symbols.',
      name: 'informStrongPassword',
      desc: '',
      args: [],
    );
  }

  /// `Strong passwords contain at least 8 characters, combine uppercase and lowercase letters, numbers, and symbols.`
  String get informStrongPass {
    return Intl.message(
      'Strong passwords contain at least 8 characters, combine uppercase and lowercase letters, numbers, and symbols.',
      name: 'informStrongPass',
      desc: '',
      args: [],
    );
  }

  /// `Take profit: Set a threshold for your profit. Your position will be closed automatically when your profit reaches (or exceeds) this amount.\n\nStop loss: Set a threshold for your loss. Your position will be closed automatically when your loss reaches (or exceeds) this amount.`
  String get informTakeProfitAndStopLossHint {
    return Intl.message(
      'Take profit: Set a threshold for your profit. Your position will be closed automatically when your profit reaches (or exceeds) this amount.\n\nStop loss: Set a threshold for your loss. Your position will be closed automatically when your loss reaches (or exceeds) this amount.',
      name: 'informTakeProfitAndStopLossHint',
      desc: '',
      args: [],
    );
  }

  /// `Ticks {currentTickIndex}/{totalTickCount}`
  String informTickCount(Object currentTickIndex, Object totalTickCount) {
    return Intl.message(
      'Ticks $currentTickIndex/$totalTickCount',
      name: 'informTickCount',
      desc: '',
      args: [currentTickIndex, totalTickCount],
    );
  }

  /// `Your gross profit is the percentage\nchange in market price times your\ntrade amount and the multiplier\nchosen here.`
  String get informTradeAmountHint {
    return Intl.message(
      'Your gross profit is the percentage\nchange in market price times your\ntrade amount and the multiplier\nchosen here.',
      name: 'informTradeAmountHint',
      desc: '',
      args: [],
    );
  }

  /// `Your gross profit is the percentage change in market price times your trade amount and the multiplier chosen`
  String get informTradeAmountPercentage {
    return Intl.message(
      'Your gross profit is the percentage change in market price times your trade amount and the multiplier chosen',
      name: 'informTradeAmountPercentage',
      desc: '',
      args: [],
    );
  }

  /// `In the meantime, try our synthetic indices. They simulate real-market volatility and are open 24/7. `
  String get informTrySyntheticIndicesHint {
    return Intl.message(
      'In the meantime, try our synthetic indices. They simulate real-market volatility and are open 24/7. ',
      name: 'informTrySyntheticIndicesHint',
      desc: '',
      args: [],
    );
  }

  /// `We've sent a message to {email} with a link to activate your account.`
  String informVerificationEmailSent(Object email) {
    return Intl.message(
      'We\'ve sent a message to $email with a link to activate your account.',
      name: 'informVerificationEmailSent',
      desc: '',
      args: [email],
    );
  }

  /// `Please verify your address`
  String get informVerifyAddress {
    return Intl.message(
      'Please verify your address',
      name: 'informVerifyAddress',
      desc: '',
      args: [],
    );
  }

  /// `Please verify your identity`
  String get informVerifyIdentity {
    return Intl.message(
      'Please verify your identity',
      name: 'informVerifyIdentity',
      desc: '',
      args: [],
    );
  }

  /// `Welcome!`
  String get informWelcomeAppBeta {
    return Intl.message(
      'Welcome!',
      name: 'informWelcomeAppBeta',
      desc: '',
      args: [],
    );
  }

  /// `Your password has been changed`
  String get informYourPassChanged {
    return Intl.message(
      'Your password has been changed',
      name: 'informYourPassChanged',
      desc: '',
      args: [],
    );
  }

  /// `1 D`
  String get label1DayAbbreviate {
    return Intl.message(
      '1 D',
      name: 'label1DayAbbreviate',
      desc: '',
      args: [],
    );
  }

  /// `1 day`
  String get label1Day {
    return Intl.message(
      '1 day',
      name: 'label1Day',
      desc: '',
      args: [],
    );
  }

  /// `1 H`
  String get label1HourAbbreviate {
    return Intl.message(
      '1 H',
      name: 'label1HourAbbreviate',
      desc: '',
      args: [],
    );
  }

  /// `1 hour`
  String get label1Hour {
    return Intl.message(
      '1 hour',
      name: 'label1Hour',
      desc: '',
      args: [],
    );
  }

  /// `1 M`
  String get label1MinAbbreviate {
    return Intl.message(
      '1 M',
      name: 'label1MinAbbreviate',
      desc: '',
      args: [],
    );
  }

  /// `1 min`
  String get label1Min {
    return Intl.message(
      '1 min',
      name: 'label1Min',
      desc: '',
      args: [],
    );
  }

  /// `1 T`
  String get label1TickAbbreviate {
    return Intl.message(
      '1 T',
      name: 'label1TickAbbreviate',
      desc: '',
      args: [],
    );
  }

  /// `1 tick`
  String get label1Tick {
    return Intl.message(
      '1 tick',
      name: 'label1Tick',
      desc: '',
      args: [],
    );
  }

  /// `2FA code`
  String get label2FACode {
    return Intl.message(
      '2FA code',
      name: 'label2FACode',
      desc: '',
      args: [],
    );
  }

  /// `Two-factor authentication`
  String get label2FA {
    return Intl.message(
      'Two-factor authentication',
      name: 'label2FA',
      desc: '',
      args: [],
    );
  }

  /// `2 H`
  String get label2HoursAbbreviate {
    return Intl.message(
      '2 H',
      name: 'label2HoursAbbreviate',
      desc: '',
      args: [],
    );
  }

  /// `2 hours`
  String get label2Hours {
    return Intl.message(
      '2 hours',
      name: 'label2Hours',
      desc: '',
      args: [],
    );
  }

  /// `2 M`
  String get label2MinsAbbreviate {
    return Intl.message(
      '2 M',
      name: 'label2MinsAbbreviate',
      desc: '',
      args: [],
    );
  }

  /// `2 mins`
  String get label2Mins {
    return Intl.message(
      '2 mins',
      name: 'label2Mins',
      desc: '',
      args: [],
    );
  }

  /// `3 M`
  String get label3MinsAbbreviate {
    return Intl.message(
      '3 M',
      name: 'label3MinsAbbreviate',
      desc: '',
      args: [],
    );
  }

  /// `3 mins`
  String get label3Mins {
    return Intl.message(
      '3 mins',
      name: 'label3Mins',
      desc: '',
      args: [],
    );
  }

  /// `4 H`
  String get label4HoursAbbreviate {
    return Intl.message(
      '4 H',
      name: 'label4HoursAbbreviate',
      desc: '',
      args: [],
    );
  }

  /// `4 hours`
  String get label4Hours {
    return Intl.message(
      '4 hours',
      name: 'label4Hours',
      desc: '',
      args: [],
    );
  }

  /// `5 H`
  String get label5HoursAbbreviate {
    return Intl.message(
      '5 H',
      name: 'label5HoursAbbreviate',
      desc: '',
      args: [],
    );
  }

  /// `5 hours`
  String get label5Hours {
    return Intl.message(
      '5 hours',
      name: 'label5Hours',
      desc: '',
      args: [],
    );
  }

  /// `5 M`
  String get label5MinsAbbreviate {
    return Intl.message(
      '5 M',
      name: 'label5MinsAbbreviate',
      desc: '',
      args: [],
    );
  }

  /// `5 mins`
  String get label5Mins {
    return Intl.message(
      '5 mins',
      name: 'label5Mins',
      desc: '',
      args: [],
    );
  }

  /// `8 H`
  String get label8HoursAbbreviate {
    return Intl.message(
      '8 H',
      name: 'label8HoursAbbreviate',
      desc: '',
      args: [],
    );
  }

  /// `8 hours`
  String get label8Hours {
    return Intl.message(
      '8 hours',
      name: 'label8Hours',
      desc: '',
      args: [],
    );
  }

  /// `10 M`
  String get label10MinsAbbreviate {
    return Intl.message(
      '10 M',
      name: 'label10MinsAbbreviate',
      desc: '',
      args: [],
    );
  }

  /// `10 mins`
  String get label10Mins {
    return Intl.message(
      '10 mins',
      name: 'label10Mins',
      desc: '',
      args: [],
    );
  }

  /// `15 M`
  String get label15MinsAbbreviate {
    return Intl.message(
      '15 M',
      name: 'label15MinsAbbreviate',
      desc: '',
      args: [],
    );
  }

  /// `15 mins`
  String get label15Mins {
    return Intl.message(
      '15 mins',
      name: 'label15Mins',
      desc: '',
      args: [],
    );
  }

  /// `30 M`
  String get label30MinsAbbreviate {
    return Intl.message(
      '30 M',
      name: 'label30MinsAbbreviate',
      desc: '',
      args: [],
    );
  }

  /// `30 mins`
  String get label30Mins {
    return Intl.message(
      '30 mins',
      name: 'label30Mins',
      desc: '',
      args: [],
    );
  }

  /// `Accepted`
  String get labelAccepted {
    return Intl.message(
      'Accepted',
      name: 'labelAccepted',
      desc: '',
      args: [],
    );
  }

  /// `You have added a {selectedCurrency} account.\nMake a deposit now to start trading.`
  String labelAccountCreateDeposit(Object selectedCurrency) {
    return Intl.message(
      'You have added a $selectedCurrency account.\nMake a deposit now to start trading.',
      name: 'labelAccountCreateDeposit',
      desc: '',
      args: [selectedCurrency],
    );
  }

  /// `Account currency`
  String get labelAccountCurrency {
    return Intl.message(
      'Account currency',
      name: 'labelAccountCurrency',
      desc: '',
      args: [],
    );
  }

  /// `Account limits`
  String get labelAccountLimits {
    return Intl.message(
      'Account limits',
      name: 'labelAccountLimits',
      desc: '',
      args: [],
    );
  }

  /// `Account settings`
  String get labelAccountSettings {
    return Intl.message(
      'Account settings',
      name: 'labelAccountSettings',
      desc: '',
      args: [],
    );
  }

  /// `Accounts`
  String get labelAccounts {
    return Intl.message(
      'Accounts',
      name: 'labelAccounts',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get labelAddress {
    return Intl.message(
      'Address',
      name: 'labelAddress',
      desc: '',
      args: [],
    );
  }

  /// `Allow equals`
  String get labelAllowEquals {
    return Intl.message(
      'Allow equals',
      name: 'labelAllowEquals',
      desc: '',
      args: [],
    );
  }

  /// `Amount`
  String get labelAmount {
    return Intl.message(
      'Amount',
      name: 'labelAmount',
      desc: '',
      args: [],
    );
  }

  /// `API token`
  String get labelApiToken {
    return Intl.message(
      'API token',
      name: 'labelApiToken',
      desc: '',
      args: [],
    );
  }

  /// `Application ID`
  String get labelApplicationID {
    return Intl.message(
      'Application ID',
      name: 'labelApplicationID',
      desc: '',
      args: [],
    );
  }

  /// `Area`
  String get labelArea {
    return Intl.message(
      'Area',
      name: 'labelArea',
      desc: '',
      args: [],
    );
  }

  /// `Assets`
  String get labelAssets {
    return Intl.message(
      'Assets',
      name: 'labelAssets',
      desc: '',
      args: [],
    );
  }

  /// `Asset`
  String get labelAsset {
    return Intl.message(
      'Asset',
      name: 'labelAsset',
      desc: '',
      args: [],
    );
  }

  /// `Barrier`
  String get labelBarrier {
    return Intl.message(
      'Barrier',
      name: 'labelBarrier',
      desc: '',
      args: [],
    );
  }

  /// `Binary.com`
  String get labelBinaryDotCom {
    return Intl.message(
      'Binary.com',
      name: 'labelBinaryDotCom',
      desc: '',
      args: [],
    );
  }

  /// `Buy ID`
  String get labelBuyId {
    return Intl.message(
      'Buy ID',
      name: 'labelBuyId',
      desc: '',
      args: [],
    );
  }

  /// `Buy price`
  String get labelBuyPrice {
    return Intl.message(
      'Buy price',
      name: 'labelBuyPrice',
      desc: '',
      args: [],
    );
  }

  /// `Buy time`
  String get labelBuyTime {
    return Intl.message(
      'Buy time',
      name: 'labelBuyTime',
      desc: '',
      args: [],
    );
  }

  /// `Calendar`
  String get labelCalendar {
    return Intl.message(
      'Calendar',
      name: 'labelCalendar',
      desc: '',
      args: [],
    );
  }

  /// `Call/put spreads`
  String get labelCallPutSpreads {
    return Intl.message(
      'Call/put spreads',
      name: 'labelCallPutSpreads',
      desc: '',
      args: [],
    );
  }

  /// `Call spread`
  String get labelCallSpread {
    return Intl.message(
      'Call spread',
      name: 'labelCallSpread',
      desc: '',
      args: [],
    );
  }

  /// `(active)`
  String get labelCancellationTypeActive {
    return Intl.message(
      '(active)',
      name: 'labelCancellationTypeActive',
      desc: '',
      args: [],
    );
  }

  /// `(executed)`
  String get labelCancellationTypeExecuted {
    return Intl.message(
      '(executed)',
      name: 'labelCancellationTypeExecuted',
      desc: '',
      args: [],
    );
  }

  /// `(expired)`
  String get labelCancellationTypeExpired {
    return Intl.message(
      '(expired)',
      name: 'labelCancellationTypeExpired',
      desc: '',
      args: [],
    );
  }

  /// `Cancelled`
  String get labelCancelled {
    return Intl.message(
      'Cancelled',
      name: 'labelCancelled',
      desc: '',
      args: [],
    );
  }

  /// `Cancel trade`
  String get labelCancelTrade {
    return Intl.message(
      'Cancel trade',
      name: 'labelCancelTrade',
      desc: '',
      args: [],
    );
  }

  /// `Candle`
  String get labelCandle {
    return Intl.message(
      'Candle',
      name: 'labelCandle',
      desc: '',
      args: [],
    );
  }

  /// `Cashier`
  String get labelCashier {
    return Intl.message(
      'Cashier',
      name: 'labelCashier',
      desc: '',
      args: [],
    );
  }

  /// `Change`
  String get labelChange {
    return Intl.message(
      'Change',
      name: 'labelChange',
      desc: '',
      args: [],
    );
  }

  /// `Chart settings`
  String get labelChartSettings {
    return Intl.message(
      'Chart settings',
      name: 'labelChartSettings',
      desc: '',
      args: [],
    );
  }

  /// `Chart types`
  String get labelChartTypes {
    return Intl.message(
      'Chart types',
      name: 'labelChartTypes',
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

  /// `Choose country`
  String get labelChooseCountry {
    return Intl.message(
      'Choose country',
      name: 'labelChooseCountry',
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

  /// `Choose State Or Province`
  String get labelChooseStateOrProvince {
    return Intl.message(
      'Choose State Or Province',
      name: 'labelChooseStateOrProvince',
      desc: '',
      args: [],
    );
  }

  /// `You have no trading activity yet.`
  String get labelClosedPositionsEmptyPage {
    return Intl.message(
      'You have no trading activity yet.',
      name: 'labelClosedPositionsEmptyPage',
      desc: '',
      args: [],
    );
  }

  /// `Closed. Open in`
  String get labelClosedSymbolWithOpenTime {
    return Intl.message(
      'Closed. Open in',
      name: 'labelClosedSymbolWithOpenTime',
      desc: '',
      args: [],
    );
  }

  /// `Closed ({count})`
  String labelClosedWithCount(Object count) {
    return Intl.message(
      'Closed ($count)',
      name: 'labelClosedWithCount',
      desc: '',
      args: [count],
    );
  }

  /// `Closed`
  String get labelClosed {
    return Intl.message(
      'Closed',
      name: 'labelClosed',
      desc: '',
      args: [],
    );
  }

  /// `Close trade now`
  String get labelCloseTradeNow {
    return Intl.message(
      'Close trade now',
      name: 'labelCloseTradeNow',
      desc: '',
      args: [],
    );
  }

  /// `Close trade`
  String get labelCloseTrade {
    return Intl.message(
      'Close trade',
      name: 'labelCloseTrade',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get labelClose {
    return Intl.message(
      'Close',
      name: 'labelClose',
      desc: '',
      args: [],
    );
  }

  /// `Commission: {commissionValue}`
  String labelCommission(Object commissionValue) {
    return Intl.message(
      'Commission: $commissionValue',
      name: 'labelCommission',
      desc: '',
      args: [commissionValue],
    );
  }

  /// `Confirm`
  String get labelConfirm {
    return Intl.message(
      'Confirm',
      name: 'labelConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Connected apps`
  String get labelConnectedApps {
    return Intl.message(
      'Connected apps',
      name: 'labelConnectedApps',
      desc: '',
      args: [],
    );
  }

  /// `Let's continue sign up process.`
  String get labelContinueSignup {
    return Intl.message(
      'Let\'s continue sign up process.',
      name: 'labelContinueSignup',
      desc: '',
      args: [],
    );
  }

  /// `Commission`
  String get labelContractDetailsCommission {
    return Intl.message(
      'Commission',
      name: 'labelContractDetailsCommission',
      desc: '',
      args: [],
    );
  }

  /// `Contract details`
  String get labelContractDetails {
    return Intl.message(
      'Contract details',
      name: 'labelContractDetails',
      desc: '',
      args: [],
    );
  }

  /// `Contract is closed. Loss is `
  String get labelContractIsClosedWithLoss {
    return Intl.message(
      'Contract is closed. Loss is ',
      name: 'labelContractIsClosedWithLoss',
      desc: '',
      args: [],
    );
  }

  /// `Contract is closed. Profit is `
  String get labelContractIsClosedWithProfit {
    return Intl.message(
      'Contract is closed. Profit is ',
      name: 'labelContractIsClosedWithProfit',
      desc: '',
      args: [],
    );
  }

  /// `Contract markers`
  String get labelContractMarkers {
    return Intl.message(
      'Contract markers',
      name: 'labelContractMarkers',
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

  /// `Create a password`
  String get labelCreatePass {
    return Intl.message(
      'Create a password',
      name: 'labelCreatePass',
      desc: '',
      args: [],
    );
  }

  /// `Cryptocurrencies`
  String get labelCryptocurrencies {
    return Intl.message(
      'Cryptocurrencies',
      name: 'labelCryptocurrencies',
      desc: '',
      args: [],
    );
  }

  /// `Daily range`
  String get labelDailyRange {
    return Intl.message(
      'Daily range',
      name: 'labelDailyRange',
      desc: '',
      args: [],
    );
  }

  /// `Date of birth*`
  String get labelDateOfBirthRequired {
    return Intl.message(
      'Date of birth*',
      name: 'labelDateOfBirthRequired',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get labelDate {
    return Intl.message(
      'Date',
      name: 'labelDate',
      desc: '',
      args: [],
    );
  }

  /// `{value} days`
  String labelDaysValue(Object value) {
    return Intl.message(
      '$value days',
      name: 'labelDaysValue',
      desc: '',
      args: [value],
    );
  }

  /// `days`
  String get labelDays {
    return Intl.message(
      'days',
      name: 'labelDays',
      desc: '',
      args: [],
    );
  }

  /// `day`
  String get labelDay {
    return Intl.message(
      'day',
      name: 'labelDay',
      desc: '',
      args: [],
    );
  }

  /// `DC`
  String get labelDC {
    return Intl.message(
      'DC',
      name: 'labelDC',
      desc: '',
      args: [],
    );
  }

  /// `Deactivate account`
  String get labelDeactivateAccount {
    return Intl.message(
      'Deactivate account',
      name: 'labelDeactivateAccount',
      desc: '',
      args: [],
    );
  }

  /// `{cancellationFee}`
  String labelDealCancelFee(Object cancellationFee) {
    return Intl.message(
      '$cancellationFee',
      name: 'labelDealCancelFee',
      desc: '',
      args: [cancellationFee],
    );
  }

  /// `Deal cancellation fee`
  String get labelDealCancellationFee {
    return Intl.message(
      'Deal cancellation fee',
      name: 'labelDealCancellationFee',
      desc: '',
      args: [],
    );
  }

  /// `Deal cancellation`
  String get labelDealCancellation {
    return Intl.message(
      'Deal cancellation',
      name: 'labelDealCancellation',
      desc: '',
      args: [],
    );
  }

  /// `Demo account`
  String get labelDemoAccount {
    return Intl.message(
      'Demo account',
      name: 'labelDemoAccount',
      desc: '',
      args: [],
    );
  }

  /// `Demo`
  String get labelDemo {
    return Intl.message(
      'Demo',
      name: 'labelDemo',
      desc: '',
      args: [],
    );
  }

  /// `Deposit`
  String get labelDeposit {
    return Intl.message(
      'Deposit',
      name: 'labelDeposit',
      desc: '',
      args: [],
    );
  }

  /// `Deriv`
  String get labelDeriv {
    return Intl.message(
      'Deriv',
      name: 'labelDeriv',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get labelDetails {
    return Intl.message(
      'Details',
      name: 'labelDetails',
      desc: '',
      args: [],
    );
  }

  /// `Developer`
  String get labelDeveloper {
    return Intl.message(
      'Developer',
      name: 'labelDeveloper',
      desc: '',
      args: [],
    );
  }

  /// `Down`
  String get labelDown {
    return Intl.message(
      'Down',
      name: 'labelDown',
      desc: '',
      args: [],
    );
  }

  /// `Deriv P2P`
  String get labelDp2p {
    return Intl.message(
      'Deriv P2P',
      name: 'labelDp2p',
      desc: '',
      args: [],
    );
  }

  /// `Duration`
  String get labelDuration {
    return Intl.message(
      'Duration',
      name: 'labelDuration',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get labelEdit {
    return Intl.message(
      'Edit',
      name: 'labelEdit',
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

  /// `The email address you entered had a mistake or typo (happens to the best of us).`
  String get labelEmailIssueTypo {
    return Intl.message(
      'The email address you entered had a mistake or typo (happens to the best of us).',
      name: 'labelEmailIssueTypo',
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

  /// `Email`
  String get labelEmail {
    return Intl.message(
      'Email',
      name: 'labelEmail',
      desc: '',
      args: [],
    );
  }

  /// `, swipe left at the asset you like and hit the star.`
  String get labelEmptyFavouritesSwipeLeft {
    return Intl.message(
      ', swipe left at the asset you like and hit the star.',
      name: 'labelEmptyFavouritesSwipeLeft',
      desc: '',
      args: [],
    );
  }

  /// `To add to `
  String get labelEmptyFavouritesToAdd {
    return Intl.message(
      'To add to ',
      name: 'labelEmptyFavouritesToAdd',
      desc: '',
      args: [],
    );
  }

  /// `End date`
  String get labelEndDate {
    return Intl.message(
      'End date',
      name: 'labelEndDate',
      desc: '',
      args: [],
    );
  }

  /// `Endpoint`
  String get labelEndpoint {
    return Intl.message(
      'Endpoint',
      name: 'labelEndpoint',
      desc: '',
      args: [],
    );
  }

  /// `Ends in`
  String get labelEndsIn {
    return Intl.message(
      'Ends in',
      name: 'labelEndsIn',
      desc: '',
      args: [],
    );
  }

  /// `End time`
  String get labelEndTime {
    return Intl.message(
      'End time',
      name: 'labelEndTime',
      desc: '',
      args: [],
    );
  }

  /// `Entry spot`
  String get labelEntrySpot {
    return Intl.message(
      'Entry spot',
      name: 'labelEntrySpot',
      desc: '',
      args: [],
    );
  }

  /// `Exit spot`
  String get labelExitSpot {
    return Intl.message(
      'Exit spot',
      name: 'labelExitSpot',
      desc: '',
      args: [],
    );
  }

  /// `Expiration`
  String get labelExpiration {
    return Intl.message(
      'Expiration',
      name: 'labelExpiration',
      desc: '',
      args: [],
    );
  }

  /// `Expires in`
  String get labelExpiresIn {
    return Intl.message(
      'Expires in',
      name: 'labelExpiresIn',
      desc: '',
      args: [],
    );
  }

  /// `Facebook`
  String get labelFacebook {
    return Intl.message(
      'Facebook',
      name: 'labelFacebook',
      desc: '',
      args: [],
    );
  }

  /// `Fall`
  String get labelFall {
    return Intl.message(
      'Fall',
      name: 'labelFall',
      desc: '',
      args: [],
    );
  }

  /// `Favourites`
  String get labelFavourites {
    return Intl.message(
      'Favourites',
      name: 'labelFavourites',
      desc: '',
      args: [],
    );
  }

  /// `Feedback`
  String get labelFeedback {
    return Intl.message(
      'Feedback',
      name: 'labelFeedback',
      desc: '',
      args: [],
    );
  }

  /// `Fiat currencies`
  String get labelFiatCurrencies {
    return Intl.message(
      'Fiat currencies',
      name: 'labelFiatCurrencies',
      desc: '',
      args: [],
    );
  }

  /// `Financial assessment`
  String get labelFinancialAssessment {
    return Intl.message(
      'Financial assessment',
      name: 'labelFinancialAssessment',
      desc: '',
      args: [],
    );
  }

  /// `First line of address*`
  String get labelFirstLineOfAddressRequired {
    return Intl.message(
      'First line of address*',
      name: 'labelFirstLineOfAddressRequired',
      desc: '',
      args: [],
    );
  }

  /// `First name*`
  String get labelFirstNameRequired {
    return Intl.message(
      'First name*',
      name: 'labelFirstNameRequired',
      desc: '',
      args: [],
    );
  }

  /// `{time} GMT`
  String labelGMTTime(Object time) {
    return Intl.message(
      '$time GMT',
      name: 'labelGMTTime',
      desc: '',
      args: [time],
    );
  }

  /// `Google`
  String get labelGoogle {
    return Intl.message(
      'Google',
      name: 'labelGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Help and support`
  String get labelHelpAndSupport {
    return Intl.message(
      'Help and support',
      name: 'labelHelpAndSupport',
      desc: '',
      args: [],
    );
  }

  /// `Help Center`
  String get labelHelpCenter {
    return Intl.message(
      'Help Center',
      name: 'labelHelpCenter',
      desc: '',
      args: [],
    );
  }

  /// `Help centre`
  String get labelHelpCentre {
    return Intl.message(
      'Help centre',
      name: 'labelHelpCentre',
      desc: '',
      args: [],
    );
  }

  /// `Higher`
  String get labelHigher {
    return Intl.message(
      'Higher',
      name: 'labelHigher',
      desc: '',
      args: [],
    );
  }

  /// `History`
  String get labelHistory {
    return Intl.message(
      'History',
      name: 'labelHistory',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get labelHome {
    return Intl.message(
      'Home',
      name: 'labelHome',
      desc: '',
      args: [],
    );
  }

  /// `{value} hours`
  String labelHoursValue(Object value) {
    return Intl.message(
      '$value hours',
      name: 'labelHoursValue',
      desc: '',
      args: [value],
    );
  }

  /// `hr`
  String get labelHour {
    return Intl.message(
      'hr',
      name: 'labelHour',
      desc: '',
      args: [],
    );
  }

  /// `Any information you provide is confidential and will be used for verification purposes only.`
  String get labelInformationIsConfidential {
    return Intl.message(
      'Any information you provide is confidential and will be used for verification purposes only.',
      name: 'labelInformationIsConfidential',
      desc: '',
      args: [],
    );
  }

  /// `Your account will be opened with Deriv (SVG) Ltd., and will be subject to the jurisdiction and laws of Saint Vincent and the Grenadines.`
  String get labelJurisdictionOfLawDescription {
    return Intl.message(
      'Your account will be opened with Deriv (SVG) Ltd., and will be subject to the jurisdiction and laws of Saint Vincent and the Grenadines.',
      name: 'labelJurisdictionOfLawDescription',
      desc: '',
      args: [],
    );
  }

  /// `Jurisdiction and choice of law`
  String get labelJurisdictionOfLawTitle {
    return Intl.message(
      'Jurisdiction and choice of law',
      name: 'labelJurisdictionOfLawTitle',
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

  /// `Language`
  String get labelLanguage {
    return Intl.message(
      'Language',
      name: 'labelLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Last name*`
  String get labelLastNameRequired {
    return Intl.message(
      'Last name*',
      name: 'labelLastNameRequired',
      desc: '',
      args: [],
    );
  }

  /// `Last step`
  String get labelLastStep {
    return Intl.message(
      'Last step',
      name: 'labelLastStep',
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

  /// `It's good to see you again. Log in to start trading.`
  String get labelLoginGreeting {
    return Intl.message(
      'It\'s good to see you again. Log in to start trading.',
      name: 'labelLoginGreeting',
      desc: '',
      args: [],
    );
  }

  /// `Login history`
  String get labelLoginHistory {
    return Intl.message(
      'Login history',
      name: 'labelLoginHistory',
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

  /// `Log in`
  String get labelLogIn {
    return Intl.message(
      'Log in',
      name: 'labelLogIn',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get labelLogout {
    return Intl.message(
      'Log out',
      name: 'labelLogout',
      desc: '',
      args: [],
    );
  }

  /// `Lower`
  String get labelLower {
    return Intl.message(
      'Lower',
      name: 'labelLower',
      desc: '',
      args: [],
    );
  }

  /// `Markets`
  String get labelMarkets {
    return Intl.message(
      'Markets',
      name: 'labelMarkets',
      desc: '',
      args: [],
    );
  }

  /// `{minuteValue} mins`
  String labelMins(Object minuteValue) {
    return Intl.message(
      '$minuteValue mins',
      name: 'labelMins',
      desc: '',
      args: [minuteValue],
    );
  }

  /// `{minuteValue} minutes`
  String labelMinutes(Object minuteValue) {
    return Intl.message(
      '$minuteValue minutes',
      name: 'labelMinutes',
      desc: '',
      args: [minuteValue],
    );
  }

  /// `min`
  String get labelMinute {
    return Intl.message(
      'min',
      name: 'labelMinute',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get labelMore {
    return Intl.message(
      'More',
      name: 'labelMore',
      desc: '',
      args: [],
    );
  }

  /// `Multiplier settings`
  String get labelMultiplierSetting {
    return Intl.message(
      'Multiplier settings',
      name: 'labelMultiplierSetting',
      desc: '',
      args: [],
    );
  }

  /// `Multipliers`
  String get labelMultipliers {
    return Intl.message(
      'Multipliers',
      name: 'labelMultipliers',
      desc: '',
      args: [],
    );
  }

  /// `Multiplier`
  String get labelMultiplier {
    return Intl.message(
      'Multiplier',
      name: 'labelMultiplier',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get labelName {
    return Intl.message(
      'Name',
      name: 'labelName',
      desc: '',
      args: [],
    );
  }

  /// `N/A`
  String get labelNA {
    return Intl.message(
      'N/A',
      name: 'labelNA',
      desc: '',
      args: [],
    );
  }

  /// `News`
  String get labelNews {
    return Intl.message(
      'News',
      name: 'labelNews',
      desc: '',
      args: [],
    );
  }

  /// `Next: {title}`
  String labelNext(Object title) {
    return Intl.message(
      'Next: $title',
      name: 'labelNext',
      desc: '',
      args: [title],
    );
  }

  /// `No history`
  String get labelNoHistory {
    return Intl.message(
      'No history',
      name: 'labelNoHistory',
      desc: '',
      args: [],
    );
  }

  /// `No notifications`
  String get labelNoNotifications {
    return Intl.message(
      'No notifications',
      name: 'labelNoNotifications',
      desc: '',
      args: [],
    );
  }

  /// `No SL`
  String get labelNoSL {
    return Intl.message(
      'No SL',
      name: 'labelNoSL',
      desc: '',
      args: [],
    );
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

  /// `Notification`
  String get labelNotification {
    return Intl.message(
      'Notification',
      name: 'labelNotification',
      desc: '',
      args: [],
    );
  }

  /// `No touch`
  String get labelNoTouch {
    return Intl.message(
      'No touch',
      name: 'labelNoTouch',
      desc: '',
      args: [],
    );
  }

  /// `No TP`
  String get labelNoTP {
    return Intl.message(
      'No TP',
      name: 'labelNoTP',
      desc: '',
      args: [],
    );
  }

  /// `Not set`
  String get labelNotSet {
    return Intl.message(
      'Not set',
      name: 'labelNotSet',
      desc: '',
      args: [],
    );
  }

  /// `You have no open positions yet.`
  String get labelOpenPositionsEmptyPage {
    return Intl.message(
      'You have no open positions yet.',
      name: 'labelOpenPositionsEmptyPage',
      desc: '',
      args: [],
    );
  }

  /// `Positions`
  String get labelOpenPositions {
    return Intl.message(
      'Positions',
      name: 'labelOpenPositions',
      desc: '',
      args: [],
    );
  }

  /// `Open ({count})`
  String labelOpenWithCount(Object count) {
    return Intl.message(
      'Open ($count)',
      name: 'labelOpenWithCount',
      desc: '',
      args: [count],
    );
  }

  /// `Open`
  String get labelOpen {
    return Intl.message(
      'Open',
      name: 'labelOpen',
      desc: '',
      args: [],
    );
  }

  /// `Options`
  String get labelOptions {
    return Intl.message(
      'Options',
      name: 'labelOptions',
      desc: '',
      args: [],
    );
  }

  /// `Order details`
  String get labelOrderDetails {
    return Intl.message(
      'Order details',
      name: 'labelOrderDetails',
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

  /// `Our products`
  String get labelOurProducts {
    return Intl.message(
      'Our products',
      name: 'labelOurProducts',
      desc: '',
      args: [],
    );
  }

  /// `Passwords`
  String get labelPasswords {
    return Intl.message(
      'Passwords',
      name: 'labelPasswords',
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

  /// `Payment agents`
  String get labelPaymentAgents {
    return Intl.message(
      'Payment agents',
      name: 'labelPaymentAgents',
      desc: '',
      args: [],
    );
  }

  /// `Payment agent`
  String get labelPaymentAgent {
    return Intl.message(
      'Payment agent',
      name: 'labelPaymentAgent',
      desc: '',
      args: [],
    );
  }

  /// `Payout`
  String get labelPayout {
    return Intl.message(
      'Payout',
      name: 'labelPayout',
      desc: '',
      args: [],
    );
  }

  /// `A politically exposed person (PEP) is someone appointed with a prominent public position. Close associates and family members of a PEP are also considered to be PEPs.`
  String get labelPEPDescription {
    return Intl.message(
      'A politically exposed person (PEP) is someone appointed with a prominent public position. Close associates and family members of a PEP are also considered to be PEPs.',
      name: 'labelPEPDescription',
      desc: '',
      args: [],
    );
  }

  /// `Real accounts are not available to politically exposed persons (PEPs).`
  String get labelPEPTitle {
    return Intl.message(
      'Real accounts are not available to politically exposed persons (PEPs).',
      name: 'labelPEPTitle',
      desc: '',
      args: [],
    );
  }

  /// `Personal details`
  String get labelPersonalDetails {
    return Intl.message(
      'Personal details',
      name: 'labelPersonalDetails',
      desc: '',
      args: [],
    );
  }

  /// `Phone number*`
  String get labelPhoneNumberRequired {
    return Intl.message(
      'Phone number*',
      name: 'labelPhoneNumberRequired',
      desc: '',
      args: [],
    );
  }

  /// `Positions`
  String get labelPositions {
    return Intl.message(
      'Positions',
      name: 'labelPositions',
      desc: '',
      args: [],
    );
  }

  /// `Postal/ZIP Code`
  String get labelPostalOrZipcode {
    return Intl.message(
      'Postal/ZIP Code',
      name: 'labelPostalOrZipcode',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get labelPrice {
    return Intl.message(
      'Price',
      name: 'labelPrice',
      desc: '',
      args: [],
    );
  }

  /// `Products`
  String get labelProducts {
    return Intl.message(
      'Products',
      name: 'labelProducts',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get labelProfile {
    return Intl.message(
      'Profile',
      name: 'labelProfile',
      desc: '',
      args: [],
    );
  }

  /// `Profit table`
  String get labelProfitTable {
    return Intl.message(
      'Profit table',
      name: 'labelProfitTable',
      desc: '',
      args: [],
    );
  }

  /// `Profit`
  String get labelProfit {
    return Intl.message(
      'Profit',
      name: 'labelProfit',
      desc: '',
      args: [],
    );
  }

  /// `Proof of address`
  String get labelProofOfAddress {
    return Intl.message(
      'Proof of address',
      name: 'labelProofOfAddress',
      desc: '',
      args: [],
    );
  }

  /// `Proof of identity`
  String get labelProofOfIdentity {
    return Intl.message(
      'Proof of identity',
      name: 'labelProofOfIdentity',
      desc: '',
      args: [],
    );
  }

  /// `Put spread`
  String get labelPutSpread {
    return Intl.message(
      'Put spread',
      name: 'labelPutSpread',
      desc: '',
      args: [],
    );
  }

  /// `Reports`
  String get labelReports {
    return Intl.message(
      'Reports',
      name: 'labelReports',
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

  /// `Rise`
  String get labelRise {
    return Intl.message(
      'Rise',
      name: 'labelRise',
      desc: '',
      args: [],
    );
  }

  /// `Risk management`
  String get labelRiskManagement {
    return Intl.message(
      'Risk management',
      name: 'labelRiskManagement',
      desc: '',
      args: [],
    );
  }

  /// `The financial trading services offered on this site are only suitable for customers who accept the possibility of losing all the money they invest and who understand and have experience of the risk involved in the purchase of financial contracts. Transactions in financial contracts carry a high degree of risk. If the contracts you purchased expire as worthless, you will lose all your investment, which includes the contract premium.`
  String get labelRiskWarningDescription {
    return Intl.message(
      'The financial trading services offered on this site are only suitable for customers who accept the possibility of losing all the money they invest and who understand and have experience of the risk involved in the purchase of financial contracts. Transactions in financial contracts carry a high degree of risk. If the contracts you purchased expire as worthless, you will lose all your investment, which includes the contract premium.',
      name: 'labelRiskWarningDescription',
      desc: '',
      args: [],
    );
  }

  /// `Risk warning`
  String get labelRiskWarningTitle {
    return Intl.message(
      'Risk warning',
      name: 'labelRiskWarningTitle',
      desc: '',
      args: [],
    );
  }

  /// `Second line of address`
  String get labelSecondLineOfAddress {
    return Intl.message(
      'Second line of address',
      name: 'labelSecondLineOfAddress',
      desc: '',
      args: [],
    );
  }

  /// `sec`
  String get labelSecond {
    return Intl.message(
      'sec',
      name: 'labelSecond',
      desc: '',
      args: [],
    );
  }

  /// `Security and safety`
  String get labelSecurityAndSafety {
    return Intl.message(
      'Security and safety',
      name: 'labelSecurityAndSafety',
      desc: '',
      args: [],
    );
  }

  /// `Security and safety`
  String get labelSecuritySafety {
    return Intl.message(
      'Security and safety',
      name: 'labelSecuritySafety',
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

  /// `Select date`
  String get labelSelectDate {
    return Intl.message(
      'Select date',
      name: 'labelSelectDate',
      desc: '',
      args: [],
    );
  }

  /// `Selected range`
  String get labelSelectedRange {
    return Intl.message(
      'Selected range',
      name: 'labelSelectedRange',
      desc: '',
      args: [],
    );
  }

  /// `Self Exclusion`
  String get labelSelfExclusion {
    return Intl.message(
      'Self Exclusion',
      name: 'labelSelfExclusion',
      desc: '',
      args: [],
    );
  }

  /// `Sell ID`
  String get labelSellId {
    return Intl.message(
      'Sell ID',
      name: 'labelSellId',
      desc: '',
      args: [],
    );
  }

  /// `Sell price`
  String get labelSellPrice {
    return Intl.message(
      'Sell price',
      name: 'labelSellPrice',
      desc: '',
      args: [],
    );
  }

  /// `Sell time`
  String get labelSellTime {
    return Intl.message(
      'Sell time',
      name: 'labelSellTime',
      desc: '',
      args: [],
    );
  }

  /// `Set order`
  String get labelSetOrder {
    return Intl.message(
      'Set order',
      name: 'labelSetOrder',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get labelSettings {
    return Intl.message(
      'Settings',
      name: 'labelSettings',
      desc: '',
      args: [],
    );
  }

  /// `Show a marker on the chart when a contract is purchased.`
  String get labelShowMarkersOnChart {
    return Intl.message(
      'Show a marker on the chart when a contract is purchased.',
      name: 'labelShowMarkersOnChart',
      desc: '',
      args: [],
    );
  }

  /// `SL`
  String get labelSl {
    return Intl.message(
      'SL',
      name: 'labelSl',
      desc: '',
      args: [],
    );
  }

  /// `Sort and filter`
  String get labelSortAndFilter {
    return Intl.message(
      'Sort and filter',
      name: 'labelSortAndFilter',
      desc: '',
      args: [],
    );
  }

  /// `Spreads`
  String get labelSpreads {
    return Intl.message(
      'Spreads',
      name: 'labelSpreads',
      desc: '',
      args: [],
    );
  }

  /// `Stake`
  String get labelStake {
    return Intl.message(
      'Stake',
      name: 'labelStake',
      desc: '',
      args: [],
    );
  }

  /// `Start date`
  String get labelStartDate {
    return Intl.message(
      'Start date',
      name: 'labelStartDate',
      desc: '',
      args: [],
    );
  }

  /// `Start time`
  String get labelStartTime {
    return Intl.message(
      'Start time',
      name: 'labelStartTime',
      desc: '',
      args: [],
    );
  }

  /// `Statement`
  String get labelStatement {
    return Intl.message(
      'Statement',
      name: 'labelStatement',
      desc: '',
      args: [],
    );
  }

  /// `State/Province`
  String get labelStateOrProvince {
    return Intl.message(
      'State/Province',
      name: 'labelStateOrProvince',
      desc: '',
      args: [],
    );
  }

  /// `Stop loss`
  String get labelStopLoss {
    return Intl.message(
      'Stop loss',
      name: 'labelStopLoss',
      desc: '',
      args: [],
    );
  }

  /// `Stop out`
  String get labelStopOut {
    return Intl.message(
      'Stop out',
      name: 'labelStopOut',
      desc: '',
      args: [],
    );
  }

  /// `Success!`
  String get labelSuccessExclamation {
    return Intl.message(
      'Success!',
      name: 'labelSuccessExclamation',
      desc: '',
      args: [],
    );
  }

  /// `Help and support`
  String get labelSupport {
    return Intl.message(
      'Help and support',
      name: 'labelSupport',
      desc: '',
      args: [],
    );
  }

  /// `System`
  String get labelSystem {
    return Intl.message(
      'System',
      name: 'labelSystem',
      desc: '',
      args: [],
    );
  }

  /// `Take profit and Stop loss`
  String get labelTakeProfitAndStopLoss {
    return Intl.message(
      'Take profit and Stop loss',
      name: 'labelTakeProfitAndStopLoss',
      desc: '',
      args: [],
    );
  }

  /// `Take profit`
  String get labelTakeProfit {
    return Intl.message(
      'Take profit',
      name: 'labelTakeProfit',
      desc: '',
      args: [],
    );
  }

  /// `Terms of use`
  String get labelTermsOfUse {
    return Intl.message(
      'Terms of use',
      name: 'labelTermsOfUse',
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

  /// `Time intervals`
  String get labelTimeIntervals {
    return Intl.message(
      'Time intervals',
      name: 'labelTimeIntervals',
      desc: '',
      args: [],
    );
  }

  /// `Terms and conditions`
  String get labelTnC {
    return Intl.message(
      'Terms and conditions',
      name: 'labelTnC',
      desc: '',
      args: [],
    );
  }

  /// `Total buy price`
  String get labelTotalBuyPrice {
    return Intl.message(
      'Total buy price',
      name: 'labelTotalBuyPrice',
      desc: '',
      args: [],
    );
  }

  /// `Total profit/loss`
  String get labelTotalProfitLoss {
    return Intl.message(
      'Total profit/loss',
      name: 'labelTotalProfitLoss',
      desc: '',
      args: [],
    );
  }

  /// `Touch`
  String get labelTouch {
    return Intl.message(
      'Touch',
      name: 'labelTouch',
      desc: '',
      args: [],
    );
  }

  /// `Town/City*`
  String get labelTownOrCityRequired {
    return Intl.message(
      'Town/City*',
      name: 'labelTownOrCityRequired',
      desc: '',
      args: [],
    );
  }

  /// `TP`
  String get labelTP {
    return Intl.message(
      'TP',
      name: 'labelTP',
      desc: '',
      args: [],
    );
  }

  /// `Trade amount`
  String get labelTradeAmount {
    return Intl.message(
      'Trade amount',
      name: 'labelTradeAmount',
      desc: '',
      args: [],
    );
  }

  /// `Trade details`
  String get labelTradeDetails {
    return Intl.message(
      'Trade details',
      name: 'labelTradeDetails',
      desc: '',
      args: [],
    );
  }

  /// `Trade now`
  String get labelTradeNow {
    return Intl.message(
      'Trade now',
      name: 'labelTradeNow',
      desc: '',
      args: [],
    );
  }

  /// `Trade types`
  String get labelTradeTypes {
    return Intl.message(
      'Trade types',
      name: 'labelTradeTypes',
      desc: '',
      args: [],
    );
  }

  /// `Trade`
  String get labelTrade {
    return Intl.message(
      'Trade',
      name: 'labelTrade',
      desc: '',
      args: [],
    );
  }

  /// `Transfer`
  String get labelTransfer {
    return Intl.message(
      'Transfer',
      name: 'labelTransfer',
      desc: '',
      args: [],
    );
  }

  /// `Trending markets`
  String get labelTrendingMarkets {
    return Intl.message(
      'Trending markets',
      name: 'labelTrendingMarkets',
      desc: '',
      args: [],
    );
  }

  /// `Try a trade`
  String get labelTryATrade {
    return Intl.message(
      'Try a trade',
      name: 'labelTryATrade',
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

  /// `Two-factor authentication`
  String get labelTwoFactorAuthentication {
    return Intl.message(
      'Two-factor authentication',
      name: 'labelTwoFactorAuthentication',
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

  /// `Type`
  String get labelType {
    return Intl.message(
      'Type',
      name: 'labelType',
      desc: '',
      args: [],
    );
  }

  /// `Update available`
  String get labelUpdateAvailable {
    return Intl.message(
      'Update available',
      name: 'labelUpdateAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Up`
  String get labelUp {
    return Intl.message(
      'Up',
      name: 'labelUp',
      desc: '',
      args: [],
    );
  }

  /// `Verification`
  String get labelVerification {
    return Intl.message(
      'Verification',
      name: 'labelVerification',
      desc: '',
      args: [],
    );
  }

  /// `Verify address`
  String get labelVerifyAddress {
    return Intl.message(
      'Verify address',
      name: 'labelVerifyAddress',
      desc: '',
      args: [],
    );
  }

  /// `Verify identity`
  String get labelVerifyIdentity {
    return Intl.message(
      'Verify identity',
      name: 'labelVerifyIdentity',
      desc: '',
      args: [],
    );
  }

  /// `Version {versionValue}`
  String labelVersion(Object versionValue) {
    return Intl.message(
      'Version $versionValue',
      name: 'labelVersion',
      desc: '',
      args: [versionValue],
    );
  }

  /// `Wallets`
  String get labelWallets {
    return Intl.message(
      'Wallets',
      name: 'labelWallets',
      desc: '',
      args: [],
    );
  }

  /// `What's new`
  String get labelWhatsNew {
    return Intl.message(
      'What\'s new',
      name: 'labelWhatsNew',
      desc: '',
      args: [],
    );
  }

  /// `Withdrawal`
  String get labelWithdrawal {
    return Intl.message(
      'Withdrawal',
      name: 'labelWithdrawal',
      desc: '',
      args: [],
    );
  }

  /// `Your date of birth`
  String get labelYourDateOfBirth {
    return Intl.message(
      'Your date of birth',
      name: 'labelYourDateOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `Search assets`
  String get searchAssetsHint {
    return Intl.message(
      'Search assets',
      name: 'searchAssetsHint',
      desc: '',
      args: [],
    );
  }

  /// `Account Currency`
  String get semanticAccountCurrencyIcon {
    return Intl.message(
      'Account Currency',
      name: 'semanticAccountCurrencyIcon',
      desc: '',
      args: [],
    );
  }

  /// `Account settings`
  String get semanticAccountSettingsIcon {
    return Intl.message(
      'Account settings',
      name: 'semanticAccountSettingsIcon',
      desc: '',
      args: [],
    );
  }

  /// `Area Chart`
  String get semanticAreaChartIcon {
    return Intl.message(
      'Area Chart',
      name: 'semanticAreaChartIcon',
      desc: '',
      args: [],
    );
  }

  /// `Badge`
  String get semanticBadgeIcon {
    return Intl.message(
      'Badge',
      name: 'semanticBadgeIcon',
      desc: '',
      args: [],
    );
  }

  /// `Badge Indicator`
  String get semanticBadgeIndicatorIcon {
    return Intl.message(
      'Badge Indicator',
      name: 'semanticBadgeIndicatorIcon',
      desc: '',
      args: [],
    );
  }

  /// `Calendar`
  String get semanticCalendarIcon {
    return Intl.message(
      'Calendar',
      name: 'semanticCalendarIcon',
      desc: '',
      args: [],
    );
  }

  /// `Call/put spreads`
  String get semanticCallPutSpreads {
    return Intl.message(
      'Call/put spreads',
      name: 'semanticCallPutSpreads',
      desc: '',
      args: [],
    );
  }

  /// `Candle Chart`
  String get semanticCandleChartIcon {
    return Intl.message(
      'Candle Chart',
      name: 'semanticCandleChartIcon',
      desc: '',
      args: [],
    );
  }

  /// `Chart Type`
  String get semanticChartType {
    return Intl.message(
      'Chart Type',
      name: 'semanticChartType',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get semanticCloseIcon {
    return Intl.message(
      'Close',
      name: 'semanticCloseIcon',
      desc: '',
      args: [],
    );
  }

  /// `Commission info`
  String get semanticCommissionOutInfoIcon {
    return Intl.message(
      'Commission info',
      name: 'semanticCommissionOutInfoIcon',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get semanticConfirmIcon {
    return Intl.message(
      'Confirm',
      name: 'semanticConfirmIcon',
      desc: '',
      args: [],
    );
  }

  /// `Contract Type`
  String get semanticContractDetailsContractTypeIcon {
    return Intl.message(
      'Contract Type',
      name: 'semanticContractDetailsContractTypeIcon',
      desc: '',
      args: [],
    );
  }

  /// `Contract Type`
  String get semanticContractTypeIcon {
    return Intl.message(
      'Contract Type',
      name: 'semanticContractTypeIcon',
      desc: '',
      args: [],
    );
  }

  /// `Deal Cancellation Indicator`
  String get semanticDealCancellationIndicator {
    return Intl.message(
      'Deal Cancellation Indicator',
      name: 'semanticDealCancellationIndicator',
      desc: '',
      args: [],
    );
  }

  /// `Default Trailing Icon for Selectable Item`
  String get semanticDefaultTrailingIcon {
    return Intl.message(
      'Default Trailing Icon for Selectable Item',
      name: 'semanticDefaultTrailingIcon',
      desc: '',
      args: [],
    );
  }

  /// `Deposit`
  String get semanticDepositIcon {
    return Intl.message(
      'Deposit',
      name: 'semanticDepositIcon',
      desc: '',
      args: [],
    );
  }

  /// `Deriv Logo`
  String get semanticDerivLogo {
    return Intl.message(
      'Deriv Logo',
      name: 'semanticDerivLogo',
      desc: '',
      args: [],
    );
  }

  /// `DP2P`
  String get semanticDP2PIcon {
    return Intl.message(
      'DP2P',
      name: 'semanticDP2PIcon',
      desc: '',
      args: [],
    );
  }

  /// `DP2P`
  String get semanticDp2pIcon {
    return Intl.message(
      'DP2P',
      name: 'semanticDp2pIcon',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get semanticEditIcon {
    return Intl.message(
      'Edit',
      name: 'semanticEditIcon',
      desc: '',
      args: [],
    );
  }

  /// `Filter List`
  String get semanticFilterListIcon {
    return Intl.message(
      'Filter List',
      name: 'semanticFilterListIcon',
      desc: '',
      args: [],
    );
  }

  /// `Fullscreen message image placeholder`
  String get semanticFullscreenMessagePlaceholder {
    return Intl.message(
      'Fullscreen message image placeholder',
      name: 'semanticFullscreenMessagePlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Has New Contract`
  String get semanticHasNewContractIcon {
    return Intl.message(
      'Has New Contract',
      name: 'semanticHasNewContractIcon',
      desc: '',
      args: [],
    );
  }

  /// `Help and support`
  String get semanticHelpAndSupportIcon {
    return Intl.message(
      'Help and support',
      name: 'semanticHelpAndSupportIcon',
      desc: '',
      args: [],
    );
  }

  /// `Help Center`
  String get semanticHelpCenterIcon {
    return Intl.message(
      'Help Center',
      name: 'semanticHelpCenterIcon',
      desc: '',
      args: [],
    );
  }

  /// `Help centre`
  String get semanticHelpCentreIcon {
    return Intl.message(
      'Help centre',
      name: 'semanticHelpCentreIcon',
      desc: '',
      args: [],
    );
  }

  /// `Contract Type`
  String get semanticLabelContractTypeIcon {
    return Intl.message(
      'Contract Type',
      name: 'semanticLabelContractTypeIcon',
      desc: '',
      args: [],
    );
  }

  /// `deriv brand logo`
  String get semanticLabelDerivLogo {
    return Intl.message(
      'deriv brand logo',
      name: 'semanticLabelDerivLogo',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get semanticLabelEditIcon {
    return Intl.message(
      'Edit',
      name: 'semanticLabelEditIcon',
      desc: '',
      args: [],
    );
  }

  /// `Symbol`
  String get semanticLabelSymbolIcon {
    return Intl.message(
      'Symbol',
      name: 'semanticLabelSymbolIcon',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get semanticLanguageIcon {
    return Intl.message(
      'Language',
      name: 'semanticLanguageIcon',
      desc: '',
      args: [],
    );
  }

  /// `Live chat`
  String get semanticLiveChatIcon {
    return Intl.message(
      'Live chat',
      name: 'semanticLiveChatIcon',
      desc: '',
      args: [],
    );
  }

  /// `Multipliers`
  String get semanticMultipliers {
    return Intl.message(
      'Multipliers',
      name: 'semanticMultipliers',
      desc: '',
      args: [],
    );
  }

  /// `Cashier`
  String get semanticNavigationCashierIcon {
    return Intl.message(
      'Cashier',
      name: 'semanticNavigationCashierIcon',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get semanticNavigationLogoutIcon {
    return Intl.message(
      'Logout',
      name: 'semanticNavigationLogoutIcon',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get semanticNavigationNotificationIcon {
    return Intl.message(
      'Notification',
      name: 'semanticNavigationNotificationIcon',
      desc: '',
      args: [],
    );
  }

  /// `Terms and Conditions`
  String get semanticNavigationTnCIcon {
    return Intl.message(
      'Terms and Conditions',
      name: 'semanticNavigationTnCIcon',
      desc: '',
      args: [],
    );
  }

  /// `Trade`
  String get semanticNavigationTradeIcon {
    return Intl.message(
      'Trade',
      name: 'semanticNavigationTradeIcon',
      desc: '',
      args: [],
    );
  }

  /// `1 Notification`
  String get semanticNotificationCountIcon {
    return Intl.message(
      '1 Notification',
      name: 'semanticNotificationCountIcon',
      desc: '',
      args: [],
    );
  }

  /// `Information`
  String get semanticNotificationInformationIcon {
    return Intl.message(
      'Information',
      name: 'semanticNotificationInformationIcon',
      desc: '',
      args: [],
    );
  }

  /// `{count} Notifications`
  String semanticNotificationsCountIcon(Object count) {
    return Intl.message(
      '$count Notifications',
      name: 'semanticNotificationsCountIcon',
      desc: '',
      args: [count],
    );
  }

  /// `Number Pad widget handle`
  String get semanticNumberPadBottomSheetHandle {
    return Intl.message(
      'Number Pad widget handle',
      name: 'semanticNumberPadBottomSheetHandle',
      desc: '',
      args: [],
    );
  }

  /// `Open positions`
  String get semanticOpenPositionsIcon {
    return Intl.message(
      'Open positions',
      name: 'semanticOpenPositionsIcon',
      desc: '',
      args: [],
    );
  }

  /// `Options`
  String get semanticOptions {
    return Intl.message(
      'Options',
      name: 'semanticOptions',
      desc: '',
      args: [],
    );
  }

  /// `Payment agent`
  String get semanticPaymentAgentIcon {
    return Intl.message(
      'Payment agent',
      name: 'semanticPaymentAgentIcon',
      desc: '',
      args: [],
    );
  }

  /// `Payment agents`
  String get semanticPaymentAgentsIcon {
    return Intl.message(
      'Payment agents',
      name: 'semanticPaymentAgentsIcon',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get semanticProfileIcon {
    return Intl.message(
      'Profile',
      name: 'semanticProfileIcon',
      desc: '',
      args: [],
    );
  }

  /// `Profit table`
  String get semanticProfitTableIcon {
    return Intl.message(
      'Profit table',
      name: 'semanticProfitTableIcon',
      desc: '',
      args: [],
    );
  }

  /// `Reports`
  String get semanticReportsIcon {
    return Intl.message(
      'Reports',
      name: 'semanticReportsIcon',
      desc: '',
      args: [],
    );
  }

  /// `Security and safety`
  String get semanticSecurityAndSafetyIcon {
    return Intl.message(
      'Security and safety',
      name: 'semanticSecurityAndSafetyIcon',
      desc: '',
      args: [],
    );
  }

  /// `Sort`
  String get semanticSortIcon {
    return Intl.message(
      'Sort',
      name: 'semanticSortIcon',
      desc: '',
      args: [],
    );
  }

  /// `Statement`
  String get semanticStatementIcon {
    return Intl.message(
      'Statement',
      name: 'semanticStatementIcon',
      desc: '',
      args: [],
    );
  }

  /// `Stop Out Info`
  String get semanticStopOutInfoIcon {
    return Intl.message(
      'Stop Out Info',
      name: 'semanticStopOutInfoIcon',
      desc: '',
      args: [],
    );
  }

  /// `Help and support`
  String get semanticSupportIcon {
    return Intl.message(
      'Help and support',
      name: 'semanticSupportIcon',
      desc: '',
      args: [],
    );
  }

  /// `Symbol`
  String get semanticSymbolIcon {
    return Intl.message(
      'Symbol',
      name: 'semanticSymbolIcon',
      desc: '',
      args: [],
    );
  }

  /// `Transfer`
  String get semanticTransferIcon {
    return Intl.message(
      'Transfer',
      name: 'semanticTransferIcon',
      desc: '',
      args: [],
    );
  }

  /// `User email`
  String get semanticUserEmail {
    return Intl.message(
      'User email',
      name: 'semanticUserEmail',
      desc: '',
      args: [],
    );
  }

  /// `User full name`
  String get semanticUserFullName {
    return Intl.message(
      'User full name',
      name: 'semanticUserFullName',
      desc: '',
      args: [],
    );
  }

  /// `Verification`
  String get semanticVerificationIcon {
    return Intl.message(
      'Verification',
      name: 'semanticVerificationIcon',
      desc: '',
      args: [],
    );
  }

  /// `Withdrawal`
  String get semanticWithdrawalIcon {
    return Intl.message(
      'Withdrawal',
      name: 'semanticWithdrawalIcon',
      desc: '',
      args: [],
    );
  }

  /// `Added to Favourites`
  String get snackBarContentAddFavorite {
    return Intl.message(
      'Added to Favourites',
      name: 'snackBarContentAddFavorite',
      desc: '',
      args: [],
    );
  }

  /// `Removed from Favourites`
  String get snackBarContentRemoveFavorite {
    return Intl.message(
      'Removed from Favourites',
      name: 'snackBarContentRemoveFavorite',
      desc: '',
      args: [],
    );
  }

  /// `Please ensure that this address is the same as in your proof of address.`
  String get warnAddressIsIdenticalToPOA {
    return Intl.message(
      'Please ensure that this address is the same as in your proof of address.',
      name: 'warnAddressIsIdenticalToPOA',
      desc: '',
      args: [],
    );
  }

  /// `Sorry, you can't view this contract because it doesn't belong to this account.`
  String get warnCannotViewTheContract {
    return Intl.message(
      'Sorry, you can\'t view this contract because it doesn\'t belong to this account.',
      name: 'warnCannotViewTheContract',
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

  /// `Date of birth format: yyyy-mm-dd`
  String get warnDateOfBirthNotValid {
    return Intl.message(
      'Date of birth format: yyyy-mm-dd',
      name: 'warnDateOfBirthNotValid',
      desc: '',
      args: [],
    );
  }

  /// `Date of birth is required.`
  String get warnDateOfBirthRequired {
    return Intl.message(
      'Date of birth is required.',
      name: 'warnDateOfBirthRequired',
      desc: '',
      args: [],
    );
  }

  /// `Invalid {Input}. {Input} can't be greater than {maxAmount} {currencySymbol}`
  String warnDoubleInputValueCantBeGreaterThan(
      Object Input, Object maxAmount, Object currencySymbol) {
    return Intl.message(
      'Invalid $Input. $Input can\'t be greater than $maxAmount $currencySymbol',
      name: 'warnDoubleInputValueCantBeGreaterThan',
      desc: '',
      args: [Input, maxAmount, currencySymbol],
    );
  }

  /// `Invalid {Input}. {Input} can't be less than {minAmount} {currencySymbol}`
  String warnDoubleInputValueCantBeLessThan(
      Object Input, Object minAmount, Object currencySymbol) {
    return Intl.message(
      'Invalid $Input. $Input can\'t be less than $minAmount $currencySymbol',
      name: 'warnDoubleInputValueCantBeLessThan',
      desc: '',
      args: [Input, minAmount, currencySymbol],
    );
  }

  /// `Please enter a date between {minimum} and {maximum}.`
  String warnEnterInRangeDate(Object minimum, Object maximum) {
    return Intl.message(
      'Please enter a date between $minimum and $maximum.',
      name: 'warnEnterInRangeDate',
      desc: '',
      args: [minimum, maximum],
    );
  }

  /// `Please enter a valid date.`
  String get warnEnterValidDate {
    return Intl.message(
      'Please enter a valid date.',
      name: 'warnEnterValidDate',
      desc: '',
      args: [],
    );
  }

  /// `This should not exceed 70 characters.`
  String get warnFirstLineOfAddressNotValidLength {
    return Intl.message(
      'This should not exceed 70 characters.',
      name: 'warnFirstLineOfAddressNotValidLength',
      desc: '',
      args: [],
    );
  }

  /// `First line of address is required.`
  String get warnFirstLineOfAddressRequired {
    return Intl.message(
      'First line of address is required.',
      name: 'warnFirstLineOfAddressRequired',
      desc: '',
      args: [],
    );
  }

  /// `First name should be between 2 and 50 characters.`
  String get warnFirstNameNotValidLength {
    return Intl.message(
      'First name should be between 2 and 50 characters.',
      name: 'warnFirstNameNotValidLength',
      desc: '',
      args: [],
    );
  }

  /// `Letters, spaces, periods, hyphens, apostrophes only.`
  String get warnFirstNameNotValid {
    return Intl.message(
      'Letters, spaces, periods, hyphens, apostrophes only.',
      name: 'warnFirstNameNotValid',
      desc: '',
      args: [],
    );
  }

  /// `First name is required,`
  String get warnFirstNameRequired {
    return Intl.message(
      'First name is required,',
      name: 'warnFirstNameRequired',
      desc: '',
      args: [],
    );
  }

  /// `invalid application ID`
  String get warnInvalidApplicationID {
    return Intl.message(
      'invalid application ID',
      name: 'warnInvalidApplicationID',
      desc: '',
      args: [],
    );
  }

  /// `invalid endpoint`
  String get warnInvalidEndpoint {
    return Intl.message(
      'invalid endpoint',
      name: 'warnInvalidEndpoint',
      desc: '',
      args: [],
    );
  }

  /// `You should enter 6-25 characters.`
  String get warnInvalidLoginPasswordLength {
    return Intl.message(
      'You should enter 6-25 characters.',
      name: 'warnInvalidLoginPasswordLength',
      desc: '',
      args: [],
    );
  }

  /// `You should enter 8-25 characters.`
  String get warnInvalidPasswordLength {
    return Intl.message(
      'You should enter 8-25 characters.',
      name: 'warnInvalidPasswordLength',
      desc: '',
      args: [],
    );
  }

  /// `Password should have lower and uppercase English letters with numbers.`
  String get warnInvalidPassword {
    return Intl.message(
      'Password should have lower and uppercase English letters with numbers.',
      name: 'warnInvalidPassword',
      desc: '',
      args: [],
    );
  }

  /// `Last name should be between 2 and 50 characters.`
  String get warnLastNameNotValidLength {
    return Intl.message(
      'Last name should be between 2 and 50 characters.',
      name: 'warnLastNameNotValidLength',
      desc: '',
      args: [],
    );
  }

  /// `Letters, spaces, periods, hyphens, apostrophes only.`
  String get warnLastNameNotValid {
    return Intl.message(
      'Letters, spaces, periods, hyphens, apostrophes only.',
      name: 'warnLastNameNotValid',
      desc: '',
      args: [],
    );
  }

  /// `Last name is required,`
  String get warnLastNameRequired {
    return Intl.message(
      'Last name is required,',
      name: 'warnLastNameRequired',
      desc: '',
      args: [],
    );
  }

  /// `If you leave now, you will lose all your progress.`
  String get warnLoseProgress {
    return Intl.message(
      'If you leave now, you will lose all your progress.',
      name: 'warnLoseProgress',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection`
  String get warnNoInternetConnection {
    return Intl.message(
      'No internet connection',
      name: 'warnNoInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Check your spelling or use a different term.`
  String get warnNoResultsFoundDescription {
    return Intl.message(
      'Check your spelling or use a different term.',
      name: 'warnNoResultsFoundDescription',
      desc: '',
      args: [],
    );
  }

  /// `No results for "{assetName}".`
  String warnNoResultsFoundSearchPage(Object assetName) {
    return Intl.message(
      'No results for "$assetName".',
      name: 'warnNoResultsFoundSearchPage',
      desc: '',
      args: [assetName],
    );
  }

  /// `Deriv GO isn't available in your country`
  String get warnNotAvailableCountriesTitle {
    return Intl.message(
      'Deriv GO isn\'t available in your country',
      name: 'warnNotAvailableCountriesTitle',
      desc: '',
      args: [],
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

  /// `Deriv GO isn't available for the EU yet`
  String get warnNotAvailableEUCountries {
    return Intl.message(
      'Deriv GO isn\'t available for the EU yet',
      name: 'warnNotAvailableEUCountries',
      desc: '',
      args: [],
    );
  }

  /// `You're not connected to the internet. Check your connection and retry.`
  String get warnNotConnected {
    return Intl.message(
      'You\'re not connected to the internet. Check your connection and retry.',
      name: 'warnNotConnected',
      desc: '',
      args: [],
    );
  }

  /// `Phone number is required.`
  String get warnPhoneNumberIsRequired {
    return Intl.message(
      'Phone number is required.',
      name: 'warnPhoneNumberIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid phone number, including the country code which starts with +.`
  String get warnPhoneNumberNotHavingCountryCode {
    return Intl.message(
      'Please enter a valid phone number, including the country code which starts with +.',
      name: 'warnPhoneNumberNotHavingCountryCode',
      desc: '',
      args: [],
    );
  }

  /// `Phone number is not in a proper format.`
  String get warnPhoneNumberNotProperFormat {
    return Intl.message(
      'Phone number is not in a proper format.',
      name: 'warnPhoneNumberNotProperFormat',
      desc: '',
      args: [],
    );
  }

  /// `You should enter 9-35 numbers.`
  String get warnPhoneNumberNotValid {
    return Intl.message(
      'You should enter 9-35 numbers.',
      name: 'warnPhoneNumberNotValid',
      desc: '',
      args: [],
    );
  }

  /// `Please enter amount`
  String get warnPleaseEnterAmount {
    return Intl.message(
      'Please enter amount',
      name: 'warnPleaseEnterAmount',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a postal/ZIP code under 20 characters.`
  String get warnPostalOrZipCodeNotValidLength {
    return Intl.message(
      'Please enter a postal/ZIP code under 20 characters.',
      name: 'warnPostalOrZipCodeNotValidLength',
      desc: '',
      args: [],
    );
  }

  /// `Postal code is required.`
  String get warnPostalOrZipcodeRequired {
    return Intl.message(
      'Postal code is required.',
      name: 'warnPostalOrZipcodeRequired',
      desc: '',
      args: [],
    );
  }

  /// `Required.`
  String get warnRequired {
    return Intl.message(
      'Required.',
      name: 'warnRequired',
      desc: '',
      args: [],
    );
  }

  /// `Second line of address is required.`
  String get warnSecondLineOfAddressRequired {
    return Intl.message(
      'Second line of address is required.',
      name: 'warnSecondLineOfAddressRequired',
      desc: '',
      args: [],
    );
  }

  /// `Something's not right`
  String get warnSomethingsNotRight {
    return Intl.message(
      'Something\'s not right',
      name: 'warnSomethingsNotRight',
      desc: '',
      args: [],
    );
  }

  /// `This should not exceed 30 characters.`
  String get warnStateOrProvinceNotValidLength {
    return Intl.message(
      'This should not exceed 30 characters.',
      name: 'warnStateOrProvinceNotValidLength',
      desc: '',
      args: [],
    );
  }

  /// `State is required.`
  String get warnStateOrProvinceRequired {
    return Intl.message(
      'State is required.',
      name: 'warnStateOrProvinceRequired',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to leave?`
  String get warnSureToLeave {
    return Intl.message(
      'Are you sure you want to leave?',
      name: 'warnSureToLeave',
      desc: '',
      args: [],
    );
  }

  /// `That contract is in your {currency} account ({account}). Do you want to switch accounts to view the contract?`
  String warnSwitchAccount(Object currency, Object account) {
    return Intl.message(
      'That contract is in your $currency account ($account). Do you want to switch accounts to view the contract?',
      name: 'warnSwitchAccount',
      desc: '',
      args: [currency, account],
    );
  }

  /// `This field is required.`
  String get warnThisFieldIsRequired {
    return Intl.message(
      'This field is required.',
      name: 'warnThisFieldIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `This should not exceed 30 characters.`
  String get warnTownOrCityNotValidLength {
    return Intl.message(
      'This should not exceed 30 characters.',
      name: 'warnTownOrCityNotValidLength',
      desc: '',
      args: [],
    );
  }

  /// `City is required.`
  String get warnTownOrCityRequired {
    return Intl.message(
      'City is required.',
      name: 'warnTownOrCityRequired',
      desc: '',
      args: [],
    );
  }

  /// `Unsupported format.`
  String get warnUnsupportedFormat {
    return Intl.message(
      'Unsupported format.',
      name: 'warnUnsupportedFormat',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email address`
  String get warnValidEmail {
    return Intl.message(
      'Please enter a valid email address',
      name: 'warnValidEmail',
      desc: '',
      args: [],
    );
  }

  /// `{Input} can't be greater than {maxAmount} {currencySymbol}`
  String warnValueCantBeGreaterThan(
      Object Input, Object maxAmount, Object currencySymbol) {
    return Intl.message(
      '$Input can\'t be greater than $maxAmount $currencySymbol',
      name: 'warnValueCantBeGreaterThan',
      desc: '',
      args: [Input, maxAmount, currencySymbol],
    );
  }

  /// `{Input} can't be less than {minAmount} {currencySymbol}`
  String warnValueCantBeLessThan(
      Object Input, Object minAmount, Object currencySymbol) {
    return Intl.message(
      '$Input can\'t be less than $minAmount $currencySymbol',
      name: 'warnValueCantBeLessThan',
      desc: '',
      args: [Input, minAmount, currencySymbol],
    );
  }

  /// `{Input} between {minAmountClear} {currencySymbol} and {maxAmount} {currencySymbol}`
  String warnValueShouldBeInRange(Object Input, Object minAmountClear,
      Object currencySymbol, Object maxAmount) {
    return Intl.message(
      '$Input between $minAmountClear $currencySymbol and $maxAmount $currencySymbol',
      name: 'warnValueShouldBeInRange',
      desc: '',
      args: [Input, minAmountClear, currencySymbol, maxAmount],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
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
