import 'package:flutter_deriv_bloc_manager/manager.dart';

/// [GenericState] statuses.
enum Status {
  /// Initial status.
  initial,

  /// Loading status.
  loading,

  /// Success status.
  success,

  /// failure status.
  failure,
}
