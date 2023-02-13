import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_deriv_bloc_manager/manager.dart';

/// Bloc manager builder widget.
class BlocManagerBuilder<B extends GenericBloc> extends StatefulWidget {
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

  /// Widget builder.
  ///
  /// This builder is called when the bloc state changes.
  final Widget Function(BuildContext context, Object state) builder;

  /// Build condition.
  ///
  /// This condition is called when the bloc state changes.
  final bool Function(Object previousState, Object currentState)? buildWhen;

  @override
  State<BlocManagerBuilder<B>> createState() => _BlocManagerBuilderState<B>();
}

class _BlocManagerBuilderState<B extends GenericBloc>
    extends State<BlocManagerBuilder<B>> {
  @override
  Widget build(BuildContext context) => BlocBuilder<B, Object>(
        key: widget.key,
        bloc: BlocManager.instance.fetch<B>(widget.blocKey),
        buildWhen: widget.buildWhen,
        builder: widget.builder,
      );

  @override
  void dispose() {
    if (widget.disposeBloc) {
      BlocManager.instance.dispose<B>(widget.blocKey);
    }

    super.dispose();
  }
}
