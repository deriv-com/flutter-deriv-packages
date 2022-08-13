import 'package:bloc/bloc.dart';
import 'package:flutter_deriv_bloc_manager/manager.dart';

/// Advantages:
/// 1. No listener/emitter class => less Boilerplate code + easer API for developer
/// 2. No need to implement all states of a emitter cubit in the listener cubit. we can only listen to a specific state.
/// 3. An Error would be thrown if emitter cubit has not been registered before listener cubit.

abstract class ListenerCubit<State> extends Cubit<State> {
  ListenerCubit(State initialState, this.blocManager) : super(initialState);

  final BlocManager blocManager;

  void listen<CubitToWatch extends BlocBase<Object>, StateToWatch>({
    required BlocManagerListenerHandler<StateToWatch> listener,
    bool shouldAlsoReceiveCurrentState = true,
    String cubitKey = BaseBlocManager.defaultKey,
  }) {
    if (shouldAlsoReceiveCurrentState) {
      final Object currentState = blocManager.fetch<CubitToWatch>().state;

      if (currentState is StateToWatch) {
        listener(currentState as StateToWatch);
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
    blocManager.removeListeners(_getListenerKey());

    return super.close();
  }

  String _getListenerKey() => hashCode.toString();
}
