import 'package:deriv_feature_flag/feature_flag/feature_flag_config.dart';
import 'package:deriv_feature_flag/feature_flag/feature_flag_repository.dart';
import 'package:deriv_feature_flag/growthbook/deriv_growth_book.dart';

class DerivFeatureFlag {
  /// Initilize the FeatureFlag service for the whole app.
  static void initialize(FeatureFlagConfig featureFlagConfig) {
    final DerivGrowthBook derivGrowthBook = DerivGrowthBook(
      featureFlagConfig: featureFlagConfig,
    );
    FeatureFlagRepository.getInstance().setup(derivGrowthBook: derivGrowthBook);
  }

  /// To check if Feature Flag is on or off.
  bool isFeatureOn(String key, {bool defaultValue = false}) =>
      FeatureFlagRepository.getInstance().isFeatureOn(
        key,
        defaultValue: defaultValue,
      );
}
