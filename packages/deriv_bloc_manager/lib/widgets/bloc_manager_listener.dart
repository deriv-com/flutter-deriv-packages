import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_deriv_bloc_manager/manager.dart';

/// Bloc manager listener widget.
class BlocManagerListener<B extends GenericBloc> extends StatefulWidget {
  /// Initializes [BlocManagerListener].
  const BlocManagerListener({
    required this.listener,
    this.listenWhen,
    this.child,
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

  /// Widget listener.
  ///
  /// This listener is called when the bloc state changes.
  final Widget Function(BuildContext context, Object state) listener;

  /// Listen condition.
  ///
  /// This condition is called when the bloc state changes.
  final bool Function(Object previousState, Object currentState)? listenWhen;

  /// The widget which will be rendered as a descendant of the [BlocListenerBase].
  final Widget? child;

  @override
  State<BlocManagerListener<B>> createState() => _BlocManagerListenerState<B>();
}

class _BlocManagerListenerState<B extends GenericBloc>
    extends State<BlocManagerListener<B>> {
  @override
  Widget build(BuildContext context) => BlocListener<B, Object>(
        key: widget.key,
        bloc: BlocManager.instance.fetch<B>(widget.blocKey),
        listenWhen: widget.listenWhen,
        listener: widget.listener,
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
