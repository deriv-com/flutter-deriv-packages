import 'package:deriv_feature_flag/feature_flag/feature_flag_config.dart';
import 'package:deriv_feature_flag/feature_flag/feature_flag_repository.dart';
import 'package:deriv_feature_flag/growthbook/deriv_growth_book.dart';
import 'package:deriv_feature_flag/growthbook/growth_book_config.dart';
import 'package:growthbook_sdk_flutter/growthbook_sdk_flutter.dart';
import 'package:mocktail/mocktail.dart';

class MockDerivGrowthBook extends Mock implements DerivGrowthBook {
  late final GBSDKBuilderApp _gbsdkBuilderApp;

  MockDerivGrowthBook({required FeatureFlagConfig featureFlagConfig}) {
    _gbsdkBuilderApp = GBSDKBuilderApp(
      hostURL: MockGrowthBookConfig.gbHostUrl,
      apiKey: MockGrowthBookConfig.gbClientKey,
      growthBookTrackingCallBack: GrowthBookConfig.trackingCallBack,
      gbFeatures: GrowthBookConfig.gbFeatures(featureFlagConfig.features),
      onInitializationFailure: GrowthBookConfig.onInitializationFailure,
    );
  }

  @override
  Future<GrowthBookSDK> initializeSDK() => _gbsdkBuilderApp.initialize();
}

class MockGrowthBookConfig extends Mock implements GrowthBookConfig {
  static String get gbClientKey => 'YOUR_GROWTHBOOK_HOST_URL';

  /// Determine the Growth Book Host URL.
  static String get gbHostUrl => 'https://example.growthbook.io/';
}

class MockGrowthBookSDK extends Mock implements GrowthBookSDK {}

class MockFeatureFlagRepository extends Mock implements FeatureFlagRepository {}

enum Features {
  /// To Turn Social Auth on and off.
  isSocialAuthEnabled('issocialauthenabled');

  const Features(this._featureKey);

  /// name of the Feature Flag in GrowthBook.
  final String _featureKey;

  /// getting the Feature Flag key.
  String get key => _featureKey;
}
