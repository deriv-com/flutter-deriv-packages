import 'package:flutter_deriv_bloc_manager/base_bloc_manager.dart';
import 'package:flutter_deriv_bloc_manager/state_emitters/base_state_emitter.dart';

import 'package:flutter_deriv_bloc_manager_example/event_listener_contracts/main_cubit_listener.dart';
import 'package:flutter_deriv_bloc_manager_example/states/main_cubit/main_cubit.dart';

/// Account settings state emitter.
class MainCubitStateEmitter
    extends BaseStateEmitter<MainCubitEventListener, MainCubit> {
  /// Initializes account settings state emitter.
  MainCubitStateEmitter(BaseBlocManager blocManager) : super(blocManager);

  @override
  void handleStates({
    required MainCubitEventListener eventListener,
    required Object state,
  }) {
    if (state is MainCubitLoadingState) {
      eventListener.onLoading();
    } else if (state is MainCubitLoadedState) {
      eventListener.onLoaded();
    }
  }
}
