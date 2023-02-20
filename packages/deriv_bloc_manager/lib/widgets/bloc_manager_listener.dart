import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_deriv_bloc_manager/manager.dart';

/// Bloc manager listener widget.
class BlocManagerListener<B extends GenericBloc, S> extends StatelessWidget {
  /// Initializes [BlocManagerListener].
  const BlocManagerListener({
    required this.listener,
    required this.child,
    this.listenWhen,
    this.blocKey = BaseBlocManager.defaultKey,
    Key? key,
  }) : super(key: key);

  /// Bloc key.
  ///
  /// defaults to [BaseBlocManager.defaultKey].
  final String blocKey;

  /// Listen condition.
  ///
  /// Determines whether we should call [listener] or not.
  ///
  /// Passing `null` will cause the listener to be called every time the bloc state changes.
  final bool Function(S previousState, S currentState)? listenWhen;

  /// Widget listener callback.
  ///
  /// This listener is called when the bloc state changes.
  final void Function(BuildContext context, S state) listener;

  /// The widget which will be rendered as a descendant of the [BlocListenerBase].
  final Widget child;

  @override
  Widget build(BuildContext context) => BlocListener<B, Object>(
        key: key,
        bloc: BlocManager.instance.fetch<B>(blocKey),
        listenWhen: (Object previousState, Object currentState) =>
            listenWhen?.call(previousState as S, currentState as S) ?? true,
        listener: (BuildContext context, Object state) {
          if (state is S) {
            listener(context, state as S);
          }
        },
        child: child,
      );
}
