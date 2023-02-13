import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_deriv_bloc_manager/manager.dart';

/// Bloc manager listener widget.
class BlocManagerConsumer<B extends GenericBloc> extends StatefulWidget {
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

  /// Widget listener.
  ///
  /// This listener is called when the bloc state changes.
  final Widget Function(BuildContext context, Object state) listener;

  /// Listen condition.
  ///
  /// This condition is called when the bloc state changes.
  final bool Function(Object previousState, Object currentState)? listenWhen;

  /// Widget builder.
  ///
  /// This builder is called when the bloc state changes.
  final Widget Function(BuildContext context, Object state) builder;

  /// Build condition.
  ///
  /// This condition is called when the bloc state changes.
  final bool Function(Object previousState, Object currentState)? buildWhen;

  @override
  State<BlocManagerConsumer<B>> createState() => _BlocManagerConsumerState<B>();
}

class _BlocManagerConsumerState<B extends GenericBloc>
    extends State<BlocManagerConsumer<B>> {
  @override
  Widget build(BuildContext context) => BlocConsumer<B, Object>(
        key: widget.key,
        bloc: BlocManager.instance.fetch<B>(widget.blocKey),
        listener: widget.listener,
        listenWhen: widget.listenWhen,
        builder: widget.builder,
        buildWhen: widget.buildWhen,
      );

  @override
  void dispose() {
    if (widget.disposeBloc) {
      BlocManager.instance.dispose<B>(widget.blocKey);
    }

    super.dispose();
  }
}
