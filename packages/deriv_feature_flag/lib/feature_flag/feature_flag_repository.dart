import 'package:flutter/material.dart';

import 'package:deriv_feature_flag/growthbook/deriv_growth_book.dart';
import 'package:growthbook_sdk_flutter/growthbook_sdk_flutter.dart';

/// Service that provides feature flag functionality for us.
class FeatureFlagRepository {
  /// Getter for the instance
  factory FeatureFlagRepository.getInstance() => _instance;

  // Private constructor
  FeatureFlagRepository._();

  // Singleton instance
  static final FeatureFlagRepository _instance = FeatureFlagRepository._();

  // Growth Book SDK instance.
  late final GrowthBookSDK _growthBookSDK;

  Map<String, GBFeature> _features = {};

  Map<String, GBFeature> get features => _features;

  /// initialize the GrowthBook sdk instance.
  Future<void> setup({required DerivGrowthBook derivGrowthBook}) async {
    _growthBookSDK = await derivGrowthBook.initializeSDK();
    _features = _growthBookSDK.features;
  }

  /// get the feature flags value from the sdk.
  bool isFeatureOn(String key, {bool defaultValue = false}) =>
      _growthBookSDK.feature(key).on ?? defaultValue;

  /// Returns the value of a feature flag.
  ///
  /// The returned value, depending on the feature flag, can be a boolean,
  /// string, num, or a Map.
  dynamic getFeatureValue(String key, {dynamic defaultValue = false}) =>
      _growthBookSDK.feature(key).value ?? defaultValue;

  /// Set attributes to target specific user.
  void setAttributes(Map<String, dynamic> attributes) {
    _growthBookSDK.setAttributes(attributes);
  }

  @visibleForTesting
  GrowthBookSDK get growthBookSDK => _growthBookSDK;
}
