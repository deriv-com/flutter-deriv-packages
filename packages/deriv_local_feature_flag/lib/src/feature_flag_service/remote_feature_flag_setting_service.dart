import '../../../../flutter-deriv-packages/packages/deriv_local_feature_flag/lib/src/base_feature_flag_setting_service.dart';
import 'package:flutter_multipliers/config/feature_flags.dart';

/// Implementation of [BaseFeatureFlagService] using Growth book SDK.
class RemoteFeatureFlagSettingService implements BaseFeatureFlagService {
  /// Create Singleton instance of [RemoteFeatureFlagSettingService].
  factory RemoteFeatureFlagSettingService() =>
      _instance ??= RemoteFeatureFlagSettingService._();

  RemoteFeatureFlagSettingService._();

  static RemoteFeatureFlagSettingService? _instance;

  @override
  Future<void> getSetting(Feature feature) async {
    // TODO(Zohreh): (Feature Flag) Implement this method using Growth book SDK.
  }

  @override
  Future<void> setSetting({
    required Feature feature,
    required bool featureSetting,
  }) async {
    // TODO(Zohreh): (Feature Flag) Implement this method using Growth book SDK.
  }
}
