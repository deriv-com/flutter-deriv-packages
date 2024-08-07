import 'package:analytics/sdk/rudderstack/core/rudderstack_configuration.dart';
import 'package:analytics/sdk/rudderstack/sdk/deriv_rudderstack_sdk.dart';

/// Class which hold events which should be monitored.
class DerivRudderstackEvents {
  /// Constructor for [DerivRudderstackEvents].
  const DerivRudderstackEvents();

  ///Set ups Rudderstack connection.
  void setup({required String dataPlaneUrl, required String writeKey}) {
    DerivRudderstack().setup(
      RudderstackConfiguration(dataPlaneUrl: dataPlaneUrl, writeKey: writeKey),
    );
  }

  /// --------- ce_virtual_signup_form ---------------
  /// Captures app_open event when the app is opened.
  void logAppOpened() {
    DerivRudderstack().track(
      eventName: 'ce_virtual_signup_form',
      properties: <String, dynamic>{
        'action': 'open',
        'form_source': 'mobile_derivgo',
        'form_name': 'common_events_derivgo'
      },
    );
  }

  /// Captures user tap on Log in button on sign up screen.
  void logUserTappedLoginButton() {
    DerivRudderstack().track(
      eventName: 'ce_virtual_signup_form',
      properties: <String, dynamic>{
        'action': 'go_to_login',
        'form_source': 'mobile_derivgo',
        'form_name': 'virtual_signup_derivgo'
      },
    );
  }

  /// Captures user tap on Get free account button on sign up screen.
  void logAppGetFreeAccount(String slideName) {
    DerivRudderstack().track(
      eventName: 'ce_virtual_signup_form',
      properties: <String, dynamic>{
        'action': 'get_free_account',
        'form_source': 'mobile_derivgo',
        'getstarted_slide_name':
            '${slideName.substring(slideName.indexOf('.') + 1, slideName.length)}',
        'form_name': 'virtual_signup_derivgo'
      },
    );
  }

  /// Tracks when user turns on or off Refferal toggle switcher.
  void logReferralToggleSwitched() {
    DerivRudderstack().track(
      eventName: 'ce_virtual_signup_form',
      properties: <String, dynamic>{
        'action': 'tap_referral_toggle',
        'form_source': 'mobile_derivgo',
        'form_name': 'virtual_signup_derivgo'
      },
    );
  }

  /// Tracks when user gets Invalid referral code pop up with Try again button.
  void logTryAgainReferralCode() {
    DerivRudderstack().track(
      eventName: 'ce_virtual_signup_form',
      properties: <String, dynamic>{
        'action': 'try_again_referral_code',
        'form_source': 'mobile_derivgo',
        'form_name': 'virtual_signup_derivgo'
      },
    );
  }

  /// Tracks when Email confirmation is sent to a user.
  void logEmailConfirmationSent() {
    DerivRudderstack().track(
      eventName: 'ce_virtual_signup_form',
      properties: <String, dynamic>{
        'action': 'email_confirmation_sent',
        'signup_provider': 'email',
        'form_source': 'mobile_derivgo',
        'form_name': 'virtual_signup_derivgo'
      },
    );
  }

  /// Tracks when user land on Successfull email verification screen.
  void logEmailConfirmed() {
    DerivRudderstack().track(
      eventName: 'ce_virtual_signup_form',
      properties: <String, dynamic>{
        'action': 'email_confirmed',
        'signup_provider': 'email',
        'form_source': 'mobile_derivgo',
        'form_name': 'virtual_signup_derivgo'
      },
    );
  }

  /// Tracks when user taps Continue button on Successfull email verification screen.
  void logSignupContinued() {
    DerivRudderstack().track(
      eventName: 'ce_virtual_signup_form',
      properties: <String, dynamic>{
        'action': 'signup_continued',
        'signup_provider': 'email',
        'form_source': 'mobile_derivgo',
        'form_name': 'virtual_signup_derivgo'
      },
    );
  }

  /// Tracks when user lands on Country selection screen.
  void logCountrySelectionPageOpened() {
    DerivRudderstack().track(
      eventName: 'ce_virtual_signup_form',
      properties: <String, dynamic>{
        'action': 'country_selection_screen_opened',
        'signup_provider': 'email',
        'form_source': 'mobile_derivgo',
        'form_name': 'virtual_signup_derivgo'
      },
    );
  }

  /// Tracks when user lands on Create password page while creating demo account.
  void logSetPasswordPageOpened() {
    DerivRudderstack().track(
      eventName: 'ce_virtual_signup_form',
      properties: <String, dynamic>{
        'action': 'password_screen_opened',
        'signup_provider': 'email',
        'form_source': 'mobile_derivgo',
        'form_name': 'virtual_signup_derivgo'
      },
    );
  }

  /// Tracks when user's sign up is finished.
  void logSignUpDone(String signupProvider) {
    DerivRudderstack().track(
      eventName: 'ce_virtual_signup_form',
      properties: <String, dynamic>{
        'action': 'signup_done',
        'signup_provider': '$signupProvider',
        'form_source': 'mobile_derivgo',
        'form_name': 'virtual_signup_derivgo'
      },
    );
  }

  /// Tracks when user taps 'Create free demo account' or social log in button.
  void logSignUpPageAction(String signupProvider,
      [bool? isToggleOn, String? referralCode]) {
    DerivRudderstack().track(
      eventName: 'ce_virtual_signup_form',
      properties: <String, dynamic>{
        'action': 'started',
        'signup_provider': '$signupProvider',
        'referral_toggle_mode': '${isToggleOn ?? false} ',
        'referral_code': '$referralCode',
        'form_source': 'mobile_derivgo',
        'form_name': 'virtual_signup_derivgo'
      },
    );
  }

  /// Tracks any error is happening and shown to the user (validation, API communication, social providers errors).
  void logSignUpFlowError(String? errorText, [String? signupProvider]) {
    DerivRudderstack().track(
      eventName: 'ce_virtual_signup_form',
      properties: <String, dynamic>{
        'action': 'signup_flow_error',
        'signup_provider': '$signupProvider',
        'error_message': '$errorText',
        'form_source': 'mobile_derivgo',
        'form_name': 'virtual_signup_derivgo'
      },
    );
  }

  /// Tracks when the real signup form opened.
  void logOpenRealSignUp() {
    DerivRudderstack().track(
      eventName: 'ce_real_account_signup_form',
      properties: <String, dynamic>{
        'action': 'open_real_sign_up',
        'form_source': 'mobile_derivgo',
        'form_name': 'real_signup_derivgo'
      },
    );
  }

  /// Tracks when the user presses the next button
  /// and the step is successfully passed.
  void logStepPassedRealSignUp(
      [String? stepNum,
      String? stepCodename,
      Map<String, dynamic>? userChoice]) {
    DerivRudderstack().track(
      eventName: 'ce_real_account_signup_form',
      properties: {
        'action': 'step_passed',
        'step_codename': stepCodename,
        'step_num': stepNum,
        'user_choice': userChoice,
        'form_source': 'mobile_derivgo',
        'form_name': 'real_signup_derivgo'
      },
    );
  }

  /// Tracks when user tap the 'previous' button and go to previous screen.
  void logStepBackRealSignUp(String stepCodeName) {
    DerivRudderstack().track(
      eventName: 'ce_real_account_signup_form',
      properties: <String, dynamic>{
        'action': 'step_back',
        'form_source': 'mobile_derivgo',
        'form_name': 'real_signup_derivgo'
      },
    );
  }

  /// Tracks if the user presses the close button on the signup form.
  void logCloseRealSignUp() {
    DerivRudderstack().track(
      eventName: 'ce_real_account_signup_form',
      properties: <String, dynamic>{
        'action': 'close',
        'form_source': 'mobile_derivgo',
        'form_name': 'real_signup_derivgo'
      },
    );
  }

  /// Tracks if any logical error has happened on the form,
  /// validation error for instance.
  void logValidationErrorDuringRealSignUp() {
    DerivRudderstack().track(
      eventName: 'ce_real_account_signup_form',
      properties: <String, dynamic>{
        'action': 'real_signup_error',
        'form_source': 'mobile_derivgo',
        'form_name': 'real_signup_derivgo'
      },
    );
  }

  /// Tracks system error has happened,
  /// like no connection to the server and etc.
  void logError(String error) {
    DerivRudderstack().track(
      eventName: 'ce_real_account_signup_form',
      properties: <String, dynamic>{
        'action': 'other_error',
        'error_message': error,
        'form_source': 'mobile_derivgo',
        'form_name': 'common_events_derivgo'
      },
    );
  }

  /// Tracks when the signup flow is finished.
  void logRealSignUpFinished() {
    DerivRudderstack().track(
      eventName: 'ce_real_account_signup_form',
      properties: <String, dynamic>{
        'action': 'real_signup_finished',
        'form_source': 'mobile_derivgo',
        'form_name': 'real_signup_derivgo'
      },
    );
  }

  /// --------- ce_deriv_go_trade_form ---------------
  /// Tracks when user opens trade page
  ///
  /// tradeType: Trade type name (e.g. 'Multipliers', 'Accumulators')
  /// asset: Asset name (e.g. 'EURUSD', 'BTCUSD')
  /// chartType: Chart type name (e.g. 'area', 'candle', 'worm')
  /// actionTriggerType: Action trigger type (e.g. trade_page_cta, back_to_trade_page, assets_choice, trade_type_choice)
  void logTradePageOpened({
    required String tradeType,
    required String market,
    required String chartType,
    required String actionTriggerType,
  }) {
    DerivRudderstack().track(
        eventName: 'ce_deriv_go_trade_form',
        properties: <String, dynamic>{
          'action': 'open_trade_page',
          'form_name': 'ce_deriv_go_trade_form',
          'market_name': market,
          'trade_type_name': tradeType,
          'chart_type_name': chartType,
          'action_trigger_type': actionTriggerType,
        });
  }

  /// Tracks when user opens big chart page
  /// tradeType: Trade type name (e.g. 'Multipliers', 'Accumulators')
  /// asset: Asset name (e.g. 'EURUSD', 'BTCUSD')
  /// chartType: Chart type name (e.g. 'area', 'candle', 'worm')
  /// actionTriggerType: Action trigger type (e.g. chart_double_click, bigchart_switcher_cta, chart_types_settings_cta)
  void logBigChartPageOpened({
    required String tradeType,
    required String market,
    required String chartType,
    required String actionTriggerType,
  }) {
    DerivRudderstack().track(
        eventName: 'ce_deriv_go_trade_form',
        properties: <String, dynamic>{
          'action': 'open_big_chart',
          'form_name': 'ce_deriv_go_trade_form',
          'market_name': market,
          'trade_type_name': tradeType,
          'chart_type_name': chartType,
          'action_trigger_type': actionTriggerType,
        });
  }

  /// Tracks when user buys a contract
  /// tradeType: Trade type name (e.g. 'Multipliers', 'Accumulators')
  /// asset: Asset name (e.g. 'EURUSD', 'BTCUSD')
  /// chartType: Chart type name (e.g. 'area', 'candle', 'worm')
  /// currentPage: Current page name (e.g. 'trade_page', 'big_chart_page')
  void logContractBought({
    required String market,
    required String chartType,
    required String tradeType,
    required String currentPage,
  }) {
    DerivRudderstack().track(
        eventName: 'ce_deriv_go_trade_form',
        properties: <String, dynamic>{
          'action': 'run_contract',
          'form_name': 'ce_deriv_go_trade_form',
          'market_name': market,
          'chart_type_name': chartType,
          'trade_type_name': tradeType,
          'subform_name': currentPage,
        });
  }

  ///User clicks the "Get real account" button
  void logGetRealAccountClicked() {
    DerivRudderstack().track(
        eventName: 'ce_traders_hub_home_page',
        properties: <String, dynamic>{
          'action': 'click_get_real_account',
          'form_name': 'ce_traders_hub_home_page',
          'form_source': 'mobile_derivgo',
          'element': 'button',
          'location': 'top-right',
          'label': 'Get real account',
        });
  }

  ///User clicks the chat icon in the top menu bar
  void logChatClicked() {
    DerivRudderstack().track(
        eventName: 'ce_traders_hub_home_page',
        properties: <String, dynamic>{
          'action': 'click_chat',
          'form_name': 'ce_traders_hub_home_page',
          'form_source': 'mobile_derivgo',
          'element': 'icon',
          'location': 'top-right',
          'label': 'Chat'
        });
  }

  ///User clicks the notifications icon in the top menu bar
  void logNotificationsClicked() {
    DerivRudderstack().track(
        eventName: 'ce_traders_hub_home_page',
        properties: <String, dynamic>{
          'action': 'click_notifications',
          'form_name': 'ce_traders_hub_home_page',
          'form_source': 'mobile_derivgo',
          'element': 'icon',
          'location': 'top-right',
          'label': 'Notifications'
        });
  }

  ///User selects the "Accumulators" trade type
  void logAccumulatorsClicked() {
    DerivRudderstack().track(
        eventName: 'ce_traders_hub_home_page',
        properties: <String, dynamic>{
          'action': 'click_accumulators',
          'form_name': 'ce_traders_hub_home_page',
          'form_source': 'mobile_derivgo',
          'element': 'trade_type',
          'label': 'Accumulators',
          'description':
              'Amplify potential profits with up to 5% compounding growth per tick.'
        });
  }

  ///User selects the "Multipliers" trade type
  void logMultipliersClicked() {
    DerivRudderstack().track(
        eventName: 'ce_traders_hub_home_page',
        properties: <String, dynamic>{
          'action': 'click_multipliers',
          'form_name': 'ce_traders_hub_home_page',
          'form_source': 'mobile_derivgo',
          'element': 'trade_type',
          'label': 'Multipliers',
          'description':
              'Multipliers let you trade with leverage and limit your risk to your stake.'
        });
  }

  ///User selects the "Deriv X" option for CFDs
  void logDerivXClicked() {
    DerivRudderstack().track(
        eventName: 'ce_traders_hub_home_page',
        properties: <String, dynamic>{
          'action': 'click_deriv_x',
          'form_name': 'ce_traders_hub_home_page',
          'form_source': 'mobile_derivgo',
          'element': 'CFD_option',
          'label': 'Deriv X',
          'description': 'CFDs on a customisable trading platform.'
        });
  }

  ///User clicks the "Hub" button in bottom navigation
  void logBottomNavHubClicked() {
    DerivRudderstack().track(
        eventName: 'ce_traders_hub_home_page',
        properties: <String, dynamic>{
          'action': 'click_bottom_nav_hub',
          'form_name': 'ce_traders_hub_home_page',
          'form_source': 'mobile_derivgo',
          'element': 'bottom_nav',
          'label': 'Hub'
        });
  }

  ///User clicks the "Markets" button in bottom navigation
  void logBottomNavMarketsClicked() {
    DerivRudderstack().track(
        eventName: 'ce_traders_hub_home_page',
        properties: <String, dynamic>{
          'action': 'click_bottom_nav_markets',
          'form_name': 'ce_traders_hub_home_page',
          'form_source': 'mobile_derivgo',
          'element': 'bottom_nav',
          'label': 'Markets'
        });
  }

  ///User clicks the "Trade" button in bottom navigation
  void logBottomNavTradeClicked() {
    DerivRudderstack().track(
        eventName: 'ce_traders_hub_home_page',
        properties: <String, dynamic>{
          'action': 'click_bottom_nav_trade',
          'form_name': 'ce_traders_hub_home_page',
          'form_source': 'mobile_derivgo',
          'element': 'bottom_nav',
          'label': 'Trade'
        });
  }

  ///User clicks the "Positions" button in bottom navigation
  void logBottomNavPositionsClicked() {
    DerivRudderstack().track(
        eventName: 'ce_traders_hub_home_page',
        properties: <String, dynamic>{
          'action': 'click_bottom_nav_positions',
          'form_name': 'ce_traders_hub_home_page',
          'form_source': 'mobile_derivgo',
          'element': 'bottom_nav',
          'label': 'Positions'
        });
  }

  ///User clicks the "Account" button in bottom navigation
  void logBottomNavAccountClicked() {
    DerivRudderstack().track(
        eventName: 'ce_traders_hub_home_page',
        properties: <String, dynamic>{
          'action': 'click_bottom_nav_account',
          'form_name': 'ce_traders_hub_home_page',
          'form_source': 'mobile_derivgo',
          'element': 'bottom_nav',
          'label': 'Account'
        });
  }
}
