import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_deriv_bloc_manager/base_event_listener.dart';
import 'package:flutter_deriv_bloc_manager/base_state_emitter.dart';
import 'package:flutter_deriv_bloc_manager/bloc_managers/base_bloc_manager.dart';

/// Function signature for `StateEmitterBuilder`.
typedef StateEmitterBuilder = void Function(BaseBlocManager blocManager);

/// Event dispatcher for dispatching core events.
class EventDispatcher {
  /// Initializes event dispatcher.
  EventDispatcher(
    this.blocManager, {
    this.listenerKey = 'CORE_EVENT_LISTENER_KEY',
  });

  /// State manager instance.
  final BaseBlocManager blocManager;

  /// Event listeners key.
  final String listenerKey;

  /// Initialises event dispatcher by adding listeners to the shared blocs.
  void register<B extends BlocBase<Object>,
      E extends BaseStateEmitter<BaseEventListener, B>>(
    StateEmitterBuilder stateEmitterBuilder,
  ) {
    stateEmitterBuilder(blocManager);

    if (!blocManager.hasListener<B>(listenerKey)) {
      blocManager.addListener<B>(
        listenerKey: listenerKey,
        handler: (Object state) => _dispatcher<E>(state),
      );
    }
  }

  void _dispatcher<
          E extends BaseStateEmitter<BaseEventListener, BlocBase<Object>>>(
      Object state) {
    for (int index = 0; index < blocManager.repository.length; index++) {
      blocManager.emitCoreStates<E>(
        bloc: blocManager.repository.entries.elementAt(index).value,
        state: state,
      );
    }
  }
}
