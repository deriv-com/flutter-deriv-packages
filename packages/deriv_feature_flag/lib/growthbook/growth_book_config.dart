import 'dart:developer' as logger;
import 'package:growthbook_sdk_flutter/growthbook_sdk_flutter.dart';

/// A class that contains the whole GrowthBook config data.
class GrowthBookConfig {
  /// Convert client side FeatureFlags to GrowthBook FeatureFlags.
  static Map<String, GBFeature> gbFeatures(Map<String, dynamic> features) {
    if (features.isEmpty) {
      return const {};
    }

    final gbFeatures = <String, GBFeature>{};

    for (final entry in features.entries) {
      gbFeatures[entry.key] = GBFeature(defaultValue: entry.value);
    }

    return gbFeatures;
  }

  /// Provide proper log or service initialization failure.
  static void onInitializationFailure(GBError? gbError) =>
      logger.log('GrowthBook initilization failed: ${gbError?.error}');

  /// Provide appropriate log after setting up the service.
  static void trackingCallBack(
    GBExperiment experiment,
    GBExperimentResult result,
  ) {
    final key = experiment.key ?? '';
    final id = result.variationID?.toString() ?? '';

    logger.log('Experiment Id: $key');
    logger.log('Variation Id: $id');
  }
}
