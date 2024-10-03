import '../../../../flutter-deriv-packages/packages/deriv_local_feature_flag/lib/src/app_setting_configuration_helper.dart';
import '../../../../flutter-deriv-packages/packages/deriv_local_feature_flag/lib/src/feature_flag_status.dart';
import '../../../../flutter-deriv-packages/packages/deriv_local_feature_flag/lib/src/base_feature_flag_setting_service.dart';
import 'package:flutter_multipliers/config/feature_flags.dart';

/// Implementation of [BaseFeatureFlagService] using shared preferences.
class LocalFeatureFlagSettingService implements BaseFeatureFlagService {
  /// Create Singleton instance of [LocalFeatureFlagSettingService].
  factory LocalFeatureFlagSettingService() =>
      _instance ??= LocalFeatureFlagSettingService._();

  LocalFeatureFlagSettingService._();

  static LocalFeatureFlagSettingService? _instance;

  /// Initializes shared preferences storage.
  static final AppSettingConfigurationHelper appSettingConfigurationHelper =
      AppSettingConfigurationHelper();

  @override
  Future<void> getSetting(Feature feature) async =>
      FeatureFlagStatus().updateFeatureStatus(
        feature,
        await appSettingConfigurationHelper.getFeatureFlagSetting(
          feature: feature,
        ),
      );

  @override
  Future<void> setSetting({
    required Feature feature,
    required bool featureSetting,
  }) async {
    FeatureFlagStatus().updateFeatureStatus(feature, featureSetting);
    await appSettingConfigurationHelper.setFeatureFlagSetting(
      feature: feature,
      featureSetting: featureSetting,
    );
  }
}
