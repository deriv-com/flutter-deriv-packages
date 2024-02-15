import 'package:deriv_feature_flag/deriv_feature_flag.dart';
import 'package:deriv_feature_flag/feature_flag/deriv_feature_flag.dart';
import 'package:deriv_feature_flag/feature_flag/feature_flag_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:growthbook_sdk_flutter/growthbook_sdk_flutter.dart';
import 'package:mocktail/mocktail.dart';

import 'mock_classes.dart';

void main() async {
  final FeatureFlagConfig featureFlagConfig = FeatureFlagConfig(
    hostUrl: '',
    clientKey: '',
    features: {
      Features.isSocialAuthEnabled.key: GBFeature(defaultValue: true),
    },
  );

  final mockDerivGrowthBook = MockDerivGrowthBook(
    featureFlagConfig: featureFlagConfig,
  );

  final mockFeatureFlagRepository = MockFeatureFlagRepository();
  await DerivFeatureFlag.initializeTest(mockDerivGrowthBook);

  setUp(() async {
    WidgetsFlutterBinding.ensureInitialized();
  });

  group('FeatureFlagService', () {
    test('setup should set the repository properly.', () async {
      // Act & Assert
      expect(
          DerivFeatureFlag.featureFlagRepository, isA<FeatureFlagRepository>());
    });

    test('isFeatureOn should be delegated to repository properly.', () {
      // when the feature flag is true.
      when(() => mockFeatureFlagRepository.isFeatureOn(
          Features.isSocialAuthEnabled.key,
          defaultValue: true)).thenReturn(true);

      // we get the value from the package.
      final result = DerivFeatureFlag().isFeatureOnTest(
        mockFeatureFlagRepository,
        Features.isSocialAuthEnabled.key,
        defaultValue: true,
      );

      // The data should match.
      expect(result, equals(true));
    });
    test('isFeatureOn function is only called once in each interaction.', () {
      // when the feature flag is true.
      when(() => DerivFeatureFlag().isFeatureOnTest(
            mockFeatureFlagRepository,
            Features.isSocialAuthEnabled.key,
            defaultValue: true,
          )).thenReturn(true);

      // verify that the method is only called once.
      verify(() => mockFeatureFlagRepository.isFeatureOn(
            Features.isSocialAuthEnabled.key,
            defaultValue: true,
          )).called(1);
    });

    test(
        'when isFeatureOn is called for an undefined featureflag, package delivers it properly.',
        () {
      const String key = 'nonexistent_feature';
      // when the feature flag is undefined with false as its default value
      when(() => mockFeatureFlagRepository.isFeatureOn(
            key,
            defaultValue: true,
          )).thenReturn(false);

      // we get the value from the packag.
      final result = DerivFeatureFlag().isFeatureOnTest(
        mockFeatureFlagRepository,
        key,
        defaultValue: true,
      );

      // The package deliver the correect answer.
      expect(result, equals(false));
    });
  });
}
