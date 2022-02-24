import 'package:flutter/material.dart';

import 'package:flutter_multipliers/core/helpers/helpers.dart';

/// Opens cashier deposit url in in-app browser.
Future<void> openCashierDepositWebPage(BuildContext context) async =>
    openLoggedInWebPage(context: context, redirectPath: 'cashier_deposit');

/// Opens cashier withdrawal url in in-app browser.
Future<void> openCashierWithdrawalWebPage(BuildContext context) async =>
    openLoggedInWebPage(context: context, redirectPath: 'cashier_withdrawal');

/// Opens cashier transfer url in in-app browser.
Future<void> openCashierTransferWebPage(BuildContext context) async =>
    openLoggedInWebPage(context: context, redirectPath: 'cashier_acc_transfer');

/// Opens cashier payment agent url in in-app browser.
Future<void> openCashierPaymentAgentWebPage(BuildContext context) async =>
    openLoggedInWebPage(context: context, redirectPath: 'cashier_pa');

/// Opens dp2p app if installed, otherwise opens dp2p store link in-app browser.
Future<void> openCashierDp2pWebPage(BuildContext context) async =>
    await isDp2pInstalled ? lunchDp2pApp() : openStore();

/// Opens statement url in in-app browser.
Future<void> openStatementWebPage(BuildContext context) async =>
    openLoggedInWebPage(context: context, redirectPath: 'statement');

/// Opens profit table url in in-app browser.
Future<void> openProfitTableWebPage(BuildContext context) async =>
    openLoggedInWebPage(context: context, redirectPath: 'profit');

/// Opens positions url in in-app browser.
Future<void> openPositionsWebPage(BuildContext context) async =>
    openLoggedInWebPage(context: context, redirectPath: 'positions');

/// Opens personal details url in in-app browser.
Future<void> openPersonalDetailsWebPage(BuildContext context) async =>
    openLoggedInWebPage(context: context, redirectPath: 'personal_details');

/// Opens deactivate account url in in-app browser.
Future<void> openDeactivateAccountWebPage(BuildContext context) async =>
    openLoggedInWebPage(
      context: context,
      redirectPath: 'deactivate_account',
      validateCredentialsOnClosed: true,
    );

/// Opens financial assessment url in in-app browser.
Future<void> openFinancialAssessmentWebPage(BuildContext context) async =>
    openLoggedInWebPage(context: context, redirectPath: 'financial_assessment');

/// Opens proof of identity url in in-app browser.
Future<void> openProofOfIdentityWebPage(BuildContext context) async =>
    openLoggedInWebPage(context: context, redirectPath: 'proof_of_identity');

/// Opens proof of address url in in-app browser.
Future<void> openProofOfAddressWebPage(BuildContext context) async =>
    openLoggedInWebPage(context: context, redirectPath: 'proof_of_address');

/// Opens passwords url in in-app browser.
Future<void> openPasswordsWebPage(BuildContext context) async =>
    openLoggedInWebPage(context: context, redirectPath: 'passwords');

/// Opens self exclusion url in in-app browser.
Future<void> openSelfExclusionWebPage(BuildContext context) async =>
    openLoggedInWebPage(context: context, redirectPath: 'self_exclusion');

/// Opens account limits url in in-app browser.
Future<void> openAccountLimitsWebPage(BuildContext context) async =>
    openLoggedInWebPage(context: context, redirectPath: 'account_limits');

/// Opens login history url in in-app browser.
Future<void> openLoginHistoryWebPage(BuildContext context) async =>
    openLoggedInWebPage(context: context, redirectPath: 'login_history');

/// Opens api token url in in-app browser.
Future<void> openApiTokenWebPage(BuildContext context) async =>
    openLoggedInWebPage(context: context, redirectPath: 'api_token');

/// Opens connected apps url in in-app browser.
Future<void> openConnectedAppsWebPage(BuildContext context) async =>
    openLoggedInWebPage(context: context, redirectPath: 'connected_apps');

/// Opens two factor authentication url in in-app browser.
Future<void> openTwoFactorAuthenticationWebPage(BuildContext context) async =>
    openLoggedInWebPage(
      context: context,
      redirectPath: 'two_factor_authentication',
    );

/// Opens reset password url in in-app browser.
Future<void> openRestPasswordWebPage({
  required BuildContext context,
  required String code,
}) async =>
    openLoggedInWebPage(
      context: context,
      redirectPath: 'reset_password',
      action: 'reset_password',
      code: code,
      validateCredentialsOnClosed: true,
    );

/// Opens deriv url in in-app browser.
Future<void> openDerivWebPage(BuildContext context) async =>
    openInAppWebView(context: context, url: '$derivUrl');

/// Opens terms of use url in in-app browser.
Future<void> openTermsOfUseWebPage(BuildContext context) async =>
    openInAppWebView(context: context, url: '$termsOfUseUrl');

/// Opens help center url in in-app browser.
Future<void> openHelpCentreWebPage(BuildContext context) =>
    openInAppWebView(context: context, url: '$helpCentreUrl');

/// Opens live chat url in in-app browser.
Future<void> openLiveChatWebPage(BuildContext context) =>
    openInAppWebView(context: context, url: '${contactUsUrl()}');

/// Opens contact us in in-app browser.
Future<void> openContactUsWebPage(BuildContext context) async =>
    openInAppWebView(
      context: context,
      url: '${contactUsUrl(openLiveChat: false)}',
    );

/// Opens Survey url in in-app browser.
Future<void> openSurveyWebPage(BuildContext context) async =>
    openInAppWebView(context: context, url: '$feedbackSurveyUrl');

/// Opens marketing news url in webview.
Future<void> openMarketingNews({
  required BuildContext context,
  required String url,
  bool loadInAppWebView = true,
}) async {
  if (loadInAppWebView) {
    await openInAppWebView(context: context, url: url, title: '');
  } else {
    await openWebPage(context: context, url: url);
  }
}
