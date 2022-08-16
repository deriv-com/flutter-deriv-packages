import 'package:bloc/bloc.dart';

import 'package:flutter_deriv_bloc_manager/manager.dart';

/// Listener bloc, which is a [Bloc] or [Cubit] that listens to `broadcaster bloc/cubit` states.
abstract class ListenerBloc<State> extends BlocBase<State> {
  /// Initializes [ListenerBloc] with [initialState].
  ///
  /// [BaseBlocManager] is optional, if not provided, `BlocManager.instance` will be used.
  ListenerBloc(State initialState, {BaseBlocManager? blocManager})
      : _blocManager = blocManager ?? BlocManager.instance,
        super(initialState);

  /// Bloc manager instance.
  final BaseBlocManager? _blocManager;

  /// Adds [listener] to broadcaster bloc/cubit.
  void addListener<BlocToWatch extends BlocBase<Object>, StateToWatch>({
    required BlocManagerListenerHandler<StateToWatch> listener,
    bool shouldAlsoReceiveCurrentState = true,
    String blocKey = BaseBlocManager.defaultKey,
  }) {
    if (shouldAlsoReceiveCurrentState) {
      final Object? currentState = _blocManager?.fetch<BlocToWatch>().state;

      if (currentState is StateToWatch) {
        listener(currentState);
      }
    }

    BlocManager.instance.addListener<BlocToWatch>(
      key: blocKey,
      listenerKey: _getListenerKey(),
      handler: (Object state) {
        if (state is StateToWatch) {
          listener(state as StateToWatch);
        }
      },
    );
  }

  String _getListenerKey() => hashCode.toString();

  @override
  Future<void> close() {
    _blocManager?.removeListeners(_getListenerKey());

    return super.close();
  }
}
