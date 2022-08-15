import 'package:bloc/bloc.dart';

import 'package:flutter_deriv_bloc_manager/manager.dart';

/// Listener cubit, which is a [Cubit] that listens to `broadcaster cubit` states.
abstract class ListenerCubit<State> extends Cubit<State> {
  /// Initializes [ListenerCubit] with [initialState].
  ///
  /// [BaseBlocManager] is optional, if not provided, `BlocManager.instance` will be used.
  ListenerCubit(State initialState, {BaseBlocManager? blocManager})
      : blocManager = blocManager ?? BlocManager.instance,
        super(initialState);

  /// Bloc manager instance.
  final BaseBlocManager? blocManager;

  /// Adds [listener] to broadcaster cubit.
  void listen<CubitToWatch extends BlocBase<Object>, StateToWatch>({
    required BlocManagerListenerHandler<StateToWatch> listener,
    bool shouldAlsoReceiveCurrentState = true,
    String cubitKey = BaseBlocManager.defaultKey,
  }) {
    if (shouldAlsoReceiveCurrentState) {
      final Object? currentState = blocManager?.fetch<CubitToWatch>().state;

      if (currentState is StateToWatch) {
        listener(currentState);
      }
    }

    BlocManager.instance.addListener<CubitToWatch>(
      listenerKey: _getListenerKey(),
      handler: (Object state) {
        if (state is StateToWatch) {
          listener(state as StateToWatch);
        }
      },
      key: cubitKey,
    );
  }

  @override
  Future<void> close() {
    blocManager?.removeListeners(_getListenerKey());

    return super.close();
  }

  String _getListenerKey() => hashCode.toString();
}
