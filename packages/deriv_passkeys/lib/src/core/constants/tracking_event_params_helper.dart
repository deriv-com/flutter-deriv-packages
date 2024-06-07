import 'package:deriv_passkeys/src/core/constants/analytics_actions_enums.dart';
import 'package:flutter/foundation.dart';

String _platform = defaultTargetPlatform == TargetPlatform.android
    ? 'Android'
    : defaultTargetPlatform == TargetPlatform.iOS
        ? 'IOS'
        : 'other';

// /// `TODO` - create docs
// Map<String, dynamic> getTrackingParams<T>(T eventName) =>
//     switch (eventName.runtimeType) {
//       EffortlessPageActions => getEffortlessFlowTrackingParams(eventName),
//       LearnMorePageActions => getLearnMoreFlowTrackingParams(eventName),
//       CreatePasskeyFlowActions => getCreatePasskeyTrackingParams(eventName),
//       RenamePasskeyFlowActions => getRenamePasskeyTrackingParams(eventName),
//       ManagePasskeysPageActions => getManagePasskeysTrackingParams(eventName),
//       _ => throw Exception('Invalid event name'),
//     };

///
Map<String, dynamic> getEffortlessLoginTrackingParams<T>(T eventName) =>
    switch (eventName) {
      EffortlessPageActions.openEffortlessLoginPage => <String, dynamic>{
          'event_name': 'open',
          'params': <String, dynamic>{
            'form_name': 'ce_passkey_effortless_form_',
            'operating_system': _platform,
          },
        },
      EffortlessPageActions.closeEffortlessLoginPage => <String, dynamic>{
          'event_name': 'close',
          'params': <String, dynamic>{
            'form_name': 'ce_passkey_effortless_form_',
            'operating_system': _platform,
          },
        },
      EffortlessPageActions.maybeLater => <String, dynamic>{
          'event_name': 'maybe_later',
          'params': <String, dynamic>{
            'form_name': 'ce_passkey_effortless_form_',
            'operating_system': _platform,
          },
        },
      _ => throw Exception('Invalid event name'),
    };

///
Map<String, dynamic> getLearnMoreTrackingParams<T>(
  T eventName,
  String mainFormName,
) =>
    switch (eventName) {
      LearnMorePageActions.openLearnMorePage => <String, dynamic>{
          'event_name': 'info_open',
          'params': <String, dynamic>{
            'form_name': mainFormName,
            'operating_system': _platform,
          },
        },
      LearnMorePageActions.closeLearnMorePage => <String, dynamic>{
          'event_name': 'info_back',
          'params': <String, dynamic>{
            'form_name': mainFormName,
            'operating_system': _platform,
          },
        },
      _ => throw Exception('Invalid event name'),
    };

///
Map<String, dynamic> getManagePasskeysTrackingParams<T>(T eventName) =>
    switch (eventName) {
      ManagePasskeysPageActions.openManagePasskeysPage => <String, dynamic>{
          'event_name': 'open',
          'params': <String, dynamic>{
            'form_name': 'ce_passkey_account_settings_form_',
            'operating_system': _platform,
          },
        },
      ManagePasskeysPageActions.closeManagePasskeysPage => <String, dynamic>{
          'event_name': 'close',
          'params': <String, dynamic>{
            'form_name': 'ce_passkey_account_settings_form_',
            'operating_system': _platform,
          },
        },
      _ => throw Exception('Invalid event name'),
    };

///
Map<String, dynamic> getCreatePasskeyTrackingParams<T>(
  T eventName, {
  String? mainFormName,
  String? subFormName,
  String? errorMessage,
}) =>
    switch (eventName) {
      CreatePasskeyFlowActions.createPasskey => <String, dynamic>{
          'event_name': 'create_passkey_started',
          'params': <String, dynamic>{
            'form_name': mainFormName,
            'subform_name': subFormName,
            'operating_system': _platform,
          },
        },
      CreatePasskeyFlowActions.createPasskeySuccess => <String, dynamic>{
          'event_name': 'create_passkey_finished',
          'params': <String, dynamic>{
            'form_name': mainFormName,
            'subform_name': subFormName,
            'operating_system': _platform,
          },
        },
      CreatePasskeyFlowActions.error => <String, dynamic>{
          'event_name': 'error',
          'params': <String, dynamic>{
            'form_name': mainFormName,
            'subform_name': subFormName,
            'operating_system': _platform,
            'error_message': errorMessage,
          },
        },
      CreatePasskeyFlowActions.continueTrading => <String, dynamic>{
          'event_name': 'create_passkey_continue_trading',
          'params': <String, dynamic>{
            'form_name': mainFormName,
            'subform_name': subFormName,
            'operating_system': _platform,
          },
        },
      CreatePasskeyFlowActions.addMorePasskeys => <String, dynamic>{
          'event_name': 'create_passkey_add_more_passkeys',
          'params': <String, dynamic>{
            'form_name': mainFormName,
            'subform_name': subFormName,
            'operating_system': _platform,
          },
        },
      _ => throw Exception('Invalid event name'),
    };

///
Map<String, dynamic> getRenamePasskeyTrackingParams<T>(T eventName) =>
    switch (eventName) {
      RenamePasskeyFlowActions.renamePasskey => <String, dynamic>{
          'event_name': 'passkey_rename_open',
          'params': <String, dynamic>{
            'form_name': 'ce_passkey_account_settings_form_',
            'operating_system': _platform,
          },
        },
      RenamePasskeyFlowActions.renamePasskeySuccess => <String, dynamic>{
          'event_name': 'passkey_rename_success',
          'params': <String, dynamic>{
            'form_name': 'ce_passkey_account_settings_form_',
            'operating_system': _platform,
          },
        },
      RenamePasskeyFlowActions.cancelRenamePasskey => <String, dynamic>{
          'event_name': 'passkey_rename_back',
          'params': <String, dynamic>{
            'form_name': 'ce_passkey_account_settings_form_',
            'operating_system': _platform,
          },
        },
      _ => throw Exception('Invalid event name'),
    };
