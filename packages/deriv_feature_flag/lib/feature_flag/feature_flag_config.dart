class FeatureFlagConfig {
  /// set of client side applications features.
  final Map<String, dynamic> features;

  /// Map of user attributes that are used to assign variations.
  final Map<String, dynamic> attributes;

  /// If true, random assignment is disabled and only explicitly forced
  /// variations are used.
  final bool qaMode;

  /// Switch to globally disable all experiments. Default true
  final bool enable;

  /// Force specific experiments to always assign a specific variation (QA).
  final Map<String, int> forcedVariations;

  /// Feature flag service host url
  final String hostUrl;

  /// Feature flag service client key
  final String clientKey;

  FeatureFlagConfig({
    this.attributes = const <String, dynamic>{},
    this.qaMode = false,
    this.enable = true,
    this.forcedVariations = const <String, int>{},
    this.features = const {},
    required this.hostUrl,
    required this.clientKey,
  });
}
