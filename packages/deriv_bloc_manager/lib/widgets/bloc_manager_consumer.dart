import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_deriv_bloc_manager/manager.dart';

/// Bloc manager listener widget.
class BlocManagerConsumer<B extends GenericBloc, S> extends StatefulWidget {
  /// Initializes [BlocManagerConsumer].
  const BlocManagerConsumer({
    required this.listener,
    required this.builder,
    this.listenWhen,
    this.buildWhen,
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

  /// Build condition.
  ///
  /// This condition is called when the bloc state changes.
  final bool Function(S previousState, S currentState)? buildWhen;

  /// Widget builder.
  ///
  /// This builder is called when the bloc state changes.
  final Widget Function(BuildContext context, S state) builder;

  @override
  State<BlocManagerConsumer<B, S>> createState() =>
      _BlocManagerConsumerState<B, S>();
}

class _BlocManagerConsumerState<B extends GenericBloc, S>
    extends State<BlocManagerConsumer<B, S>> {
  @override
  Widget build(BuildContext context) => BlocConsumer<B, Object>(
        key: widget.key,
        bloc: BlocManager.instance.fetch<B>(widget.blocKey),
        listenWhen: (Object previousState, Object currentState) =>
            widget.listenWhen?.call(previousState as S, currentState as S) ??
            true,
        listener: (BuildContext context, Object state) =>
            widget.listener(context, state as S),
        buildWhen: (Object previousState, Object currentState) =>
            widget.buildWhen?.call(previousState as S, currentState as S) ??
            true,
        builder: (BuildContext context, Object state) =>
            widget.builder(context, state as S),
      );

  @override
  void dispose() {
    if (widget.disposeBloc) {
      BlocManager.instance.dispose<B>(widget.blocKey);
    }

    super.dispose();
  }
}
