import 'package:flutter_deriv_bloc_manager/manager.dart';

import 'package:flutter_deriv_bloc_manager_example/state_listener_contracts/main_cubit_listener.dart';
import 'package:flutter_deriv_bloc_manager_example/states/main_cubit/main_cubit.dart';

/// Account settings state emitter.
class MainCubitStateEmitter
    extends BaseStateEmitter<MainCubitStateListener, MainCubit> {
  /// Initializes account settings state emitter.
  MainCubitStateEmitter(BaseBlocManager blocManager) : super(blocManager);

  @override
  void handleStates({
    required MainCubitStateListener stateListener,
    required Object state,
  }) {
    if (state is MainCubitLoadingState) {
      stateListener.onLoading();
    } else if (state is MainCubitLoadedState) {
      stateListener.onLoaded();
    }
  }
}
