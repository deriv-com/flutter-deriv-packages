import 'package:flutter_deriv_bloc_manager/manager.dart';

/// Function signature for `StateEmitterBuilder`.
typedef StateEmitterBuilder = void Function(BaseBlocManager blocManager);

/// State dispatcher for dispatching core states.
class StateDispatcher {
  /// Initializes state dispatcher.
  StateDispatcher(
    this.blocManager, {
    this.listenerKey = 'CORE_STATE_LISTENER_KEY',
  });

  /// State manager instance.
  final BaseBlocManager blocManager;

  /// State listeners key.
  final String listenerKey;

  /// Initialises state dispatcher by adding listeners to the shared blocs.
  void register<B extends GenericBloc, E extends GenericStateEmitter>(
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

  void _dispatcher<E extends GenericStateEmitter>(Object state) {
    for (int index = 0; index < blocManager.repository.length; index++) {
      blocManager.emitCoreStates<E>(
        bloc: blocManager.repository.entries.elementAt(index).value,
        state: state,
      );
    }
  }
}
