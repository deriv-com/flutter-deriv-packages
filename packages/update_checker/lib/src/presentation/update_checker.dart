import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:update_checker/src/repositories/base_firebase.dart';

import '../../update_checker.dart';

/// UpdateChecker is a higher-order widget that helps with handling the
/// UpdateBloc states without dealing with bloc itself.
class UpdateChecker extends StatefulWidget {
  /// Checks for update availability as soon as renders and will call the proper
  /// callback based on the UpdateState.
  const UpdateChecker({
    required this.firebaseRepository,
    this.child,
    this.onAvailable,
    this.onNotAvailable,
    this.onStateChange,
  });

  /// The [child] that UpdateChecker widget will wrap.
  final Widget? child;

  /// The [firebaseRepository] that fetch the update information
  /// from the firebase system.
  final BaseFirebase firebaseRepository;

  /// [onAvailable] will be called when there is an update available.
  final Function(UpdateInfo)? onAvailable;

  /// [onNotAvailable] will be called when there is no update available.
  final Function? onNotAvailable;

  /// [onStateChange] will be called when there is a change in the state.
  final Function(UpdateState)? onStateChange;

  @override
  _UpdateCheckerState createState() => _UpdateCheckerState();
}

class _UpdateCheckerState extends State<UpdateChecker> {
  late final UpdateBloc _updateBloc;

  @override
  void initState() {
    super.initState();
    // Configure fetch settings
    FirebaseRemoteConfig.instance.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 10),
      // Default fetch timeout

      // As google set a limit of 5 call per hour for each device,
      // we set the minimumFetchInterval to 15 minutes
      // to avoid Throttling error,
      // check: https://firebase.google.com/docs/remote-config/get-started?platform=ios#throttling
      minimumFetchInterval:
          const Duration(minutes: 15), // Minimum fetch interval set to 0
    ));

    _updateBloc = UpdateBloc(firebaseRepository: widget.firebaseRepository);
    _updateBloc.add(UpdateFetchEvent());
  }

  @override
  Widget build(BuildContext context) => BlocProvider<UpdateBloc>(
        create: (_) => _updateBloc,
        child: Builder(
          builder: (_) => BlocListener<UpdateBloc, UpdateState>(
            listener: (_, UpdateState state) => _setListener(state),
            child: widget.child ?? const SizedBox.shrink(),
          ),
        ),
      );

  void _setListener(UpdateState state) {
    widget.onStateChange?.call(state);
    if (state is UpdateNotAvailableState) {
      widget.onNotAvailable?.call();
    } else if (state is UpdateAvailableState) {
      widget.onAvailable?.call(state.updateInfo);
    }
  }
}
