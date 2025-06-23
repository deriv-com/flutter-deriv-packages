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

  /// initialize the GrowthBook sdk instance.
  Future<void> setup({required DerivGrowthBook derivGrowthBook}) async {
    _growthBookSDK = await derivGrowthBook.initializeSDK();
  }

  /// Refreshes feature flags using the GrowthBook SDK's native refresh method.
  /// This fetches the latest feature flag values from the server.
  Future<void> refreshFeatures() async {
    await _growthBookSDK.refresh();
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
  /// This method merges new attributes with existing ones, updating values for existing keys
  /// and adding new key-value pairs.
  void setAttributes(Map<String, dynamic> attributes) {
    final currentAttributes = _growthBookSDK.context.attributes ?? {};
    final updatedAttributes = Map<String, dynamic>.from(currentAttributes)
      ..addAll(attributes);
    _growthBookSDK.setAttributes(updatedAttributes);
  }

  @visibleForTesting
  GrowthBookSDK get growthBookSDK => _growthBookSDK;
}
