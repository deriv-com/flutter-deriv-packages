import 'package:deriv_passkeys/src/core/constants/analytics_actions_enums.dart';
import 'package:deriv_passkeys/src/core/constants/tracking_event_params_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('getTrackingParams tests:\n\t', () {
    group('efforless login flow -> ', () {
      test('should return correct params for openEffortlessLoginPage', () {
        debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

        final Map<String, dynamic> result = getEffortlessLoginTrackingParams(
          EffortlessPageActions.openEffortlessLoginPage,
        );

        expect(result, <String, Object>{
          'event_name': 'open',
          'params': <String, dynamic>{
            'form_name': 'ce_passkey_effortless_form_',
            'operating_system': 'IOS',
          },
        });
      });

      test('should return correct params for closeEffortlessLoginPage', () {
        debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

        final Map<String, dynamic> result = getEffortlessLoginTrackingParams(
          EffortlessPageActions.closeEffortlessLoginPage,
        );

        expect(result, <String, Object>{
          'event_name': 'close',
          'params': <String, dynamic>{
            'form_name': 'ce_passkey_effortless_form_',
            'operating_system': 'IOS',
          },
        });
      });

      test('should return correct params for maybeLater', () {
        debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

        final Map<String, dynamic> result = getEffortlessLoginTrackingParams(
          EffortlessPageActions.maybeLater,
        );

        expect(result, <String, Object>{
          'event_name': 'maybe_later',
          'params': <String, dynamic>{
            'form_name': 'ce_passkey_effortless_form_',
            'operating_system': 'IOS',
          },
        });
      });
    });

    group('tracking learn more page actions ->', () {
      test('should return correct params for openLearnMorePage', () {
        debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

        final Map<String, dynamic> result = getLearnMoreTrackingParams(
          LearnMorePageActions.openLearnMorePage,
          'main_form_name',
        );

        expect(result, <String, Object>{
          'event_name': 'info_open',
          'params': <String, dynamic>{
            'form_name': 'main_form_name',
            'operating_system': 'IOS',
          },
        });
      });

      test('should return correct params for closeLearnMorePage', () {
        debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

        final Map<String, dynamic> result = getLearnMoreTrackingParams(
          LearnMorePageActions.closeLearnMorePage,
          'main_form_name',
        );

        expect(result, <String, Object>{
          'event_name': 'info_back',
          'params': <String, dynamic>{
            'form_name': 'main_form_name',
            'operating_system': 'IOS',
          },
        });
      });
    });

    group('tracking manage passkeys page actions ->', () {
      test('should return correct params for openManagePasskeysPage', () {
        debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

        final Map<String, dynamic> result = getManagePasskeysTrackingParams(
          ManagePasskeysPageActions.openManagePasskeysPage,
        );

        expect(result, <String, Object>{
          'event_name': 'open',
          'params': <String, dynamic>{
            'form_name': 'ce_passkey_account_settings_form_',
            'operating_system': 'IOS',
          },
        });
      });

      test('should return correct params for closeManagePasskeysPage', () {
        debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

        final Map<String, dynamic> result = getManagePasskeysTrackingParams(
          ManagePasskeysPageActions.closeManagePasskeysPage,
        );

        expect(result, <String, Object>{
          'event_name': 'close',
          'params': <String, dynamic>{
            'form_name': 'ce_passkey_account_settings_form_',
            'operating_system': 'IOS',
          },
        });
      });
    });

    group('tracking create passkey actions ->', () {
      test('should return correct params for createPasskey', () {
        debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

        final Map<String, dynamic> result = getCreatePasskeyTrackingParams(
          CreatePasskeyFlowActions.createPasskey,
          mainFormName: 'main_form_name',
          subFormName: 'sub_form_name',
        );

        expect(result, <String, Object>{
          'event_name': 'create_passkey_started',
          'params': <String, dynamic>{
            'form_name': 'main_form_name',
            'subform_name': 'sub_form_name',
            'operating_system': 'IOS',
          },
        });
      });

      test('should return correct params for createPasskeySuccess', () {
        debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

        final Map<String, dynamic> result = getCreatePasskeyTrackingParams(
          CreatePasskeyFlowActions.createPasskeySuccess,
          mainFormName: 'main_form_name',
          subFormName: 'sub_form_name',
        );

        expect(result, <String, Object>{
          'event_name': 'create_passkey_finished',
          'params': <String, dynamic>{
            'form_name': 'main_form_name',
            'subform_name': 'sub_form_name',
            'operating_system': 'IOS',
          },
        });
      });

      test('should return correct params for error', () {
        debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

        final Map<String, dynamic> result = getCreatePasskeyTrackingParams(
          CreatePasskeyFlowActions.error,
          mainFormName: 'main_form_name',
          subFormName: 'sub_form_name',
          errorMessage: 'error_message',
        );

        expect(result, <String, Object>{
          'event_name': 'error',
          'params': <String, dynamic>{
            'form_name': 'main_form_name',
            'subform_name': 'sub_form_name',
            'error_message': 'error_message',
            'operating_system': 'IOS',
          },
        });
      });

      test('should return correct params for continueTrading', () {
        debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

        final Map<String, dynamic> result = getCreatePasskeyTrackingParams(
          CreatePasskeyFlowActions.continueTrading,
          mainFormName: 'main_form_name',
          subFormName: 'sub_form_name',
        );

        expect(result, <String, Object>{
          'event_name': 'create_passkey_continue_trading',
          'params': <String, dynamic>{
            'form_name': 'main_form_name',
            'subform_name': 'sub_form_name',
            'operating_system': 'IOS',
          },
        });
      });

      test('should return correct params for addMorePasskeys', () {
        debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

        final Map<String, dynamic> result = getCreatePasskeyTrackingParams(
          CreatePasskeyFlowActions.addMorePasskeys,
          mainFormName: 'main_form_name',
          subFormName: 'sub_form_name',
        );

        expect(result, <String, Object>{
          'event_name': 'create_passkey_add_more_passkeys',
          'params': <String, dynamic>{
            'form_name': 'main_form_name',
            'subform_name': 'sub_form_name',
            'operating_system': 'IOS',
          },
        });
      });
    });

    group('tracking rename passkey page actions ->', () {
      test('should return correct params for renamePasskey', () {
        debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

        final Map<String, dynamic> result = getRenamePasskeyTrackingParams(
          RenamePasskeyFlowActions.renamePasskey,
        );

        expect(result, <String, Object>{
          'event_name': 'passkey_rename_open',
          'params': <String, dynamic>{
            'form_name': 'ce_passkey_account_settings_form_',
            'operating_system': 'IOS',
          },
        });
      });

      test('should return correct params for cancelRenamePasskey', () {
        debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

        final Map<String, dynamic> result = getRenamePasskeyTrackingParams(
          RenamePasskeyFlowActions.cancelRenamePasskey,
        );

        expect(result, <String, Object>{
          'event_name': 'passkey_rename_back',
          'params': <String, dynamic>{
            'form_name': 'ce_passkey_account_settings_form_',
            'operating_system': 'IOS',
          },
        });
      });

      test('should return correct params for renamePasskeySuccess', () {
        debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

        final Map<String, dynamic> result = getRenamePasskeyTrackingParams(
          RenamePasskeyFlowActions.renamePasskeySuccess,
        );

        expect(result, <String, Object>{
          'event_name': 'passkey_rename_success',
          'params': <String, dynamic>{
            'form_name': 'ce_passkey_account_settings_form_',
            'operating_system': 'IOS',
          },
        });
      });
    });
  });
}
