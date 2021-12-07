import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_deriv_bloc_manager/base_event_listener.dart';
import 'package:flutter_deriv_bloc_manager/bloc_managers/base_bloc_manager.dart';

/// Base state emitter class.
abstract class BaseStateEmitter<E extends BaseEventListener,
    B extends BlocBase<Object>> {
  /// Initializes base state emitter.
  BaseStateEmitter(this.blocManager) {
    blocManager.registerStateEmitter(this);
  }

  /// Bloc manager instance.
  final BaseBlocManager blocManager;

  /// Handles states for event listener [E].
  void handleStates({required E eventListener, required Object state});

  /// Emits state to corresponding listener.
  void call({required BaseEventListener eventListener, Object? state}) {
    if (eventListener is E) {
      handleStates(
        eventListener: eventListener,
        state: state ?? blocManager.fetch<B>().state,
      );
    }
  }
}
