import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_deriv_bloc_manager/manager.dart';

/// Generic cubit class.
abstract class GenericCubit<T> extends Cubit<GenericState<T>> {
  /// Initializes [GenericCubit].
  GenericCubit({
    required GenericState<T> initialState,
    this.service,
  }) : super(initialState);

  /// Injected service for [GenericCubit].
  final BaseService? service;
}
