## Deriv Feature Flag

This package provides feature flag functionality for mobile applications.

## Getting started

## To use the lints, add a dependency in your `pubspec.yaml`:

```yaml
dependencies:
  deriv_feature_flag:
    git:
      url: git@github.com:regentmarkets/flutter-deriv-packages.git
      path: packages/deriv_feature_flag
      ref: ref
```

Initialize and provide your feature flags key,value pairs:

```dart
final config = FeatureFlagConfig(
    features: {
    'sample_feature_key': true,
  },
);
await DerivFeatureFlag.initialize(config);
```

Then use it in your project:

```dart
if(DerivFeatureFlag().isFeatureOn('sample_feature_key',defaultValue: false)){
    /// add the functionality that should be done if feature flag is on.
}

```

## Additional information

TODO: At this phase we only use GrowthBook for feature flagging. To find more information please check GrowthBook [documentation](https://docs.growthbook.io/lib/flutter)
