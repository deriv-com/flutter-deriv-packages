import 'dart:developer' as logger;

import 'package:bloc/bloc.dart';

/// An observer for blocs and cubits state change.
class BlocManagerObserver extends BlocObserver {
  @override
  void onCreate(BlocBase<dynamic> bloc) {
    super.onCreate(bloc);

    logger.log('Bloc created: ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    logger.log(
      '${bloc.runtimeType} state changed from ${change.currentState.runtimeType} to ${change.nextState.runtimeType}',
    );

    super.onChange(bloc, change);
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    super.onClose(bloc);

    logger.log('Bloc closed: ${bloc.runtimeType}');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    logger.log('Bloc error: ${bloc.runtimeType}\n$error\n$stackTrace');

    super.onError(bloc, error, stackTrace);
  }
}
