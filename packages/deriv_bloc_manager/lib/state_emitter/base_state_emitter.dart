import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_deriv_bloc_manager/state_emitter/base_state_listener.dart';
import 'package:flutter_deriv_bloc_manager/bloc_manager/base_bloc_manager.dart';

/// Base state emitter class.
abstract class BaseStateEmitter<L extends BaseStateListener,
    B extends BlocBase<Object>> {
  /// Initializes base state emitter.
  BaseStateEmitter(this.blocManager) {
    blocManager.registerStateEmitter(this);
  }

  /// Bloc manager instance.
  final BaseBlocManager blocManager;

  /// Handles states for state listener [L].
  void handleStates({required L stateListener, required Object state});

  /// Emits state to corresponding listener.
  void call({required BaseStateListener stateListener, Object? state}) {
    if (stateListener is L) {
      handleStates(
        stateListener: stateListener,
        state: state ?? blocManager.fetch<B>().state,
      );
    }
  }
}
