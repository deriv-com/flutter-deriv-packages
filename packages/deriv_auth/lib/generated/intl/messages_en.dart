// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(email) =>
      "We’ve sent a message to ${email} with a link to reset your password.";

  static String m1(email) =>
      "We\'ve sent a message to ${email} with a link to activate your account.";

  static String m2(app) => "${app} isn\'t available in your country";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "actionContinue": MessageLookupByLibrary.simpleMessage("Continue"),
        "actionCreateANewAccount":
            MessageLookupByLibrary.simpleMessage("Create a new account"),
        "actionCreateAccount":
            MessageLookupByLibrary.simpleMessage("Create free demo account"),
        "actionEmailNotReceived":
            MessageLookupByLibrary.simpleMessage("Didn\'t receive your email?"),
        "actionForgotPassword":
            MessageLookupByLibrary.simpleMessage("Forgot password?"),
        "actionGetAFreeAccount":
            MessageLookupByLibrary.simpleMessage("Get a free account"),
        "actionLogin": MessageLookupByLibrary.simpleMessage("Log in"),
        "actionNext": MessageLookupByLibrary.simpleMessage("Next"),
        "actionOk": MessageLookupByLibrary.simpleMessage("OK"),
        "actionPrevious": MessageLookupByLibrary.simpleMessage("Previous"),
        "actionProceed": MessageLookupByLibrary.simpleMessage("Proceed"),
        "actionReenterEmail": MessageLookupByLibrary.simpleMessage(
            "Re-enter your email and try again"),
        "actionResetPass":
            MessageLookupByLibrary.simpleMessage("Reset my password"),
        "actionStartTrading":
            MessageLookupByLibrary.simpleMessage("Start trading"),
        "actionTryAgain": MessageLookupByLibrary.simpleMessage("Try Again"),
        "infoReferralInfoDescription": MessageLookupByLibrary.simpleMessage(
            "An alphanumeric code provided by a Deriv affiliate, applicable for email sign-ups only."),
        "informConnectionError": MessageLookupByLibrary.simpleMessage(
            "Connection error. Please try again later."),
        "informDeactivatedAccount": MessageLookupByLibrary.simpleMessage(
            "Your account is deactivated."),
        "informEnterTwoFactorAuthCode": MessageLookupByLibrary.simpleMessage(
            "Enter the 6-digit code from the authenticator app on your phone."),
        "informExpiredAccount":
            MessageLookupByLibrary.simpleMessage("Your account is expired"),
        "informFailedAuthentication": MessageLookupByLibrary.simpleMessage(
            "Your email or password may be incorrect. Did you sign up with a social account? Check and try again."),
        "informFailedAuthorization":
            MessageLookupByLibrary.simpleMessage("Authorization failed."),
        "informInvalid2FACode": MessageLookupByLibrary.simpleMessage(
            "The code you entered is invalid. Check and try again."),
        "informInvalidCredentials":
            MessageLookupByLibrary.simpleMessage("Invalid credentials."),
        "informInvalidEmailFormat":
            MessageLookupByLibrary.simpleMessage("Enter a valid email address"),
        "informInvalidPasswordFormat": MessageLookupByLibrary.simpleMessage(
            "Please enter a valid password format"),
        "informInvalidReferralCode": MessageLookupByLibrary.simpleMessage(
            "The referral code you entered is invalid. Check and try again."),
        "informInvalidResidence":
            MessageLookupByLibrary.simpleMessage("Invalid residence."),
        "informLetsContinue":
            MessageLookupByLibrary.simpleMessage("Let\'s continue."),
        "informLoginOptions":
            MessageLookupByLibrary.simpleMessage("Or log in with"),
        "informMissingOtp":
            MessageLookupByLibrary.simpleMessage("Missing one-time password."),
        "informPasswordPolicy":
            MessageLookupByLibrary.simpleMessage("Your password must have:"),
        "informPasswordPolicyLength":
            MessageLookupByLibrary.simpleMessage("8-25 characters"),
        "informPasswordPolicyLowerAndUpper":
            MessageLookupByLibrary.simpleMessage(
                "Upper and lower case letters"),
        "informPasswordPolicyNumber":
            MessageLookupByLibrary.simpleMessage("At least one number"),
        "informRedirectLogin": MessageLookupByLibrary.simpleMessage(
            "You’ll need to log in with your new password. Hang on, we’re redirecting you."),
        "informResetPassByEmail": MessageLookupByLibrary.simpleMessage(
            "We\'ll email you instructions to reset your password."),
        "informSelfClosed": MessageLookupByLibrary.simpleMessage(
            "Your account has been closed."),
        "informSendResetPasswordEmail": m0,
        "informSwitchAccountError": MessageLookupByLibrary.simpleMessage(
            "Switch account error. Please try again later."),
        "informUnexpectedError": MessageLookupByLibrary.simpleMessage(
            "An unexpected error occurred."),
        "informUnsupportedCountry": MessageLookupByLibrary.simpleMessage(
            "Your country is not supported."),
        "informVerificationEmailSent": m1,
        "informYourPassHasBeenReset": MessageLookupByLibrary.simpleMessage(
            "Your password has been reset"),
        "labelApplicationID":
            MessageLookupByLibrary.simpleMessage("Application ID"),
        "labelCheckEmail":
            MessageLookupByLibrary.simpleMessage("Check your email"),
        "labelChooseCountry":
            MessageLookupByLibrary.simpleMessage("Choose country"),
        "labelChooseNewPass":
            MessageLookupByLibrary.simpleMessage("Choose a new password"),
        "labelCountryConsentBrazil": MessageLookupByLibrary.simpleMessage(
            "I hereby confirm that my request for opening an account with Deriv to trade OTC products issued and offered exclusively outside Brazil was initiated by me. I fully understand that Deriv is not regulated by CVM and by approaching Deriv I intend to set up a relation with a foreign company."),
        "labelCreatePass": MessageLookupByLibrary.simpleMessage("Password"),
        "labelCreatePassword":
            MessageLookupByLibrary.simpleMessage("Create a password"),
        "labelDeveloper": MessageLookupByLibrary.simpleMessage("Developer"),
        "labelDontHaveAnAccountYet":
            MessageLookupByLibrary.simpleMessage("Don’t have an account yet?"),
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
        "labelEndpoint": MessageLookupByLibrary.simpleMessage("Endpoint"),
        "labelGotReferralCode":
            MessageLookupByLibrary.simpleMessage("Got a referral code?"),
        "labelHaveAccount":
            MessageLookupByLibrary.simpleMessage("Already have an account?"),
        "labelKeepPassword": MessageLookupByLibrary.simpleMessage(
            "Keep your account secure with a password"),
        "labelLiveChat": MessageLookupByLibrary.simpleMessage("Live chat"),
        "labelLogIn": MessageLookupByLibrary.simpleMessage("Log in"),
        "labelNotAvailable":
            MessageLookupByLibrary.simpleMessage("Not available"),
        "labelOrSignUpWith":
            MessageLookupByLibrary.simpleMessage("Or sign up with"),
        "labelPassword": MessageLookupByLibrary.simpleMessage("Password"),
        "labelReferralCode":
            MessageLookupByLibrary.simpleMessage("Referral Code"),
        "labelReferralInfoTitle":
            MessageLookupByLibrary.simpleMessage("Affiliate referral code"),
        "labelResetPassword":
            MessageLookupByLibrary.simpleMessage("Reset password"),
        "labelSearchCountry":
            MessageLookupByLibrary.simpleMessage("Search country"),
        "labelSelectCountry":
            MessageLookupByLibrary.simpleMessage("Where do you live?"),
        "labelSignUp": MessageLookupByLibrary.simpleMessage("Sign up"),
        "labelThanksEmail": MessageLookupByLibrary.simpleMessage(
            "Thanks for verifying your email"),
        "labelTwoFactorAuth":
            MessageLookupByLibrary.simpleMessage("Two-factor authentication"),
        "labelTwoFactorAuthenticationCode":
            MessageLookupByLibrary.simpleMessage("2FA code"),
        "labelVerifyYourEmail":
            MessageLookupByLibrary.simpleMessage("Verify your email"),
        "semanticApplicationID":
            MessageLookupByLibrary.simpleMessage("Application ID"),
        "semanticEndpoint": MessageLookupByLibrary.simpleMessage("Endpoint"),
        "warnCountryNotAvailable": MessageLookupByLibrary.simpleMessage(
            "Unfortunately, Deriv is not available in your country."),
        "warnInvalidApplicationID":
            MessageLookupByLibrary.simpleMessage("invalid application ID"),
        "warnInvalidEndpoint":
            MessageLookupByLibrary.simpleMessage("invalid endpoint"),
        "warnNotAvailableCountries": MessageLookupByLibrary.simpleMessage(
            "If you have any questions, contact us via "),
        "warnNotAvailableCountriesTitle": m2,
        "warnPasswordContainsSymbol": MessageLookupByLibrary.simpleMessage(
            "Use symbols for strong password."),
        "warnPasswordLength": MessageLookupByLibrary.simpleMessage(
            "You should enter 8-25 characters.")
      };
}
