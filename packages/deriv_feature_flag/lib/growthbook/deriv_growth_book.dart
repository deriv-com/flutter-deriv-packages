import 'package:deriv_feature_flag/feature_flag/feature_flag_config.dart';
import 'package:deriv_feature_flag/growthbook/base_growth_book.dart';
import 'package:deriv_feature_flag/growthbook/growth_book_config.dart';
import 'package:growthbook_sdk_flutter/growthbook_sdk_flutter.dart';

/// This class contains the reference data for
class DerivGrowthBook extends BaseGrowthBook implements GrowthBookConfig {
  /// Growth Book SDK builder.
  late final GBSDKBuilderApp _gbsdkBuilderApp;

  DerivGrowthBook({required FeatureFlagConfig featureFlagConfig}) {
    _gbsdkBuilderApp = GBSDKBuilderApp(
      hostURL: featureFlagConfig.hostUrl,
      apiKey: featureFlagConfig.clientKey,
      attributes: featureFlagConfig.attributes,
      enable: featureFlagConfig.enable,
      qaMode: featureFlagConfig.qaMode,
      forcedVariations: featureFlagConfig.forcedVariations,
      growthBookTrackingCallBack: GrowthBookConfig.trackingCallBack,
      gbFeatures: GrowthBookConfig.gbFeatures(featureFlagConfig.features),
      onInitializationFailure: GrowthBookConfig.onInitializationFailure,
    );
  }

  @override
  Future<GrowthBookSDK> initializeSDK() async => _gbsdkBuilderApp.initialize();
}
