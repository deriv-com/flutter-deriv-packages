import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_deriv_bloc_manager/manager.dart';

/// Bloc manager builder widget.
class BlocManagerBuilder<B extends GenericBloc, S> extends StatelessWidget {
  /// Initializes [BlocManagerBuilder].
  const BlocManagerBuilder({
    required this.builder,
    this.buildWhen,
    this.blocKey = BaseBlocManager.defaultKey,
    Key? key,
  }) : super(key: key);

  /// Bloc key.
  ///
  /// defaults to [BaseBlocManager.defaultKey].
  final String blocKey;

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
  Widget build(BuildContext context) => BlocBuilder<B, Object>(
        key: key,
        bloc: BlocManager.instance.fetch<B>(blocKey),
        buildWhen: (Object previousState, Object currentState) =>
            buildWhen?.call(previousState as S, currentState as S) ?? true,
        builder: (BuildContext context, Object state) =>
            builder(context, state as S),
      );
}
