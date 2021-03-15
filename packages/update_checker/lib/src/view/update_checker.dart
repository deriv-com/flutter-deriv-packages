import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../update_checker.dart';

/// UpdateChecker is a higher-order widget that helps with handling the
/// UpdateBloc states without dealing with bloc itself.
class UpdateChecker extends StatelessWidget {
  /// Checks for update availability as soon as renders and will call the proper
  /// callback based on the UpdateState.
  const UpdateChecker({
    this.child,
    this.onAvailable,
    this.onNotAvailable,
    this.onStateChange,
  });

  /// The [child] that UpdateChecker widget will wrap.
  final Widget? child;

  /// [onAvailable] will be called when there is an update available.
  final Function(UpdateInfo)? onAvailable;

  /// [onNotAvailable] will be called when there is no update available.
  final Function? onNotAvailable;

  /// [onStateChange] will be called when there is a change in the state.
  final Function(UpdateState)? onStateChange;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UpdateBloc>(context).add(UpdateFetchEvent());

    return BlocListener<UpdateBloc, UpdateState>(
      listener: (_, UpdateState state) => _setListener(state),
      child: child ?? const SizedBox.shrink(),
    );
  }

  void _setListener(UpdateState state) {
    onStateChange?.call(state);
    if (state is UpdateNotAvailableState) {
      onNotAvailable?.call();
    } else if (state is UpdateAvailableState) {
      onAvailable?.call(state.updateInfo);
    }
  }
}
