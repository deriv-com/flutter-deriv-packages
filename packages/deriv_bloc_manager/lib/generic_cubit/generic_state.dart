import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_bloc_manager/manager.dart';

/// A class to handle generic states in a generic bloc or cubit.
class GenericState<T> with EquatableMixin {
  /// Initializes [GenericState].
  GenericState({required this.status, this.data, this.error});

  /// keeps status of state.
  final Status status;

  /// keeps data of state.
  final T? data;

  /// keeps error of state.
  final String? error;

  @override
  List<Object?> get props => <Object?>[data, status, error];

  @override
  String toString() => '''
      status: $status,
      state: $data,
      error: $error
    ''';
}
