part of 'single_feature_cubit.dart';

/// [SingleFeatureState] represents the state within the SingleFeature flow.
sealed class SingleFeatureState extends Equatable {
  /// Creates a [SingleFeatureState].
  const SingleFeatureState();

  @override
  List<Object> get props => <Object>[];
}

/// [SingleFeatureInitial] represents the initial state within the SingleFeature flow.
final class SingleFeatureInitial extends SingleFeatureState {}
