import 'package:deriv_feature_flag/growthbook/deriv_growth_book.dart';
import 'package:growthbook_sdk_flutter/growthbook_sdk_flutter.dart';

/// Service that provides feature flag functionality for us.
class FeatureFlagRepository {
  late final GrowthBookSDK growthBookSDK;
  final DerivGrowthBook _derivGrowthBook;

  FeatureFlagRepository(this._derivGrowthBook);

  /// initialize the GrowthBook sdk instance.
  Future<void> setup() async {
    growthBookSDK = await _derivGrowthBook.initializeSDK();
  }

  /// get the feature flags value from the sdk.
  bool isFeatureOn(String key, {bool defaultValue = false}) =>
      growthBookSDK.feature(key).on ?? defaultValue;

  /// Returns the value of a feature flag.
  ///
  /// The returned value, depending on the feature flag, can be a boolean,
  /// string, num, or a Map.
  dynamic getFeatureValue(String key, {dynamic defaultValue = false}) =>
      growthBookSDK.feature(key).value ?? defaultValue;
}
