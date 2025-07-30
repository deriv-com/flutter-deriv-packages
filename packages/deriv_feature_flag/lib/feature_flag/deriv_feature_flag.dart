import 'package:deriv_feature_flag/feature_flag/feature_flag_config.dart';
import 'package:deriv_feature_flag/feature_flag/feature_flag_repository.dart';
import 'package:deriv_feature_flag/growthbook/deriv_growth_book.dart';
import 'package:flutter/material.dart';

class DerivFeatureFlag {
  /// Initializes the FeatureFlag service for the whole app.
  Future<void> initialize(FeatureFlagConfig featureFlagConfig) async {
    final DerivGrowthBook derivGrowthBook = DerivGrowthBook(
      featureFlagConfig: featureFlagConfig,
    );
    // TODO(Ramin): FeatureFlagRepository should be non-singleton or another way
    //  to be able to send different attributes during one app run session.
    //  Since sending attributes happens in the initialization and if during one
    //  app run session we might want to send different attributes (e.g. country)
    await FeatureFlagRepository.getInstance()
        .setup(derivGrowthBook: derivGrowthBook);
  }

  /// Refreshes feature flags from the remote server.
  /// This method should be called when connectivity is restored to ensure
  /// feature flags are up-to-date with the latest values from the server.
  Future<void> refreshFeatureFlags() async {
    try {
      await FeatureFlagRepository.getInstance().refreshFeatures();
    } catch (e) {
      // Handle refresh errors gracefully to avoid app crashes
      debugPrint('Failed to refresh feature flags: $e');
    }
  }

  /// Only for testing purposes.
  @visibleForTesting
  static Future<void> initializeTest(DerivGrowthBook derivGrowthBook) async {
    await FeatureFlagRepository.getInstance()
        .setup(derivGrowthBook: derivGrowthBook);
  }

  /// only for testing purposes.
  @visibleForTesting
  static FeatureFlagRepository get featureFlagRepository =>
      FeatureFlagRepository.getInstance();

  /// To check if Feature Flag is on or off.
  bool isFeatureOn(String key, {bool defaultValue = false}) =>
      FeatureFlagRepository.getInstance().isFeatureOn(
        key,
        defaultValue: defaultValue,
      );

  /// Returns the value of a feature flag.
  ///
  /// The returned value, depending on the feature flag, can be a boolean,
  /// string, num, or a Map.
  dynamic getFeatureFlagValue(String key, {dynamic defaultValue = false}) =>
      FeatureFlagRepository.getInstance().getFeatureValue(
        key,
        defaultValue: defaultValue,
      );

  /// Returns the value of a boolean feature flag.
  bool getBoolFeatureValue(String key, {bool defaultValue = false}) =>
      (FeatureFlagRepository.getInstance().getFeatureValue(key) as bool?) ??
      defaultValue;

  /// Returns the value of a String feature flag.
  String getStringFeatureValue(String key, {String defaultValue = ''}) =>
      (FeatureFlagRepository.getInstance().getFeatureValue(key) as String?) ??
      defaultValue;

  /// Returns the value of a num feature flag.
  num getNumFeatureValue(String key, {num defaultValue = 0}) =>
      (FeatureFlagRepository.getInstance().getFeatureValue(key) as num?) ??
      defaultValue;

  /// Set attributes to target specific user.
  void setAttributes(Map<String, dynamic> attributes) {
    FeatureFlagRepository.getInstance().setAttributes(attributes);
  }

  /// only for testing purposes.
  @visibleForTesting
  bool isFeatureOnTest(FeatureFlagRepository featureFlagRepository, String key,
          {bool defaultValue = false}) =>
      featureFlagRepository.isFeatureOn(
        key,
        defaultValue: defaultValue,
      );
}
