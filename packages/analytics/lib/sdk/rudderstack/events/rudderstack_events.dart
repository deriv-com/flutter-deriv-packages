import 'package:analytics/sdk/rudderstack/core/rudderstack_configuration.dart';
import 'package:analytics/sdk/rudderstack/models/user_info.dart';
import 'package:analytics/sdk/rudderstack/sdk/deriv_rudderstack_sdk.dart';

/// Class which hold events which should be monitored.
class DerivRudderstackEvents {
  /// Creates a new [DerivRudderstackEvents] instance.
  factory DerivRudderstackEvents() => _instance;

  DerivRudderstackEvents._internal();

  static final DerivRudderstackEvents _instance =
      DerivRudderstackEvents._internal();

  ///Set ups Rudderstack connection.
  void setup({required String dataPlaneUrl, required String writeKey}) {
    DerivRudderstack().setup(
      RudderstackConfiguration(dataPlaneUrl: dataPlaneUrl, writeKey: writeKey),
    );
  }

  // --------- common_events ---------------
  /// Tracks system error has happened,
  /// like no connection to the server and etc.
  void logError(String error) {
    DerivRudderstack().track(
      eventName: 'error',
      properties: <String, dynamic>{
        'action': 'other_error',
        'error_message': error,
        'form_source': 'mobile_derivgo',
        'form_name': 'common_events_derivgo'
      },
    );
  }

  /// Tracks userId.
  void logIdentifyUser({required UserInfo userInfo}) {
    DerivRudderstack().identify(userInfo: userInfo);
  }

  /// Tracks system error has happened,
  /// like no connection to the server and etc.
  void logAccountInfo({
    String? accountType,
    String? countryResidence,
    String? language,
  }) {
    DerivRudderstack().track(
      eventName: 'account_info',
      properties: <String, dynamic>{
        'action': 'account_info',
        'account_type': '$accountType',
        'country_residence': '$countryResidence',
        'language': '$language',
        'form_source': 'mobile_derivgo',
        'form_name': 'common_events_derivgo'
      },
    );
  }

  // --------- ce_virtual_signup_form ---------------
  /// Captures app_open event when the app is opened.
  void logSignupOpened() {
    DerivRudderstack().track(
      eventName: 'ce_virtual_signup_form',
      properties: <String, dynamic>{
        'action': 'open',
        'form_source': 'mobile_derivgo',
        'form_name': 'virtual_signup_derivgo'
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
  void logSignUpDone(String signupProvider, [int? userId]) {
    DerivRudderstack().identify(userInfo: UserInfo(userId: userId ?? 0));
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
  void logSignUpPageAction(
    String signupProvider, [
    bool? isToggleOn,
    String? referralCode,
  ]) {
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

  // --------- ce_real_account_signup_form ---------------
  /// Tracks when the real signup form opened.
  void logOpenRealSignUp() {
    DerivRudderstack().track(
      eventName: 'ce_real_account_signup_form',
      properties: <String, dynamic>{
        'action': 'open',
        'form_source': 'mobile_derivgo',
        'form_name': 'real_account_signup_derivgo'
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
      properties: <String, dynamic>{
        'action': 'step_passed',
        'step_codename': stepCodename,
        'step_num': stepNum,
        'user_choice': userChoice,
        'form_source': 'mobile_derivgo',
        'form_name': 'real_account_signup_derivgo'
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
        'form_name': 'real_account_signup_derivgo'
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
        'form_name': 'real_account_signup_derivgo'
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
        'form_name': 'real_account_signup_derivgo'
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
        'form_name': 'real_account_signup_derivgo'
      },
    );
  }

  // --------- ce_deriv_go_trade_form ---------------
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
    required String ctaName,
    required String contractId,
    required String deviceOrientation,
    int numberOfTrades = 1,
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
          'contract_id': contractId,
          'contract_cta_name': ctaName,
          'number_of_trades ': numberOfTrades,
          'device_orientation': deviceOrientation,
        });
  }

  /// Tracks when user close a contract.
  void logContractClosed({
    required String market,
    required String chartType,
    required String tradeType,
    required String currentPage,
    required String ctaName,
    required String contractId,
    required String deviceOrientation,
    int numberOfTrades = 1,
  }) {
    DerivRudderstack().track(
        eventName: 'ce_deriv_go_trade_form',
        properties: <String, dynamic>{
          'action': 'close_contract',
          'form_name': 'ce_deriv_go_trade_form',
          'market_name': market,
          'chart_type_name': chartType,
          'trade_type_name': tradeType,
          'subform_name': currentPage,
          'contract_cta_name': ctaName,
          'contract_id': contractId,
          'number_of_trades ': numberOfTrades,
          'device_orientation': deviceOrientation,
        });
  }

  // ------------ ce_indicators_types_form ---------------

  /// Track when user opens indicators bottom sheet.
  void logOpenIndicatorTypesBottomSheet() {
    DerivRudderstack().track(
      eventName: 'ce_indicators_types_form',
      properties: <String, dynamic>{
        'action': 'open',
        'form_name': 'indicators_types_form_derivgo',
        'form_source': 'mobile_derivgo',
      },
    );
  }

  /// Track when user closes indicators bottom sheet.
  void logCloseIndicatorTypesBottomSheet() {
    DerivRudderstack().track(
      eventName: 'ce_indicators_types_form',
      properties: <String, dynamic>{
        'action': 'close',
        'form_name': 'indicators_types_form_derivgo',
        'form_source': 'mobile_derivgo',
      },
    );
  }

  /// Track when user clicks on indicator type to add the indicator.
  ///
  ///* indicatorTypeName: Indicator type name (e.g. 'MA', 'RSI' , 'MACD' , 'BB')
  ///* categoryName: Indicator category name (e.g. 'Momentum', 'volatility' , 'moving averages')
  void logAddIndicatorByClickIndicatorType(
    String indicatorTypeName,
    String categoryName,
  ) {
    DerivRudderstack().track(
      eventName: 'ce_indicators_types_form',
      properties: <String, dynamic>{
        'action': 'add_active',
        'indicator_type_name': indicatorTypeName,
        'indicators_category_name': categoryName,
        'subform_name': 'indicators_type',
        'form_name': 'indicators_types_form_derivgo',
        'form_source': 'mobile_derivgo',
      },
    );
  }

  /// Track when user clicks on indicator info `Add` button to add the indicator.
  ///
  ///* indicatorTypeName: Indicator type name (e.g. 'MA', 'RSI' , 'MACD' , 'BB')
  ///* categoryName: Indicator category name (e.g. 'Momentum', 'volatility' , 'moving averages')
  void logAddIndicatorByClickAddOnIndicatorInfo(
    String indicatorTypeName,
    String categoryName,
  ) {
    DerivRudderstack().track(
      eventName: 'ce_indicators_types_form',
      properties: <String, dynamic>{
        'action': 'add_active',
        'indicator_type_name': indicatorTypeName,
        'indicators_category_name': categoryName,
        'subform_name': 'indicators_info',
        'form_name': 'indicators_types_form_derivgo',
        'form_source': 'mobile_derivgo',
      },
    );
  }

  /// Track when user clicks on clean all active indicator.
  void logCleanAllActiveIndicator() {
    DerivRudderstack().track(
      eventName: 'ce_indicators_types_form',
      properties: <String, dynamic>{
        'action': 'clean_all_active',
        'form_name': 'indicators_types_form_derivgo',
        'form_source': 'mobile_derivgo',
      },
    );
  }

  /// Track when user deletes active indicator from active indicators list.
  ///
  ///* indicatorTypeName: Indicator type name (e.g. 'MA', 'RSI' , 'MACD' , 'BB')
  ///* categoryName: Indicator category name (e.g. 'Momentum', 'volatility' , 'moving averages')
  void logDeleteActiveIndicator(
    String indicatorTypeName,
    String categoryName,
  ) {
    DerivRudderstack().track(
      eventName: 'ce_indicators_types_form',
      properties: <String, dynamic>{
        'action': 'delete_active',
        'indicator_type_name': indicatorTypeName,
        'indicators_category_name': categoryName,
        'subform_name': 'indicators_type',
        'form_name': 'indicators_types_form_derivgo',
        'form_source': 'mobile_derivgo',
      },
    );
  }

  /// Track when user deletes active indicator from indicator's settings.
  ///
  ///* indicatorTypeName: Indicator type name (e.g. 'MA', 'RSI' , 'MACD' , 'BB')
  ///* categoryName: Indicator category name (e.g. 'Momentum', 'volatility' , 'moving averages')
  void logDeleteActiveIndicatorFromSettings(
    String indicatorTypeName,
    String categoryName,
  ) {
    DerivRudderstack().track(
      eventName: 'ce_indicators_types_form',
      properties: <String, dynamic>{
        'action': 'delete_active',
        'indicator_type_name': indicatorTypeName,
        'indicators_category_name': categoryName,
        'subform_name': 'indicators_settings',
        'form_name': 'indicators_types_form_derivgo',
        'form_source': 'mobile_derivgo',
      },
    );
  }

  /// Track when user edits indicator's settings.
  ///
  ///* indicatorTypeName: Indicator type name (e.g. 'MA', 'RSI' , 'MACD' , 'BB')
  ///* categoryName: Indicator category name (e.g. 'Momentum', 'volatility' , 'moving averages')
  void logEditIndicatorSettings(
    String indicatorTypeName,
    String categoryName,
  ) {
    DerivRudderstack().track(
      eventName: 'ce_indicators_types_form',
      properties: <String, dynamic>{
        'action': 'edit_active',
        'indicator_type_name': indicatorTypeName,
        'indicators_category_name': categoryName,
        'form_name': 'indicators_types_form_derivgo',
        'form_source': 'mobile_derivgo',
      },
    );
  }

  /// Track when user resets indicator's settings.
  ///
  ///* indicatorTypeName: Indicator type name (e.g. 'MA', 'RSI' , 'MACD' , 'BB')
  ///* categoryName: Indicator category name (e.g. 'Momentum', 'volatility' , 'moving averages')
  void logResetIndicatorSettings(
    String indicatorTypeName,
    String categoryName,
  ) {
    DerivRudderstack().track(
      eventName: 'ce_indicators_types_form',
      properties: <String, dynamic>{
        'action': 'reset',
        'subform_name': 'indicators_settings',
        'indicator_type_name': indicatorTypeName,
        'indicators_category_name': categoryName,
        'form_name': 'indicators_types_form_derivgo',
        'form_source': 'mobile_derivgo',
      },
    );
  }

  /// Track when user opens indicator info from indicators list.
  ///
  ///* indicatorTypeName: Indicator type name (e.g. 'MA', 'RSI' , 'MACD' , 'BB')
  ///* categoryName: Indicator category name (e.g. 'Momentum', 'volatility' , 'moving averages')
  void logOpenIndicatorInfoFromIndicatorsList(
    String indicatorTypeName,
    String categoryName,
  ) {
    DerivRudderstack().track(
      eventName: 'ce_indicators_types_form',
      properties: <String, dynamic>{
        'action': 'info_open',
        'indicator_type_name': indicatorTypeName,
        'indicators_category_name': categoryName,
        'subform_name': 'indicators_type',
        'form_name': 'indicators_types_form_derivgo',
        'form_source': 'mobile_derivgo',
      },
    );
  }

  /// Track when user opens indicator info from indicator's settings.
  ///
  ///* indicatorTypeName: Indicator type name (e.g. 'MA', 'RSI' , 'MACD' , 'BB')
  ///* categoryName: Indicator category name (e.g. 'Momentum', 'volatility' , 'moving averages')
  void logOpenIndicatorInfoFromIndicatorSettings(
    String indicatorTypeName,
    String categoryName,
  ) {
    DerivRudderstack().track(
      eventName: 'ce_indicators_types_form',
      properties: <String, dynamic>{
        'action': 'info_open',
        'indicator_type_name': indicatorTypeName,
        'indicators_category_name': categoryName,
        'subform_name': 'indicators_settings',
        'form_name': 'indicators_types_form_derivgo',
        'form_source': 'mobile_derivgo',
      },
    );
  }

  /// Track when user closes indicator info.
  ///
  ///* indicatorTypeName: Indicator type name (e.g. 'MA', 'RSI' , 'MACD' , 'BB')
  ///* categoryName: Indicator category name (e.g. 'Momentum', 'volatility' , 'moving averages')
  void logCloseIndicatorInfo(
    String indicatorTypeName,
    String categoryName,
  ) {
    DerivRudderstack().track(
      eventName: 'ce_indicators_types_form',
      properties: <String, dynamic>{
        'action': 'info_close',
        'indicator_type_name': indicatorTypeName,
        'indicators_category_name': categoryName,
        'form_name': 'indicators_types_form_derivgo',
        'form_source': 'mobile_derivgo',
      },
    );
  }
}
