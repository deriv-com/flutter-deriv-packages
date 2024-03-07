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
    await FeatureFlagRepository.getInstance()
        .setup(derivGrowthBook: derivGrowthBook);
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

  /// only for testing purposes.
  @visibleForTesting
  bool isFeatureOnTest(FeatureFlagRepository featureFlagRepository, String key,
          {bool defaultValue = false}) =>
      featureFlagRepository.isFeatureOn(
        key,
        defaultValue: defaultValue,
      );
}
