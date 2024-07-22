import 'package:deriv_feature_flag/feature_flag/feature_flag_config.dart';
import 'package:deriv_feature_flag/feature_flag/feature_flag_repository.dart';
import 'package:deriv_feature_flag/growthbook/deriv_growth_book.dart';

class DerivFeatureFlag {
  late final FeatureFlagRepository _featureFlagRepository;

  DerivFeatureFlag(FeatureFlagConfig featureFlagConfig) {
    final DerivGrowthBook derivGrowthBook = DerivGrowthBook(
      featureFlagConfig: featureFlagConfig,
    );
    _featureFlagRepository = FeatureFlagRepository(derivGrowthBook);
  }

  /// Initializes the FeatureFlag service for the whole app.
  Future<void> initialize() async {
    await _featureFlagRepository.setup();
  }

  /// To check if Feature Flag is on or off.
  bool isFeatureOn(String key, {bool defaultValue = false}) =>
      _featureFlagRepository.isFeatureOn(key, defaultValue: defaultValue);

  /// Returns the value of a feature flag.
  ///
  /// The returned value, depending on the feature flag, can be a boolean,
  /// string, num, or a Map.
  dynamic getFeatureFlagValue(String key, {dynamic defaultValue = false}) =>
      _featureFlagRepository.getFeatureValue(key, defaultValue: defaultValue);

  /// Returns the value of a boolean feature flag.
  bool getBoolFeatureValue(String key, {bool defaultValue = false}) =>
      (_featureFlagRepository.getFeatureValue(key) as bool?) ?? defaultValue;

  /// Returns the value of a String feature flag.
  String getStringFeatureValue(String key, {String defaultValue = ''}) =>
      (_featureFlagRepository.getFeatureValue(key) as String?) ?? defaultValue;

  /// Returns the value of a num feature flag.
  num getNumFeatureValue(String key, {num defaultValue = 0}) =>
      (_featureFlagRepository.getFeatureValue(key) as num?) ?? defaultValue;
}
