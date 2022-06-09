import 'dart:developer' as logger;

import 'package:bloc/bloc.dart';

/// An observer for blocs and cubits state change.
class BlocManagerObserver extends BlocObserver {
  /// Initializes a new instance of the [BlocManagerObserver] class.
  BlocManagerObserver({
    this.enableOnCreateLogs = true,
    this.enableOnChangeLogs = false,
    this.enableOnCloseLogs = true,
    this.enableOnErrorLogs = true,
    this.verboseChangeStateLogs = false,
  });

  /// Enables on create logs.
  final bool enableOnCreateLogs;

  /// Enables on change logs.
  final bool enableOnChangeLogs;

  /// Enables on close logs.
  final bool enableOnCloseLogs;

  /// Enables on error logs.
  final bool enableOnErrorLogs;

  /// Enables verbose change state logs.
  final bool verboseChangeStateLogs;

  @override
  void onCreate(BlocBase<dynamic> bloc) {
    super.onCreate(bloc);

    if (enableOnCreateLogs) {
      logger.log('Bloc created: ${bloc.runtimeType}');
    }
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    if (enableOnChangeLogs) {
      logger.log(
        verboseChangeStateLogs
            ? 'Bloc state: ${bloc.runtimeType} state changed from ${change.currentState} to ${change.nextState}'
            : 'Bloc state: ${bloc.runtimeType} state changed from ${change.currentState.runtimeType} to ${change.nextState.runtimeType}',
      );
    }

    super.onChange(bloc, change);
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    super.onClose(bloc);

    if (enableOnCloseLogs) {
      logger.log('Bloc closed: ${bloc.runtimeType}');
    }
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    if (enableOnErrorLogs) {
      logger.log('Bloc error: ${bloc.runtimeType}\n$error\n$stackTrace');
    }

    super.onError(bloc, error, stackTrace);
  }
}
