import 'package:deriv_feature_flag/feature_flag/feature_flag_config.dart';
import 'package:deriv_feature_flag/feature_flag/feature_flag_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:growthbook_sdk_flutter/growthbook_sdk_flutter.dart';
import 'package:mocktail/mocktail.dart';

import 'mock_classes.dart';

Future<void> main() async {
  late final MockGrowthBookSDK mockGrowthBookSDK;
  late FeatureFlagConfig featureFlagConfig;
  late MockDerivGrowthBook mockDerivGrowthBook;
  late FeatureFlagRepository featureFlagRepository;

  setUpAll(() async {
    mockGrowthBookSDK = MockGrowthBookSDK();
    featureFlagConfig = FeatureFlagConfig(
      hostUrl: '',
      clientKey: '',
      features: {
        Features.isSocialAuthEnabled.key: GBFeature(defaultValue: true),
      },
    );
    mockDerivGrowthBook = MockDerivGrowthBook(
      featureFlagConfig: featureFlagConfig,
    );
    featureFlagRepository = FeatureFlagRepository.getInstance();
    await featureFlagRepository.setup(
      derivGrowthBook: mockDerivGrowthBook,
    );
  });

  group('FeatureFlagRepository:', () {
    test('initializes GrowthBook SDK correctly.', () async {
      // setup the repository.
      // expects to return an instance if the sdk.
      expect(featureFlagRepository.growthBookSDK, isA<GrowthBookSDK>());
    });

    test('returns false value when feature is not found.', () async {
      // Assuming that the feature is not found in the SDK
      final result = featureFlagRepository.isFeatureOn('nonexistent_feature',
          defaultValue: true);

      // data should match.
      expect(result, equals(false));
    });

    test('returns feature value from SDK when feature is found.', () async {
      // Assuming that the feature 'isSocialAuthEnabled' is found in the SDK
      // and is set to true.
      when(() =>
          mockGrowthBookSDK.feature(Features.isSocialAuthEnabled.key).value ??
          true).thenReturn(true);

      /// get the value from the repository.
      final result = featureFlagRepository.isFeatureOn(
        Features.isSocialAuthEnabled.key,
        defaultValue: true,
      );

      /// data should match.
      expect(result, equals(true));
    });
  });
}
