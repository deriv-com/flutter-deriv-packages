import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'single_feature_state.dart';

/// [SingleFeatureCubit] handles the state within the SingleFeature flow.
class SingleFeatureCubit extends Cubit<SingleFeatureState> {
  /// Creates a [SingleFeatureCubit].
  SingleFeatureCubit() : super(SingleFeatureInitial());
}
