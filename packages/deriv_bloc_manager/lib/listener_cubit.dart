import 'package:bloc/bloc.dart';
import 'package:flutter_deriv_bloc_manager/manager.dart';

abstract class ListenerCubit<State> extends Cubit<State> {
  ListenerCubit(
    State initialState, {
    BlocManager? blocManager,
  })  : blocManager = BlocManager.instance,
        super(initialState);

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
    BlocManager.instance.addListenerFor<CubitToWatch>(
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
