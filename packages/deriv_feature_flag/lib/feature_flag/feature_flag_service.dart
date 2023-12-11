import 'package:deriv_feature_flag/feature_flag/feature_flag_repository.dart';

/// this class encapsulates the details of initilization of feature flags
/// functionality in dblanc.
class FeatureFlagService {
  /// class constructor.
  FeatureFlagService();

  /// Provide and instane of the service.
  factory FeatureFlagService.getInstance() => _instance;

  // Private constructor
  FeatureFlagService._();

  // Singleton instance
  static final FeatureFlagService _instance = FeatureFlagService._();

  late final FeatureFlagRepository featureFlagRepository;

  /// Initiliaze the feature flag functionality for the app.
  Future<void> setup(FeatureFlagRepository repository) async =>
      featureFlagRepository = repository;

  bool isFeatureOn(String key, {bool defaultValue = false}) =>
      featureFlagRepository.isFeatureOn(
        key,
        defaultValue: defaultValue,
      );
}
