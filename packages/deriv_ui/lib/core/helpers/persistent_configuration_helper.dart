import 'dart:convert';

import 'package:flutter_multipliers/core/helpers/helpers.dart';
import 'package:flutter_multipliers/core/helpers/secure_storage/base_secure_storage.dart';
import 'package:flutter_multipliers/core/helpers/secure_storage/secure_storage.dart';
import 'package:flutter_multipliers/core/utils/pref_service.dart';
import 'package:flutter_multipliers/features/trade/models/trade_proposal_request_model.dart';

/// A class for retrieving and storing persistence configuration data in shared preferences.
class PersistentConfigurationHelper {
  /// Initializes shared preferences storage.
  PersistentConfigurationHelper({this.secureStorage}) {
    secureStorage ??= SecureStorage();
  }

  static const String _stakeAmountKey = 'stakeAmount';
  static const String _multiplierKey = 'multiplier';
  static const String _cancellationKey = 'cancellation';
  static const String _takeProfitKey = 'takeProfit';
  static const String _stopLossKey = 'stopLoss';
  static const String _proposalRequestKey = 'proposalRequest';

  static const String _firstTimeFeedbackReminderFlagKey =
      'FEEDBACK_FIRST_TIME_REMINDER_FLAG_KEY';
  static const String _feedbackReminderLatestShownDateKey =
      'FEEDBACK_REMINDER_SHOWN_DATE_KEY';
  static const String _shouldShowFeedbackReminderKey =
      'SHOULD_SHOW_FEEDBACK_REMINDER_KEY';

  /// Secure Storage instance for secure data.
  BaseSecureStorage? secureStorage;

  Future<String> get _proposalRequestPreferenceKey =>
      getPreferenceKey(_proposalRequestKey);

  /// Gets the value for first time feedback reminder flag.
  Future<bool?> getFirstTimeFeedbackReminderFlag() async => PrefService.getBool(
        await getPreferenceKey(
          _firstTimeFeedbackReminderFlagKey,
          isUserBase: true,
          clearOnLogout: false,
          secureStorage: secureStorage,
        ),
      );

  /// Gets the value of user default for showing feedback reminder.
  Future<bool?> getShouldShowFeedbackReminder() async => PrefService.getBool(
        await getPreferenceKey(
          _shouldShowFeedbackReminderKey,
          isUserBase: true,
          clearOnLogout: false,
          secureStorage: secureStorage,
        ),
      );

  /// Gets the value for latest feedback reminder shown date.
  Future<DateTime?> getFeedbackReminderShownDate() async {
    final int? _millisecondsSinceEpoch = PrefService.getInt(
      await getPreferenceKey(
        _feedbackReminderLatestShownDateKey,
        isUserBase: true,
        clearOnLogout: false,
        secureStorage: secureStorage,
      ),
    );

    return _millisecondsSinceEpoch == null
        ? null
        : DateTime.fromMillisecondsSinceEpoch(_millisecondsSinceEpoch);
  }

  /// Stores value for first time feedback reminder flag in preferences.
  Future<void> storeFirstTimeFeedbackReminderFlag(
          {required bool value}) async =>
      PrefService.setBool(
        key: await getPreferenceKey(
          _firstTimeFeedbackReminderFlagKey,
          isUserBase: true,
          clearOnLogout: false,
          secureStorage: secureStorage,
        ),
        value: value,
      );

  /// Stores value for latest feedback reminder shown date.
  Future<void> storeFeedbackReminderShownDate(DateTime date) async =>
      PrefService.setInt(
        await getPreferenceKey(
          _feedbackReminderLatestShownDateKey,
          isUserBase: true,
          clearOnLogout: false,
          secureStorage: secureStorage,
        ),
        date.millisecondsSinceEpoch,
      );

  /// Stores user default for showing feedback reminder.
  Future<void> storeShouldShowFeedbackReminder({required bool value}) async =>
      PrefService.setBool(
        key: await getPreferenceKey(
          _shouldShowFeedbackReminderKey,
          isUserBase: true,
          clearOnLogout: false,
          secureStorage: secureStorage,
        ),
        value: value,
      );

  /// Stores stake [amount] in preferences.
  Future<void> storeSelectedStakeAmount(double amount) async =>
      PrefService.setDouble(await getPreferenceKey(_stakeAmountKey), amount);

  /// Stores an instance of [TradeProposalRequestModel] in preferences.
  Future<void> storeProposalRequest(TradeProposalRequestModel? request) async {
    final String key = await _proposalRequestPreferenceKey;

    if (request == null) {
      await _removeByKey(key);
    } else {
      await PrefService.setString(key, jsonEncode(request.toJson()));
    }
  }

  /// Gets latest saved [TradeProposalRequestModel].
  Future<TradeProposalRequestModel?> getProposalRequest() async {
    final String key = await _proposalRequestPreferenceKey;
    final String? savedRequest = PrefService.getString(key);

    return savedRequest != null
        ? TradeProposalRequestModel.fromJson(jsonDecode(savedRequest))
        : null;
  }

  /// Gets stake amount.
  Future<double?> getStakeAmount() async =>
      PrefService.getDouble(await getPreferenceKey(_stakeAmountKey));

  /// Stores [multiplier] in preferences.
  Future<void> storeSelectedMultiplier(int multiplier) async =>
      PrefService.setInt(await getPreferenceKey(_multiplierKey), multiplier);

  /// Gets multiplier value.
  Future<int?> getMultiplier() async =>
      PrefService.getInt(await getPreferenceKey(_multiplierKey));

  /// Stores [cancellation] data in preferences.
  Future<void> storeSelectedCancellation(String? cancellation) async {
    if (cancellation != null) {
      await PrefService.setString(
        await getPreferenceKey(_cancellationKey),
        cancellation,
      );
    } else {
      await removeCancellationFromPref();
    }
  }

  /// Gets cancellation value.
  Future<String?> getCancellation() async =>
      PrefService.getString(await getPreferenceKey(_cancellationKey));

  /// Removes cancellation data from preferences.
  Future<void> removeCancellationFromPref() async =>
      _removeByKey(await getPreferenceKey(_cancellationKey));

  /// Stores [takeProfit] data in preferences.
  Future<void> storeSelectedTakeProfit(double takeProfit) async =>
      PrefService.setDouble(await getPreferenceKey(_takeProfitKey), takeProfit);

  /// Gets takeProfit value.
  Future<double?> getTakeProfit() async =>
      PrefService.getDouble(await getPreferenceKey(_takeProfitKey));

  /// Removes takeProfit data from preferences.
  Future<void> removeTakeProfitFromPref() async =>
      _removeByKey(await getPreferenceKey(_takeProfitKey));

  /// Removes takeProfit and stop loss data from preferences.
  Future<void> removeTakeProfitStopLossFromPref() async {
    await removeTakeProfitFromPref();
    await removeStopLossFromPref();
  }

  /// Stores [stopLoss] data in preferences.
  Future<void> storeSelectedStopLoss(double stopLoss) async =>
      PrefService.setDouble(await getPreferenceKey(_stopLossKey), stopLoss);

  /// Gets stopLoss value.
  Future<double?> getStopLoss() async =>
      PrefService.getDouble(await getPreferenceKey(_stopLossKey));

  /// Removes stopLoss data from preferences.
  Future<void> removeStopLossFromPref() async =>
      _removeByKey(await getPreferenceKey(_stopLossKey));

  Future<void> _removeByKey(String key) async {
    if (_keyExists(key)) {
      await PrefService.remove(_getItemKey(key));
    }
  }

  bool _keyExists(String key) => PrefService.getKeys()?.contains(key) ?? false;

  String _getItemKey(String key) =>
      PrefService.getKeys()!.firstWhere((String item) => item.contains(key));
}
