import 'package:analytics/sdk/rudderstack/sdk/deriv_rudderstack_sdk.dart';
import 'package:deriv_passkeys/src/core/constants/analytics_actions_enums.dart';
import 'package:deriv_passkeys/src/core/constants/tracking_event_params_helper.dart';
import 'package:deriv_passkeys/src/domain/base_repositories/base_passkey_analytics_repository.dart';

/// [AnalyticsRepository] is an implementation of [BasePasskeyAnalyticsRepository].
class AnalyticsRepository extends BasePasskeyAnalyticsRepository {
  /// Constructor for [AnalyticsRepository].
  AnalyticsRepository._(
    this._appId, {
    required this.derivRudderstack,
  });

  static AnalyticsRepository? _instance;

  /// Singleton instance of [AnalyticsRepository].
  static AnalyticsRepository get instance =>
      _instance ??= throw Exception('AnalyticsRepository is not initialized');

  /// Instance of [DerivRudderstack].
  final DerivRudderstack derivRudderstack;

  /// Initialize [AnalyticsRepository].
  static void init(
    String appId, {
    required DerivRudderstack derivRudderstack,
  }) =>
      _instance = AnalyticsRepository._(
        appId,
        derivRudderstack: derivRudderstack,
      );

  String? _mainFormName;

  String? _subFormName;

  /// Deriv client app ID.
  final String _appId;

  @override
  void trackOpenEffortlessLoginPage() {
    final Map<String, dynamic> trackingData = getEffortlessLoginTrackingParams(
      EffortlessPageActions.openEffortlessLoginPage,
    );

    _mainFormName = trackingData['params']['form_name'];
    _subFormName = 'passkey_effortless';

    _addAppName(trackingData);

    derivRudderstack.track(
      eventName: trackingData['event_name'],
      properties: trackingData['params'],
    );
  }

  @override
  void trackCloseEffortlessLoginPage() {
    final Map<String, dynamic> trackingData = getEffortlessLoginTrackingParams(
      EffortlessPageActions.closeEffortlessLoginPage,
    );

    _addAppName(trackingData);

    derivRudderstack.track(
      eventName: trackingData['event_name'],
      properties: trackingData['params'],
    );
  }

  @override
  void trackMaybeLater() {
    final Map<String, dynamic> trackingData = getEffortlessLoginTrackingParams(
      EffortlessPageActions.maybeLater,
    );

    _addAppName(trackingData);

    derivRudderstack.track(
      eventName: trackingData['event_name'],
      properties: trackingData['params'],
    );
  }

  @override
  void trackOpenLearnMorePage() {
    final Map<String, dynamic> trackingData = getLearnMoreTrackingParams(
      LearnMorePageActions.openLearnMorePage,
      _mainFormName ?? 'testing_main_form',
    );

    _subFormName = 'passkey_info';

    _addAppName(trackingData);

    derivRudderstack.track(
      eventName: trackingData['event_name'],
      properties: trackingData['params'],
    );
  }

  @override
  void trackCloseLearnMorePage() {
    final Map<String, dynamic> trackingData = getLearnMoreTrackingParams(
      LearnMorePageActions.closeLearnMorePage,
      _mainFormName ?? 'testing_main_form',
    );

    if (_mainFormName == null) {
      _mainFormName = 'testing_main_form';
    } else {
      _subFormName = _mainFormName!.contains('account_settings')
          ? 'passkey_main'
          : 'passkey_effortless';
    }

    _addAppName(trackingData);

    derivRudderstack.track(
      eventName: trackingData['event_name'],
      properties: trackingData['params'],
    );
  }

  @override
  void trackOpenManagePasskeysPage() {
    final Map<String, dynamic> trackingData = getManagePasskeysTrackingParams(
      ManagePasskeysPageActions.openManagePasskeysPage,
    );

    _mainFormName = trackingData['params']['form_name'];
    _subFormName = 'passkey_main';

    _addAppName(trackingData);

    derivRudderstack.track(
      eventName: trackingData['event_name'],
      properties: trackingData['params'],
    );
  }

  @override
  void trackCloseManagePasskeysPage() {
    final Map<String, dynamic> trackingData = getManagePasskeysTrackingParams(
      ManagePasskeysPageActions.closeManagePasskeysPage,
    );

    _addAppName(trackingData);

    derivRudderstack.track(
      eventName: trackingData['event_name'],
      properties: trackingData['params'],
    );
  }

  @override
  void trackCreatePasskey() {
    final Map<String, dynamic> trackingData = getCreatePasskeyTrackingParams(
      CreatePasskeyFlowActions.createPasskey,
      mainFormName: _mainFormName,
      subFormName: _subFormName,
    );

    _addAppName(trackingData);

    derivRudderstack.track(
      eventName: trackingData['event_name'],
      properties: trackingData['params'],
    );
  }

  @override
  void trackCreatePasskeySuccess() {
    final Map<String, dynamic> trackingData = getCreatePasskeyTrackingParams(
      CreatePasskeyFlowActions.createPasskeySuccess,
      mainFormName: _mainFormName,
      subFormName: _subFormName,
    );

    _addAppName(trackingData);

    derivRudderstack.track(
      eventName: trackingData['event_name'],
      properties: trackingData['params'],
    );
  }

  @override
  void trackPasskeyError(String errorMessage) {
    final Map<String, dynamic> trackingData = getCreatePasskeyTrackingParams(
      CreatePasskeyFlowActions.error,
      mainFormName: _mainFormName,
      subFormName: _subFormName,
      errorMessage: errorMessage,
    );

    _addAppName(trackingData);

    derivRudderstack.track(
      eventName: trackingData['event_name'],
      properties: trackingData['params'],
    );
  }

  @override
  void trackContinueTrading() {
    final Map<String, dynamic> trackingData = getCreatePasskeyTrackingParams(
      CreatePasskeyFlowActions.continueTrading,
      mainFormName: _mainFormName,
      subFormName: _subFormName,
    );

    _addAppName(trackingData);

    derivRudderstack.track(
      eventName: trackingData['event_name'],
      properties: trackingData['params'],
    );
  }

  @override
  void trackAddMorePasskeys() {
    final Map<String, dynamic> trackingData = getCreatePasskeyTrackingParams(
      CreatePasskeyFlowActions.addMorePasskeys,
      mainFormName: _mainFormName,
      subFormName: _subFormName,
    );

    _addAppName(trackingData);

    derivRudderstack.track(
      eventName: trackingData['event_name'],
      properties: trackingData['params'],
    );
  }

  @override
  void trackRenamePasskey() {
    final Map<String, dynamic> trackingData = getRenamePasskeyTrackingParams(
      RenamePasskeyFlowActions.renamePasskey,
    );

    _addAppName(trackingData);

    derivRudderstack.track(
      eventName: trackingData['event_name'],
      properties: trackingData['params'],
    );
  }

  @override
  void trackCancelRenamePasskey() {
    final Map<String, dynamic> trackingData = getRenamePasskeyTrackingParams(
      RenamePasskeyFlowActions.cancelRenamePasskey,
    );

    _addAppName(trackingData);

    derivRudderstack.track(
      eventName: trackingData['event_name'],
      properties: trackingData['params'],
    );
  }

  @override
  void trackRenamePasskeySuccess() {
    final Map<String, dynamic> trackingData = getRenamePasskeyTrackingParams(
      RenamePasskeyFlowActions.renamePasskeySuccess,
    );

    _addAppName(trackingData);

    derivRudderstack.track(
      eventName: trackingData['event_name'],
      properties: trackingData['params'],
    );
  }

  void _addAppName(Map<String, dynamic> data) {
    data['params']['form_name'] += _appId == '23789'
        ? 'derivgo'
        : _appId == '1408'
            ? 'p2p'
            : 'unsupported';
  }
}
