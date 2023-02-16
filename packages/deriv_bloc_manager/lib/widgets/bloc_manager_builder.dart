import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_deriv_bloc_manager/manager.dart';

/// Bloc manager builder widget.
class BlocManagerBuilder<B extends GenericBloc, S> extends StatefulWidget {
  /// Initializes [BlocManagerBuilder].
  const BlocManagerBuilder({
    required this.builder,
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

  /// Build condition.
  ///
  /// Determines whether the widget should be rebuilt.
  ///
  /// Passing `null` will cause the widget to be rebuilt every time the bloc state changes.
  final bool Function(S previousState, S currentState)? buildWhen;

  /// Widget builder.
  ///
  /// This builder is called when the bloc state changes.
  final Widget Function(BuildContext context, S state) builder;

  @override
  State<BlocManagerBuilder<B, S>> createState() =>
      _BlocManagerBuilderState<B, S>();
}

class _BlocManagerBuilderState<B extends GenericBloc, S>
    extends State<BlocManagerBuilder<B, S>> {
  @override
  Widget build(BuildContext context) => BlocBuilder<B, Object>(
        key: widget.key,
        bloc: BlocManager.instance.fetch<B>(widget.blocKey),
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
