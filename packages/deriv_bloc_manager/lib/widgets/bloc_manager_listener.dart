import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_deriv_bloc_manager/manager.dart';

/// Bloc manager listener widget.
class BlocManagerListener<B extends GenericBloc, S> extends StatefulWidget {
  /// Initializes [BlocManagerListener].
  const BlocManagerListener({
    required this.listener,
    required this.child,
    this.listenWhen,
    this.blocKey = BaseBlocManager.defaultKey,
    this.disposeBloc = false,
    Key? key,
  }) : super(key: key);

  /// Bloc key.
  ///
  /// defaults to [BaseBlocManager.defaultKey].
  final String blocKey;

  /// Indicates that bloc should be disposed or not.
  ///
  /// Defaults to `false`.
  final bool disposeBloc;

  /// Listen condition.
  ///
  /// This condition is called when the bloc state changes.
  final bool Function(S previousState, S currentState)? listenWhen;

  /// Widget listener callback.
  ///
  /// This listener is called when the bloc state changes.
  final void Function(BuildContext context, S state) listener;

  /// The widget which will be rendered as a descendant of the [BlocListenerBase].
  final Widget child;

  @override
  State<BlocManagerListener<B, S>> createState() =>
      _BlocManagerListenerState<B, S>();
}

class _BlocManagerListenerState<B extends GenericBloc, S>
    extends State<BlocManagerListener<B, S>> {
  @override
  Widget build(BuildContext context) => BlocListener<B, Object>(
        key: widget.key,
        bloc: BlocManager.instance.fetch<B>(widget.blocKey),
        listenWhen: (Object previousState, Object currentState) =>
            widget.listenWhen?.call(previousState as S, currentState as S) ??
            true,
        listener: (BuildContext context, Object state) {
          if (state is S) {
            widget.listener(context, state as S);
          }
        },
        child: widget.child,
      );

  @override
  void dispose() {
    if (widget.disposeBloc) {
      BlocManager.instance.dispose<B>(widget.blocKey);
    }

    super.dispose();
  }
}
