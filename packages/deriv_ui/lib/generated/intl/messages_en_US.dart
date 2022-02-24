// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en_US locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en_US';

  static String m0(String
  commissionPercentageValue,String stake,String currencySymbol,String multiplierValue) =>
      "${commissionPercentageValue}% of (${stake} ${currencySymbol} * ${multiplierValue})";

  static String m1(String duration) =>
      "Your contract will be closed automatically at the next available asset price when the duration exceeds ${duration}.";

  static String m2(String time,String date) =>
      "This market is closed. It will reopen at ${time} (GMT) on ${date}.";

  static String m3(String time,String date) => "${time} (GMT) on ${date}";

  static String m4(String stopOutPercentageValue) =>
      "When your current loss equals or \nexceeds ${stopOutPercentageValue}% of your trade amount, your \ncontract will be closed at the nearest \navailable asset price.";

  static String m5(String currentTickIndex,String totalTickCount) =>
      "Ticks ${currentTickIndex}/${totalTickCount}";

  static String m6(String email) =>
      "We\'ve sent a message to ${email} with a link to activate your account.";

  static String m7(String selectedCurrency) =>
      "You have added a ${selectedCurrency} account.\nMake a deposit now to start trading.";

  static String m8(String count) => "Closed (${count})";

  static String m9(String commissionValue) => "Commission: ${commissionValue}";

  static String m10(String value) => "${value} days";

  static String m11(String cancellationFee) => "${cancellationFee}";

  static String m12(String time) => "${time} GMT";

  static String m13(String value) => "${value} hours";

  static String m14(String minuteValue) => "${minuteValue} mins";

  static String m15(String minuteValue) => "${minuteValue} minutes";

  static String m16(String title) => "Next: ${title}";

  static String m17(String count) => "Open (${count})";

  static String m18(String versionValue) => "Version ${versionValue}";

  static String m19(String count) => "${count} Notifications";

  static String m20(String Input,String maxAmount,String currencySymbol) =>
      "Invalid ${Input}. ${Input} can\'t be greater than ${maxAmount} ${currencySymbol}";

  static String m21(String Input,String minAmount,String currencySymbol) =>
      "Invalid ${Input}. ${Input} can\'t be less than ${minAmount} ${currencySymbol}";

  static String m22(String minimum,String maximum) =>
      "Please enter a date between ${minimum} and ${maximum}.";

  static String m23(String assetName) => "No results for \"${assetName}\".";

  static String m24(String currency,String account) =>
      "That contract is in your ${currency} account (${account}). Do you want to switch accounts to view the contract?";

  static String m25(String Input,String maxAmount,String currencySymbol) =>
      "${Input} can\'t be greater than ${maxAmount} ${currencySymbol}";

  static String m26(String Input,String minAmount,String currencySymbol) =>
      "${Input} can\'t be less than ${minAmount} ${currencySymbol}";

  static String m27(String Input, String minAmountClear, String currencySymbol,String maxAmount) =>
      "${Input} between ${minAmountClear} ${currencySymbol} and ${maxAmount} ${currencySymbol}";

  final messages = _notInlinedMessages();
  static Map<String, Function> _notInlinedMessages() => <String, Function>{
    "actionAccept": MessageLookupByLibrary.simpleMessage("I accept"),
    "actionAddAccount": MessageLookupByLibrary.simpleMessage("Add account"),
    "actionAgreeToTnCPart1": MessageLookupByLibrary.simpleMessage(
        "I have read and agree to the "),
    "actionAgreeToTnCPart2":
    MessageLookupByLibrary.simpleMessage(" of the Deriv website."),
    "actionCallSpread": MessageLookupByLibrary.simpleMessage("Call Spread"),
    "actionCancel": MessageLookupByLibrary.simpleMessage("CANCEL"),
    "actionClear": MessageLookupByLibrary.simpleMessage("Clear"),
    "actionCompleteForm":
    MessageLookupByLibrary.simpleMessage("Complete form"),
    "actionContactUs": MessageLookupByLibrary.simpleMessage("Contact us"),
    "actionContinue": MessageLookupByLibrary.simpleMessage("Continue"),
    "actionCreateAccount":
    MessageLookupByLibrary.simpleMessage("Create free demo account"),
    "actionDelete": MessageLookupByLibrary.simpleMessage("Delete All"),
    "actionDepositNow": MessageLookupByLibrary.simpleMessage("Deposit now"),
    "actionDismiss": MessageLookupByLibrary.simpleMessage("Dismiss"),
    "actionDontAskAgain":
    MessageLookupByLibrary.simpleMessage("Don\'t ask me again."),
    "actionDown": MessageLookupByLibrary.simpleMessage("Down"),
    "actionEmailNotReceived":
    MessageLookupByLibrary.simpleMessage("Didn\'t receive your email?"),
    "actionFall": MessageLookupByLibrary.simpleMessage("Fall"),
    "actionForgotPassword":
    MessageLookupByLibrary.simpleMessage("Forgot password?"),
    "actionGiveFeedback":
    MessageLookupByLibrary.simpleMessage("GIVE FEEDBACK"),
    "actionGoBack": MessageLookupByLibrary.simpleMessage("Go Back"),
    "actionGoBackToTrading":
    MessageLookupByLibrary.simpleMessage("Go Back to trading"),
    "actionGotIt": MessageLookupByLibrary.simpleMessage("GOT IT"),
    "actionLater": MessageLookupByLibrary.simpleMessage("LATER"),
    "actionLeave": MessageLookupByLibrary.simpleMessage("LEAVE"),
    "actionLogin": MessageLookupByLibrary.simpleMessage("Log in"),
    "actionLoginToDeriv":
    MessageLookupByLibrary.simpleMessage("Log in to Deriv.com"),
    "actionMaybeLater": MessageLookupByLibrary.simpleMessage("Maybe later"),
    "actionNext": MessageLookupByLibrary.simpleMessage("Next"),
    "actionNo": MessageLookupByLibrary.simpleMessage("NO"),
    "actionNotPEP": MessageLookupByLibrary.simpleMessage(
        "I am not a PEP, and I have not been a PEP in the last 12 months."),
    "actionOK": MessageLookupByLibrary.simpleMessage("OK"),
    "actionPrevious": MessageLookupByLibrary.simpleMessage("Previous"),
    "actionPutSpread": MessageLookupByLibrary.simpleMessage("Put Spread"),
    "actionReadLess": MessageLookupByLibrary.simpleMessage("Read less"),
    "actionReadMore": MessageLookupByLibrary.simpleMessage("Read more"),
    "actionReadTnC":
    MessageLookupByLibrary.simpleMessage("Read terms and conditions"),
    "actionReenterEmail": MessageLookupByLibrary.simpleMessage(
        "Re-enter your email and try again"),
    "actionRemindLater":
    MessageLookupByLibrary.simpleMessage("Remind later"),
    "actionResetPass":
    MessageLookupByLibrary.simpleMessage("Reset my password"),
    "actionRetry": MessageLookupByLibrary.simpleMessage("Retry"),
    "actionRise": MessageLookupByLibrary.simpleMessage("Rise"),
    "actionSave": MessageLookupByLibrary.simpleMessage("SAVE"),
    "actionSeeOpenMarkets":
    MessageLookupByLibrary.simpleMessage("See open markets"),
    "actionSignUp": MessageLookupByLibrary.simpleMessage("Sign up"),
    "actionStartTrading":
    MessageLookupByLibrary.simpleMessage("Start trading"),
    "actionStay": MessageLookupByLibrary.simpleMessage("STAY ON THIS PAGE"),
    "actionTryAgain": MessageLookupByLibrary.simpleMessage("Try again"),
    "actionTrySyntheticIndices":
    MessageLookupByLibrary.simpleMessage("Try synthetic indices"),
    "actionUp": MessageLookupByLibrary.simpleMessage("Up"),
    "actionUpdate": MessageLookupByLibrary.simpleMessage("Update"),
    "actionUpdateNow": MessageLookupByLibrary.simpleMessage("Update now"),
    "actionUpgrade": MessageLookupByLibrary.simpleMessage("Upgrade"),
    "actionVerify": MessageLookupByLibrary.simpleMessage("Verify"),
    "actionVerifyAddress":
    MessageLookupByLibrary.simpleMessage("Verify address"),
    "actionVerifyIdentity":
    MessageLookupByLibrary.simpleMessage("Verify identity"),
    "actionYes": MessageLookupByLibrary.simpleMessage("YES"),
    "askAboutApp": MessageLookupByLibrary.simpleMessage(
        "What do you think about our app?"),
    "askDeleteAll": MessageLookupByLibrary.simpleMessage("Delete all?"),
    "askWouldLikeToUpdate": MessageLookupByLibrary.simpleMessage(
        "Would you like to update your app now?"),
    "infoEmptyNotifications": MessageLookupByLibrary.simpleMessage(
        "You have yet to receive any notifications"),
    "informAccountDeactivation": MessageLookupByLibrary.simpleMessage(
        "Your account has been deactivated"),
    "informAccountDeactivationDescription1":
    MessageLookupByLibrary.simpleMessage("If you need help, please "),
    "informAccountDeactivationDescription2":
    MessageLookupByLibrary.simpleMessage("contact us"),
    "informAccountDeactivationDescription3":
    MessageLookupByLibrary.simpleMessage(" via live chat."),
    "informAllowEquals": MessageLookupByLibrary.simpleMessage(
        "Win payout if if exit spot is also equal to entry spot"),
    "informCheckEmailDescription": MessageLookupByLibrary.simpleMessage(
        "Please check your email and click on the link provided to reset your password."),
    "informCheckEmailTitle":
    MessageLookupByLibrary.simpleMessage("Check your email"),
    "informComebackInHint":
    MessageLookupByLibrary.simpleMessage("Please come back in"),
    "informCommissionHint": m0,
    "informDeactivatedAccount": MessageLookupByLibrary.simpleMessage(
        "Your account is deactivated. Please contact us via live chat."),
    "informDealCancellationHint": MessageLookupByLibrary.simpleMessage(
        "Allows you to cancel your trade within a chosen time frame should the market move against your favour."),
    "informDeleteCantUndo": MessageLookupByLibrary.simpleMessage(
        "Once you delete all news, you can\'t undo it."),
    "informDepositNow": MessageLookupByLibrary.simpleMessage(
        "Deposit now to start trading"),
    "informEnterTwoFactorAuthCode": MessageLookupByLibrary.simpleMessage(
        "Enter the two-factor authentication (2FA) code from the authenticator app on your phone."),
    "informExpiryDuration": m1,
    "informFeedback": MessageLookupByLibrary.simpleMessage(
        "Help us improve our app with a quick survey."),
    "informFeedbackRecommendation": MessageLookupByLibrary.simpleMessage(
        "Enjoy using this app? Got ideas for improvement?\n\nTell us how to make this app better for you."),
    "informInactiveDealCancellationHint":
    MessageLookupByLibrary.simpleMessage(
        "Deal cancellation is not supported for \nthis market."),
    "informInvalidEmailFormat": MessageLookupByLibrary.simpleMessage(
        "Please enter a valid email format"),
    "informInvalidPasswordFormat": MessageLookupByLibrary.simpleMessage(
        "Please enter a valid password format"),
    "informLoggedOutHint":
    MessageLookupByLibrary.simpleMessage("You\'ve been logged out"),
    "informLoginBinaryUsers1":
    MessageLookupByLibrary.simpleMessage("If you\'re a "),
    "informLoginBinaryUsers2":
    MessageLookupByLibrary.simpleMessage(" user, log in with your "),
    "informLoginBinaryUsers3":
    MessageLookupByLibrary.simpleMessage(" username and password."),
    "informLoginOptions":
    MessageLookupByLibrary.simpleMessage("Or log in with"),
    "informMarketClosedAndReopeningHint": m2,
    "informMarketClosedHint":
    MessageLookupByLibrary.simpleMessage("This market is closed"),
    "informMarketReopenTimeHint": m3,
    "informMultiplierHint": MessageLookupByLibrary.simpleMessage(
        "Your gross profit is the percentage \nchange in market price times your \ntrade amount and the multiplier \nchosen here."),
    "informNewUserFeedbackRecommendationPart":
    MessageLookupByLibrary.simpleMessage(
        "Thank you for downloading Deriv GO.\n\nWe want to make Deriv GO better for you. If you have any suggestions to improve this app, hit the Feedback button to let us know."),
    "informNewVersion": MessageLookupByLibrary.simpleMessage(
        "A new version of Deriv GO is available."),
    "informNoHistory": MessageLookupByLibrary.simpleMessage(
        "You have yet to update either take profit or stop loss"),
    "informPleaseUpdate":
    MessageLookupByLibrary.simpleMessage("Please update your app"),
    "informPleaseUpdateUsing": MessageLookupByLibrary.simpleMessage(
        "Please update your app to continue using Deriv GO."),
    "informRedirectLogin": MessageLookupByLibrary.simpleMessage(
        "We will now redirect you to the login page."),
    "informReopenAtHint":
    MessageLookupByLibrary.simpleMessage("It will reopen at"),
    "informResetPassByEmail": MessageLookupByLibrary.simpleMessage(
        "We\'ll email you instructions to reset your password."),
    "informSelfClosedDescription1": MessageLookupByLibrary.simpleMessage(
        "Please log in to our website to reactivate your account. "),
    "informSelfClosedDescription2":
    MessageLookupByLibrary.simpleMessage("Contact us via live chat"),
    "informSelfClosedDescription3":
    MessageLookupByLibrary.simpleMessage(" if you need help."),
    "informSelfClosedTitle":
    MessageLookupByLibrary.simpleMessage("Reactivating your account?"),
    "informSessionExpiredHint": MessageLookupByLibrary.simpleMessage(
        "Your session has expired. Please log in to continue."),
    "informStopOutHint": m4,
    "informStrongPass": MessageLookupByLibrary.simpleMessage(
        "Strong passwords contain at least 8 characters, combine uppercase and lowercase letters, numbers, and symbols."),
    "informStrongPassword": MessageLookupByLibrary.simpleMessage(
        "Strong passwords contain at least 8 characters, combine uppercase and lowercase letters, numbers, and symbols."),
    "informTakeProfitAndStopLossHint": MessageLookupByLibrary.simpleMessage(
        "Take profit: Set a threshold for your profit. Your position will be closed automatically when your profit reaches (or exceeds) this amount.\n\nStop loss: Set a threshold for your loss. Your position will be closed automatically when your loss reaches (or exceeds) this amount."),
    "informTickCount": m5,
    "informTradeAmountHint": MessageLookupByLibrary.simpleMessage(
        "Your gross profit is the percentage\nchange in market price times your\ntrade amount and the multiplier\nchosen here."),
    "informTradeAmountPercentage": MessageLookupByLibrary.simpleMessage(
        "Your gross profit is the percentage change in market price times your trade amount and the multiplier chosen"),
    "informTrySyntheticIndicesHint": MessageLookupByLibrary.simpleMessage(
        "In the meantime, try our synthetic indices. They simulate real-market volatility and are open 24/7. "),
    "informVerificationEmailSent": m6,
    "informVerifyAddress":
    MessageLookupByLibrary.simpleMessage("Please verify your address"),
    "informVerifyIdentity":
    MessageLookupByLibrary.simpleMessage("Please verify your identity"),
    "informWelcomeAppBeta":
    MessageLookupByLibrary.simpleMessage("Welcome!"),
    "informYourPassChanged": MessageLookupByLibrary.simpleMessage(
        "Your password has been changed"),
    "label10Mins": MessageLookupByLibrary.simpleMessage("10 mins"),
    "label10MinsAbbreviate": MessageLookupByLibrary.simpleMessage("10 M"),
    "label15Mins": MessageLookupByLibrary.simpleMessage("15 mins"),
    "label15MinsAbbreviate": MessageLookupByLibrary.simpleMessage("15 M"),
    "label1Day": MessageLookupByLibrary.simpleMessage("1 day"),
    "label1DayAbbreviate": MessageLookupByLibrary.simpleMessage("1 D"),
    "label1Hour": MessageLookupByLibrary.simpleMessage("1 hour"),
    "label1HourAbbreviate": MessageLookupByLibrary.simpleMessage("1 H"),
    "label1Min": MessageLookupByLibrary.simpleMessage("1 min"),
    "label1MinAbbreviate": MessageLookupByLibrary.simpleMessage("1 M"),
    "label1Tick": MessageLookupByLibrary.simpleMessage("1 tick"),
    "label1TickAbbreviate": MessageLookupByLibrary.simpleMessage("1 T"),
    "label2FA":
    MessageLookupByLibrary.simpleMessage("Two-factor authentication"),
    "label2FACode": MessageLookupByLibrary.simpleMessage("2FA code"),
    "label2Hours": MessageLookupByLibrary.simpleMessage("2 hours"),
    "label2HoursAbbreviate": MessageLookupByLibrary.simpleMessage("2 H"),
    "label2Mins": MessageLookupByLibrary.simpleMessage("2 mins"),
    "label2MinsAbbreviate": MessageLookupByLibrary.simpleMessage("2 M"),
    "label30Mins": MessageLookupByLibrary.simpleMessage("30 mins"),
    "label30MinsAbbreviate": MessageLookupByLibrary.simpleMessage("30 M"),
    "label3Mins": MessageLookupByLibrary.simpleMessage("3 mins"),
    "label3MinsAbbreviate": MessageLookupByLibrary.simpleMessage("3 M"),
    "label4Hours": MessageLookupByLibrary.simpleMessage("4 hours"),
    "label4HoursAbbreviate": MessageLookupByLibrary.simpleMessage("4 H"),
    "label5Hours": MessageLookupByLibrary.simpleMessage("5 hours"),
    "label5HoursAbbreviate": MessageLookupByLibrary.simpleMessage("5 H"),
    "label5Mins": MessageLookupByLibrary.simpleMessage("5 mins"),
    "label5MinsAbbreviate": MessageLookupByLibrary.simpleMessage("5 M"),
    "label8Hours": MessageLookupByLibrary.simpleMessage("8 hours"),
    "label8HoursAbbreviate": MessageLookupByLibrary.simpleMessage("8 H"),
    "labelAccepted": MessageLookupByLibrary.simpleMessage("Accepted"),
    "labelAccountCreateDeposit": m7,
    "labelAccountCurrency":
    MessageLookupByLibrary.simpleMessage("Account currency"),
    "labelAccountLimits":
    MessageLookupByLibrary.simpleMessage("Account limits"),
    "labelAccountSettings":
    MessageLookupByLibrary.simpleMessage("Account settings"),
    "labelAccounts": MessageLookupByLibrary.simpleMessage("Accounts"),
    "labelAddress": MessageLookupByLibrary.simpleMessage("Address"),
    "labelAllowEquals":
    MessageLookupByLibrary.simpleMessage("Allow equals"),
    "labelAmount": MessageLookupByLibrary.simpleMessage("Amount"),
    "labelApiToken": MessageLookupByLibrary.simpleMessage("API token"),
    "labelApplicationID":
    MessageLookupByLibrary.simpleMessage("Application ID"),
    "labelArea": MessageLookupByLibrary.simpleMessage("Area"),
    "labelAsset": MessageLookupByLibrary.simpleMessage("Asset"),
    "labelAssets": MessageLookupByLibrary.simpleMessage("Assets"),
    "labelBarrier": MessageLookupByLibrary.simpleMessage("Barrier"),
    "labelBinaryDotCom": MessageLookupByLibrary.simpleMessage("Binary.com"),
    "labelBuyId": MessageLookupByLibrary.simpleMessage("Buy ID"),
    "labelBuyPrice": MessageLookupByLibrary.simpleMessage("Buy price"),
    "labelBuyTime": MessageLookupByLibrary.simpleMessage("Buy time"),
    "labelCalendar": MessageLookupByLibrary.simpleMessage("Calendar"),
    "labelCallPutSpreads":
    MessageLookupByLibrary.simpleMessage("Call/put spreads"),
    "labelCallSpread": MessageLookupByLibrary.simpleMessage("Call spread"),
    "labelCancelTrade":
    MessageLookupByLibrary.simpleMessage("Cancel trade"),
    "labelCancellationTypeActive":
    MessageLookupByLibrary.simpleMessage("(active)"),
    "labelCancellationTypeExecuted":
    MessageLookupByLibrary.simpleMessage("(executed)"),
    "labelCancellationTypeExpired":
    MessageLookupByLibrary.simpleMessage("(expired)"),
    "labelCancelled": MessageLookupByLibrary.simpleMessage("Cancelled"),
    "labelCandle": MessageLookupByLibrary.simpleMessage("Candle"),
    "labelCashier": MessageLookupByLibrary.simpleMessage("Cashier"),
    "labelChange": MessageLookupByLibrary.simpleMessage("Change"),
    "labelChartSettings":
    MessageLookupByLibrary.simpleMessage("Chart settings"),
    "labelChartTypes": MessageLookupByLibrary.simpleMessage("Chart types"),
    "labelCheckEmail":
    MessageLookupByLibrary.simpleMessage("Check your email"),
    "labelChooseCountry":
    MessageLookupByLibrary.simpleMessage("Choose country"),
    "labelChooseNewPass":
    MessageLookupByLibrary.simpleMessage("Choose a new password"),
    "labelChooseStateOrProvince":
    MessageLookupByLibrary.simpleMessage("Choose State Or Province"),
    "labelClose": MessageLookupByLibrary.simpleMessage("Close"),
    "labelCloseTrade": MessageLookupByLibrary.simpleMessage("Close trade"),
    "labelCloseTradeNow":
    MessageLookupByLibrary.simpleMessage("Close trade now"),
    "labelClosed": MessageLookupByLibrary.simpleMessage("Closed"),
    "labelClosedPositionsEmptyPage": MessageLookupByLibrary.simpleMessage(
        "You have no trading activity yet."),
    "labelClosedSymbolWithOpenTime":
    MessageLookupByLibrary.simpleMessage("Closed. Open in"),
    "labelClosedWithCount": m8,
    "labelCommission": m9,
    "labelConfirm": MessageLookupByLibrary.simpleMessage("Confirm"),
    "labelConnectedApps":
    MessageLookupByLibrary.simpleMessage("Connected apps"),
    "labelContinueSignup": MessageLookupByLibrary.simpleMessage(
        "Let\'s continue sign up process."),
    "labelContractDetails":
    MessageLookupByLibrary.simpleMessage("Contract details"),
    "labelContractDetailsCommission":
    MessageLookupByLibrary.simpleMessage("Commission"),
    "labelContractIsClosedWithLoss": MessageLookupByLibrary.simpleMessage(
        "Contract is closed. Loss is "),
    "labelContractIsClosedWithProfit": MessageLookupByLibrary.simpleMessage(
        "Contract is closed. Profit is "),
    "labelContractMarkers":
    MessageLookupByLibrary.simpleMessage("Contract markers"),
    "labelCreatePass":
    MessageLookupByLibrary.simpleMessage("Create a password"),
    "labelCreatePassword":
    MessageLookupByLibrary.simpleMessage("Create a password"),
    "labelCryptocurrencies":
    MessageLookupByLibrary.simpleMessage("Cryptocurrencies"),
    "labelDC": MessageLookupByLibrary.simpleMessage("DC"),
    "labelDailyRange": MessageLookupByLibrary.simpleMessage("Daily range"),
    "labelDate": MessageLookupByLibrary.simpleMessage("Date"),
    "labelDateOfBirthRequired":
    MessageLookupByLibrary.simpleMessage("Date of birth*"),
    "labelDay": MessageLookupByLibrary.simpleMessage("day"),
    "labelDays": MessageLookupByLibrary.simpleMessage("days"),
    "labelDaysValue": m10,
    "labelDeactivateAccount":
    MessageLookupByLibrary.simpleMessage("Deactivate account"),
    "labelDealCancelFee": m11,
    "labelDealCancellation":
    MessageLookupByLibrary.simpleMessage("Deal cancellation"),
    "labelDealCancellationFee":
    MessageLookupByLibrary.simpleMessage("Deal cancellation fee"),
    "labelDemo": MessageLookupByLibrary.simpleMessage("Demo"),
    "labelDemoAccount":
    MessageLookupByLibrary.simpleMessage("Demo account"),
    "labelDeposit": MessageLookupByLibrary.simpleMessage("Deposit"),
    "labelDeriv": MessageLookupByLibrary.simpleMessage("Deriv"),
    "labelDetails": MessageLookupByLibrary.simpleMessage("Details"),
    "labelDeveloper": MessageLookupByLibrary.simpleMessage("Developer"),
    "labelDown": MessageLookupByLibrary.simpleMessage("Down"),
    "labelDp2p": MessageLookupByLibrary.simpleMessage("Deriv P2P"),
    "labelDuration": MessageLookupByLibrary.simpleMessage("Duration"),
    "labelEdit": MessageLookupByLibrary.simpleMessage("Edit"),
    "labelEmail": MessageLookupByLibrary.simpleMessage("Email"),
    "labelEmailIssueFirewall": MessageLookupByLibrary.simpleMessage(
        "We can\'t deliver the email to this address (Usually because of firewalls or filtering)."),
    "labelEmailIssueHeader": MessageLookupByLibrary.simpleMessage(
        "If you don\'t see an email from us within a few minutes, a few things could have happened:"),
    "labelEmailIssueSpam": MessageLookupByLibrary.simpleMessage(
        "The email is in your spam folder (Sometimes things get lost there)."),
    "labelEmailIssueTypo": MessageLookupByLibrary.simpleMessage(
        "The email address you entered had a mistake or typo (happens to the best of us)."),
    "labelEmailIssueWrongEmail": MessageLookupByLibrary.simpleMessage(
        "You accidentally gave us another email address (Usually a work or a personal one instead of the one you meant)."),
    "labelEmptyFavouritesSwipeLeft": MessageLookupByLibrary.simpleMessage(
        ", swipe left at the asset you like and hit the star."),
    "labelEmptyFavouritesToAdd":
    MessageLookupByLibrary.simpleMessage("To add to "),
    "labelEndDate": MessageLookupByLibrary.simpleMessage("End date"),
    "labelEndTime": MessageLookupByLibrary.simpleMessage("End time"),
    "labelEndpoint": MessageLookupByLibrary.simpleMessage("Endpoint"),
    "labelEndsIn": MessageLookupByLibrary.simpleMessage("Ends in"),
    "labelEntrySpot": MessageLookupByLibrary.simpleMessage("Entry spot"),
    "labelExitSpot": MessageLookupByLibrary.simpleMessage("Exit spot"),
    "labelExpiration": MessageLookupByLibrary.simpleMessage("Expiration"),
    "labelExpiresIn": MessageLookupByLibrary.simpleMessage("Expires in"),
    "labelFacebook": MessageLookupByLibrary.simpleMessage("Facebook"),
    "labelFall": MessageLookupByLibrary.simpleMessage("Fall"),
    "labelFavourites": MessageLookupByLibrary.simpleMessage("Favourites"),
    "labelFeedback": MessageLookupByLibrary.simpleMessage("Feedback"),
    "labelFiatCurrencies":
    MessageLookupByLibrary.simpleMessage("Fiat currencies"),
    "labelFinancialAssessment":
    MessageLookupByLibrary.simpleMessage("Financial assessment"),
    "labelFirstLineOfAddressRequired":
    MessageLookupByLibrary.simpleMessage("First line of address*"),
    "labelFirstNameRequired":
    MessageLookupByLibrary.simpleMessage("First name*"),
    "labelGMTTime": m12,
    "labelGoogle": MessageLookupByLibrary.simpleMessage("Google"),
    "labelHelpAndSupport":
    MessageLookupByLibrary.simpleMessage("Help and support"),
    "labelHelpCenter": MessageLookupByLibrary.simpleMessage("Help Center"),
    "labelHelpCentre": MessageLookupByLibrary.simpleMessage("Help centre"),
    "labelHigher": MessageLookupByLibrary.simpleMessage("Higher"),
    "labelHistory": MessageLookupByLibrary.simpleMessage("History"),
    "labelHome": MessageLookupByLibrary.simpleMessage("Home"),
    "labelHour": MessageLookupByLibrary.simpleMessage("hr"),
    "labelHoursValue": m13,
    "labelInformationIsConfidential": MessageLookupByLibrary.simpleMessage(
        "Any information you provide is confidential and will be used for verification purposes only."),
    "labelJurisdictionOfLawDescription": MessageLookupByLibrary.simpleMessage(
        "Your account will be opened with Deriv (SVG) Ltd., and will be subject to the jurisdiction and laws of Saint Vincent and the Grenadines."),
    "labelJurisdictionOfLawTitle": MessageLookupByLibrary.simpleMessage(
        "Jurisdiction and choice of law"),
    "labelKeepPassword": MessageLookupByLibrary.simpleMessage(
        "Keep your account secure with a password"),
    "labelLanguage": MessageLookupByLibrary.simpleMessage("Language"),
    "labelLastNameRequired":
    MessageLookupByLibrary.simpleMessage("Last name*"),
    "labelLastStep": MessageLookupByLibrary.simpleMessage("Last step"),
    "labelLiveChat": MessageLookupByLibrary.simpleMessage("Live chat"),
    "labelLogIn": MessageLookupByLibrary.simpleMessage("Log in"),
    "labelLoginGreeting": MessageLookupByLibrary.simpleMessage(
        "It\'s good to see you again. Log in to start trading."),
    "labelLoginHistory":
    MessageLookupByLibrary.simpleMessage("Login history"),
    "labelLoginWelcomeBack":
    MessageLookupByLibrary.simpleMessage("Welcome back!"),
    "labelLogout": MessageLookupByLibrary.simpleMessage("Log out"),
    "labelLower": MessageLookupByLibrary.simpleMessage("Lower"),
    "labelMarkets": MessageLookupByLibrary.simpleMessage("Markets"),
    "labelMins": m14,
    "labelMinute": MessageLookupByLibrary.simpleMessage("min"),
    "labelMinutes": m15,
    "labelMore": MessageLookupByLibrary.simpleMessage("More"),
    "labelMultiplier": MessageLookupByLibrary.simpleMessage("Multiplier"),
    "labelMultiplierSetting":
    MessageLookupByLibrary.simpleMessage("Multiplier settings"),
    "labelMultipliers": MessageLookupByLibrary.simpleMessage("Multipliers"),
    "labelNA": MessageLookupByLibrary.simpleMessage("N/A"),
    "labelName": MessageLookupByLibrary.simpleMessage("Name"),
    "labelNews": MessageLookupByLibrary.simpleMessage("News"),
    "labelNext": m16,
    "labelNoHistory": MessageLookupByLibrary.simpleMessage("No history"),
    "labelNoNotifications":
    MessageLookupByLibrary.simpleMessage("No notifications"),
    "labelNoSL": MessageLookupByLibrary.simpleMessage("No SL"),
    "labelNoTP": MessageLookupByLibrary.simpleMessage("No TP"),
    "labelNoTouch": MessageLookupByLibrary.simpleMessage("No touch"),
    "labelNotAvailable":
    MessageLookupByLibrary.simpleMessage("Not available"),
    "labelNotSet": MessageLookupByLibrary.simpleMessage("Not set"),
    "labelNotification":
    MessageLookupByLibrary.simpleMessage("Notification"),
    "labelOpen": MessageLookupByLibrary.simpleMessage("Open"),
    "labelOpenPositions": MessageLookupByLibrary.simpleMessage("Positions"),
    "labelOpenPositionsEmptyPage": MessageLookupByLibrary.simpleMessage(
        "You have no open positions yet."),
    "labelOpenWithCount": m17,
    "labelOptions": MessageLookupByLibrary.simpleMessage("Options"),
    "labelOrSignUpWith":
    MessageLookupByLibrary.simpleMessage("Or sign up with"),
    "labelOrderDetails":
    MessageLookupByLibrary.simpleMessage("Order details"),
    "labelOurProducts":
    MessageLookupByLibrary.simpleMessage("Our products"),
    "labelPEPDescription": MessageLookupByLibrary.simpleMessage(
        "A politically exposed person (PEP) is someone appointed with a prominent public position. Close associates and family members of a PEP are also considered to be PEPs."),
    "labelPEPTitle": MessageLookupByLibrary.simpleMessage(
        "Real accounts are not available to politically exposed persons (PEPs)."),
    "labelPassword": MessageLookupByLibrary.simpleMessage("Password"),
    "labelPasswords": MessageLookupByLibrary.simpleMessage("Passwords"),
    "labelPaymentAgent":
    MessageLookupByLibrary.simpleMessage("Payment agent"),
    "labelPaymentAgents":
    MessageLookupByLibrary.simpleMessage("Payment agents"),
    "labelPayout": MessageLookupByLibrary.simpleMessage("Payout"),
    "labelPersonalDetails":
    MessageLookupByLibrary.simpleMessage("Personal details"),
    "labelPhoneNumberRequired":
    MessageLookupByLibrary.simpleMessage("Phone number*"),
    "labelPositions": MessageLookupByLibrary.simpleMessage("Positions"),
    "labelPostalOrZipcode":
    MessageLookupByLibrary.simpleMessage("Postal/ZIP Code"),
    "labelPrice": MessageLookupByLibrary.simpleMessage("Price"),
    "labelProducts": MessageLookupByLibrary.simpleMessage("Products"),
    "labelProfile": MessageLookupByLibrary.simpleMessage("Profile"),
    "labelProfit": MessageLookupByLibrary.simpleMessage("Profit"),
    "labelProfitTable":
    MessageLookupByLibrary.simpleMessage("Profit table"),
    "labelProofOfAddress":
    MessageLookupByLibrary.simpleMessage("Proof of address"),
    "labelProofOfIdentity":
    MessageLookupByLibrary.simpleMessage("Proof of identity"),
    "labelPutSpread": MessageLookupByLibrary.simpleMessage("Put spread"),
    "labelReports": MessageLookupByLibrary.simpleMessage("Reports"),
    "labelResetPassword":
    MessageLookupByLibrary.simpleMessage("Reset Password"),
    "labelRise": MessageLookupByLibrary.simpleMessage("Rise"),
    "labelRiskManagement":
    MessageLookupByLibrary.simpleMessage("Risk management"),
    "labelRiskWarningDescription": MessageLookupByLibrary.simpleMessage(
        "The financial trading services offered on this site are only suitable for customers who accept the possibility of losing all the money they invest and who understand and have experience of the risk involved in the purchase of financial contracts. Transactions in financial contracts carry a high degree of risk. If the contracts you purchased expire as worthless, you will lose all your investment, which includes the contract premium."),
    "labelRiskWarningTitle":
    MessageLookupByLibrary.simpleMessage("Risk warning"),
    "labelSecond": MessageLookupByLibrary.simpleMessage("sec"),
    "labelSecondLineOfAddress":
    MessageLookupByLibrary.simpleMessage("Second line of address"),
    "labelSecurityAndSafety":
    MessageLookupByLibrary.simpleMessage("Security and safety"),
    "labelSecuritySafety":
    MessageLookupByLibrary.simpleMessage("Security and safety"),
    "labelSelectCountry":
    MessageLookupByLibrary.simpleMessage("Where do you live?"),
    "labelSelectDate": MessageLookupByLibrary.simpleMessage("Select date"),
    "labelSelectedRange":
    MessageLookupByLibrary.simpleMessage("Selected range"),
    "labelSelfExclusion":
    MessageLookupByLibrary.simpleMessage("Self Exclusion"),
    "labelSellId": MessageLookupByLibrary.simpleMessage("Sell ID"),
    "labelSellPrice": MessageLookupByLibrary.simpleMessage("Sell price"),
    "labelSellTime": MessageLookupByLibrary.simpleMessage("Sell time"),
    "labelSetOrder": MessageLookupByLibrary.simpleMessage("Set order"),
    "labelSettings": MessageLookupByLibrary.simpleMessage("Settings"),
    "labelShowMarkersOnChart": MessageLookupByLibrary.simpleMessage(
        "Show a marker on the chart when a contract is purchased."),
    "labelSl": MessageLookupByLibrary.simpleMessage("SL"),
    "labelSortAndFilter":
    MessageLookupByLibrary.simpleMessage("Sort and filter"),
    "labelSpreads": MessageLookupByLibrary.simpleMessage("Spreads"),
    "labelStake": MessageLookupByLibrary.simpleMessage("Stake"),
    "labelStartDate": MessageLookupByLibrary.simpleMessage("Start date"),
    "labelStartTime": MessageLookupByLibrary.simpleMessage("Start time"),
    "labelStateOrProvince":
    MessageLookupByLibrary.simpleMessage("State/Province"),
    "labelStatement": MessageLookupByLibrary.simpleMessage("Statement"),
    "labelStopLoss": MessageLookupByLibrary.simpleMessage("Stop loss"),
    "labelStopOut": MessageLookupByLibrary.simpleMessage("Stop out"),
    "labelSuccessExclamation":
    MessageLookupByLibrary.simpleMessage("Success!"),
    "labelSupport":
    MessageLookupByLibrary.simpleMessage("Help and support"),
    "labelSystem": MessageLookupByLibrary.simpleMessage("System"),
    "labelTP": MessageLookupByLibrary.simpleMessage("TP"),
    "labelTakeProfit": MessageLookupByLibrary.simpleMessage("Take profit"),
    "labelTakeProfitAndStopLoss":
    MessageLookupByLibrary.simpleMessage("Take profit and Stop loss"),
    "labelTermsOfUse": MessageLookupByLibrary.simpleMessage("Terms of use"),
    "labelThanksEmail": MessageLookupByLibrary.simpleMessage(
        "Thanks for verifying your email"),
    "labelTimeIntervals":
    MessageLookupByLibrary.simpleMessage("Time intervals"),
    "labelTnC":
    MessageLookupByLibrary.simpleMessage("Terms and conditions"),
    "labelTotalBuyPrice":
    MessageLookupByLibrary.simpleMessage("Total buy price"),
    "labelTotalProfitLoss":
    MessageLookupByLibrary.simpleMessage("Total profit/loss"),
    "labelTouch": MessageLookupByLibrary.simpleMessage("Touch"),
    "labelTownOrCityRequired":
    MessageLookupByLibrary.simpleMessage("Town/City*"),
    "labelTrade": MessageLookupByLibrary.simpleMessage("Trade"),
    "labelTradeAmount":
    MessageLookupByLibrary.simpleMessage("Trade amount"),
    "labelTradeDetails":
    MessageLookupByLibrary.simpleMessage("Trade details"),
    "labelTradeNow": MessageLookupByLibrary.simpleMessage("Trade now"),
    "labelTradeTypes": MessageLookupByLibrary.simpleMessage("Trade types"),
    "labelTransfer": MessageLookupByLibrary.simpleMessage("Transfer"),
    "labelTrendingMarkets":
    MessageLookupByLibrary.simpleMessage("Trending markets"),
    "labelTryATrade": MessageLookupByLibrary.simpleMessage("Try a trade"),
    "labelTwoFactorAuth":
    MessageLookupByLibrary.simpleMessage("Two-factor authentication"),
    "labelTwoFactorAuthentication":
    MessageLookupByLibrary.simpleMessage("Two-factor authentication"),
    "labelTwoFactorAuthenticationCode":
    MessageLookupByLibrary.simpleMessage("2FA code"),
    "labelType": MessageLookupByLibrary.simpleMessage("Type"),
    "labelUp": MessageLookupByLibrary.simpleMessage("Up"),
    "labelUpdateAvailable":
    MessageLookupByLibrary.simpleMessage("Update available"),
    "labelVerification":
    MessageLookupByLibrary.simpleMessage("Verification"),
    "labelVerifyAddress":
    MessageLookupByLibrary.simpleMessage("Verify address"),
    "labelVerifyIdentity":
    MessageLookupByLibrary.simpleMessage("Verify identity"),
    "labelVersion": m18,
    "labelWallets": MessageLookupByLibrary.simpleMessage("Wallets"),
    "labelWhatsNew": MessageLookupByLibrary.simpleMessage("What\'s new"),
    "labelWithdrawal": MessageLookupByLibrary.simpleMessage("Withdrawal"),
    "labelYourDateOfBirth":
    MessageLookupByLibrary.simpleMessage("Your date of birth"),
    "searchAssetsHint":
    MessageLookupByLibrary.simpleMessage("Search assets"),
    "semanticAccountCurrencyIcon":
    MessageLookupByLibrary.simpleMessage("Account Currency"),
    "semanticAccountSettingsIcon":
    MessageLookupByLibrary.simpleMessage("Account settings"),
    "semanticAreaChartIcon":
    MessageLookupByLibrary.simpleMessage("Area Chart"),
    "semanticBadgeIcon": MessageLookupByLibrary.simpleMessage("Badge"),
    "semanticBadgeIndicatorIcon":
    MessageLookupByLibrary.simpleMessage("Badge Indicator"),
    "semanticCalendarIcon":
    MessageLookupByLibrary.simpleMessage("Calendar"),
    "semanticCallPutSpreads":
    MessageLookupByLibrary.simpleMessage("Call/put spreads"),
    "semanticCandleChartIcon":
    MessageLookupByLibrary.simpleMessage("Candle Chart"),
    "semanticChartType": MessageLookupByLibrary.simpleMessage("Chart Type"),
    "semanticCloseIcon": MessageLookupByLibrary.simpleMessage("Close"),
    "semanticCommissionOutInfoIcon":
    MessageLookupByLibrary.simpleMessage("Commission info"),
    "semanticConfirmIcon": MessageLookupByLibrary.simpleMessage("Confirm"),
    "semanticContractDetailsContractTypeIcon":
    MessageLookupByLibrary.simpleMessage("Contract Type"),
    "semanticContractTypeIcon":
    MessageLookupByLibrary.simpleMessage("Contract Type"),
    "semanticDP2PIcon": MessageLookupByLibrary.simpleMessage("DP2P"),
    "semanticDealCancellationIndicator":
    MessageLookupByLibrary.simpleMessage("Deal Cancellation Indicator"),
    "semanticDefaultTrailingIcon": MessageLookupByLibrary.simpleMessage(
        "Default Trailing Icon for Selectable Item"),
    "semanticDepositIcon": MessageLookupByLibrary.simpleMessage("Deposit"),
    "semanticDerivLogo": MessageLookupByLibrary.simpleMessage("Deriv Logo"),
    "semanticDp2pIcon": MessageLookupByLibrary.simpleMessage("DP2P"),
    "semanticEditIcon": MessageLookupByLibrary.simpleMessage("Edit"),
    "semanticFilterListIcon":
    MessageLookupByLibrary.simpleMessage("Filter List"),
    "semanticFullscreenMessagePlaceholder":
    MessageLookupByLibrary.simpleMessage(
        "Fullscreen message image placeholder"),
    "semanticHasNewContractIcon":
    MessageLookupByLibrary.simpleMessage("Has New Contract"),
    "semanticHelpAndSupportIcon":
    MessageLookupByLibrary.simpleMessage("Help and support"),
    "semanticHelpCenterIcon":
    MessageLookupByLibrary.simpleMessage("Help Center"),
    "semanticHelpCentreIcon":
    MessageLookupByLibrary.simpleMessage("Help centre"),
    "semanticLabelContractTypeIcon":
    MessageLookupByLibrary.simpleMessage("Contract Type"),
    "semanticLabelDerivLogo":
    MessageLookupByLibrary.simpleMessage("deriv brand logo"),
    "semanticLabelEditIcon": MessageLookupByLibrary.simpleMessage("Edit"),
    "semanticLabelSymbolIcon":
    MessageLookupByLibrary.simpleMessage("Symbol"),
    "semanticLanguageIcon":
    MessageLookupByLibrary.simpleMessage("Language"),
    "semanticLiveChatIcon":
    MessageLookupByLibrary.simpleMessage("Live chat"),
    "semanticMultipliers":
    MessageLookupByLibrary.simpleMessage("Multipliers"),
    "semanticNavigationCashierIcon":
    MessageLookupByLibrary.simpleMessage("Cashier"),
    "semanticNavigationLogoutIcon":
    MessageLookupByLibrary.simpleMessage("Logout"),
    "semanticNavigationNotificationIcon":
    MessageLookupByLibrary.simpleMessage("Notification"),
    "semanticNavigationTnCIcon":
    MessageLookupByLibrary.simpleMessage("Terms and Conditions"),
    "semanticNavigationTradeIcon":
    MessageLookupByLibrary.simpleMessage("Trade"),
    "semanticNotificationCountIcon":
    MessageLookupByLibrary.simpleMessage("1 Notification"),
    "semanticNotificationInformationIcon":
    MessageLookupByLibrary.simpleMessage("Information"),
    "semanticNotificationsCountIcon": m19,
    "semanticNumberPadBottomSheetHandle":
    MessageLookupByLibrary.simpleMessage("Number Pad widget handle"),
    "semanticOpenPositionsIcon":
    MessageLookupByLibrary.simpleMessage("Open positions"),
    "semanticOptions": MessageLookupByLibrary.simpleMessage("Options"),
    "semanticPaymentAgentIcon":
    MessageLookupByLibrary.simpleMessage("Payment agent"),
    "semanticPaymentAgentsIcon":
    MessageLookupByLibrary.simpleMessage("Payment agents"),
    "semanticProfileIcon": MessageLookupByLibrary.simpleMessage("Profile"),
    "semanticProfitTableIcon":
    MessageLookupByLibrary.simpleMessage("Profit table"),
    "semanticReportsIcon": MessageLookupByLibrary.simpleMessage("Reports"),
    "semanticSecurityAndSafetyIcon":
    MessageLookupByLibrary.simpleMessage("Security and safety"),
    "semanticSortIcon": MessageLookupByLibrary.simpleMessage("Sort"),
    "semanticStatementIcon":
    MessageLookupByLibrary.simpleMessage("Statement"),
    "semanticStopOutInfoIcon":
    MessageLookupByLibrary.simpleMessage("Stop Out Info"),
    "semanticSupportIcon":
    MessageLookupByLibrary.simpleMessage("Help and support"),
    "semanticSymbolIcon": MessageLookupByLibrary.simpleMessage("Symbol"),
    "semanticTransferIcon":
    MessageLookupByLibrary.simpleMessage("Transfer"),
    "semanticUserEmail": MessageLookupByLibrary.simpleMessage("User email"),
    "semanticUserFullName":
    MessageLookupByLibrary.simpleMessage("User full name"),
    "semanticVerificationIcon":
    MessageLookupByLibrary.simpleMessage("Verification"),
    "semanticWithdrawalIcon":
    MessageLookupByLibrary.simpleMessage("Withdrawal"),
    "snackBarContentAddFavorite":
    MessageLookupByLibrary.simpleMessage("Added to Favourites"),
    "snackBarContentRemoveFavorite":
    MessageLookupByLibrary.simpleMessage("Removed from Favourites"),
    "warnAddressIsIdenticalToPOA": MessageLookupByLibrary.simpleMessage(
        "Please ensure that this address is the same as in your proof of address."),
    "warnCannotViewTheContract": MessageLookupByLibrary.simpleMessage(
        "Sorry, you can\'t view this contract because it doesn\'t belong to this account."),
    "warnCountryNotAvailable": MessageLookupByLibrary.simpleMessage(
        "Unfortunately, Deriv is not available in your country."),
    "warnDateOfBirthNotValid": MessageLookupByLibrary.simpleMessage(
        "Date of birth format: yyyy-mm-dd"),
    "warnDateOfBirthRequired":
    MessageLookupByLibrary.simpleMessage("Date of birth is required."),
    "warnDoubleInputValueCantBeGreaterThan": m20,
    "warnDoubleInputValueCantBeLessThan": m21,
    "warnEnterInRangeDate": m22,
    "warnEnterValidDate":
    MessageLookupByLibrary.simpleMessage("Please enter a valid date."),
    "warnFirstLineOfAddressNotValidLength":
    MessageLookupByLibrary.simpleMessage(
        "This should not exceed 70 characters."),
    "warnFirstLineOfAddressRequired": MessageLookupByLibrary.simpleMessage(
        "First line of address is required."),
    "warnFirstNameNotValid": MessageLookupByLibrary.simpleMessage(
        "Letters, spaces, periods, hyphens, apostrophes only."),
    "warnFirstNameNotValidLength": MessageLookupByLibrary.simpleMessage(
        "First name should be between 2 and 50 characters."),
    "warnFirstNameRequired":
    MessageLookupByLibrary.simpleMessage("First name is required,"),
    "warnInvalidApplicationID":
    MessageLookupByLibrary.simpleMessage("invalid application ID"),
    "warnInvalidEndpoint":
    MessageLookupByLibrary.simpleMessage("invalid endpoint"),
    "warnInvalidLoginPasswordLength": MessageLookupByLibrary.simpleMessage(
        "You should enter 6-25 characters."),
    "warnInvalidPassword": MessageLookupByLibrary.simpleMessage(
        "Password should have lower and uppercase English letters with numbers."),
    "warnInvalidPasswordLength": MessageLookupByLibrary.simpleMessage(
        "You should enter 8-25 characters."),
    "warnLastNameNotValid": MessageLookupByLibrary.simpleMessage(
        "Letters, spaces, periods, hyphens, apostrophes only."),
    "warnLastNameNotValidLength": MessageLookupByLibrary.simpleMessage(
        "Last name should be between 2 and 50 characters."),
    "warnLastNameRequired":
    MessageLookupByLibrary.simpleMessage("Last name is required,"),
    "warnLoseProgress": MessageLookupByLibrary.simpleMessage(
        "If you leave now, you will lose all your progress."),
    "warnNoInternetConnection":
    MessageLookupByLibrary.simpleMessage("No internet connection"),
    "warnNoResultsFoundDescription": MessageLookupByLibrary.simpleMessage(
        "Check your spelling or use a different term."),
    "warnNoResultsFoundSearchPage": m23,
    "warnNotAvailableCountries": MessageLookupByLibrary.simpleMessage(
        "If you have any questions, contact us via "),
    "warnNotAvailableCountriesTitle": MessageLookupByLibrary.simpleMessage(
        "Deriv GO isn\'t available in your country"),
    "warnNotAvailableEUCountries": MessageLookupByLibrary.simpleMessage(
        "Deriv GO isn\'t available for the EU yet"),
    "warnNotConnected": MessageLookupByLibrary.simpleMessage(
        "You\'re not connected to the internet. Check your connection and retry."),
    "warnPhoneNumberIsRequired":
    MessageLookupByLibrary.simpleMessage("Phone number is required."),
    "warnPhoneNumberNotHavingCountryCode": MessageLookupByLibrary.simpleMessage(
        "Please enter a valid phone number, including the country code which starts with +."),
    "warnPhoneNumberNotProperFormat": MessageLookupByLibrary.simpleMessage(
        "Phone number is not in a proper format."),
    "warnPhoneNumberNotValid": MessageLookupByLibrary.simpleMessage(
        "You should enter 9-35 numbers."),
    "warnPleaseEnterAmount":
    MessageLookupByLibrary.simpleMessage("Please enter amount"),
    "warnPostalOrZipCodeNotValidLength":
    MessageLookupByLibrary.simpleMessage(
        "Please enter a postal/ZIP code under 20 characters."),
    "warnPostalOrZipcodeRequired":
    MessageLookupByLibrary.simpleMessage("Postal code is required."),
    "warnRequired": MessageLookupByLibrary.simpleMessage("Required."),
    "warnSecondLineOfAddressRequired": MessageLookupByLibrary.simpleMessage(
        "Second line of address is required."),
    "warnSomethingsNotRight":
    MessageLookupByLibrary.simpleMessage("Something\'s not right"),
    "warnStateOrProvinceNotValidLength":
    MessageLookupByLibrary.simpleMessage(
        "This should not exceed 30 characters."),
    "warnStateOrProvinceRequired":
    MessageLookupByLibrary.simpleMessage("State is required."),
    "warnSureToLeave": MessageLookupByLibrary.simpleMessage(
        "Are you sure you want to leave?"),
    "warnSwitchAccount": m24,
    "warnThisFieldIsRequired":
    MessageLookupByLibrary.simpleMessage("This field is required."),
    "warnTownOrCityNotValidLength": MessageLookupByLibrary.simpleMessage(
        "This should not exceed 30 characters."),
    "warnTownOrCityRequired":
    MessageLookupByLibrary.simpleMessage("City is required."),
    "warnUnsupportedFormat":
    MessageLookupByLibrary.simpleMessage("Unsupported format."),
    "warnValidEmail": MessageLookupByLibrary.simpleMessage(
        "Please enter a valid email address"),
    "warnValueCantBeGreaterThan": m25,
    "warnValueCantBeLessThan": m26,
    "warnValueShouldBeInRange": m27
  };
}
