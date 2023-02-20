import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_deriv_bloc_manager/manager.dart';

/// Bloc manager listener widget.
class BlocManagerConsumer<B extends GenericBloc, S> extends StatelessWidget {
  /// Initializes [BlocManagerConsumer].
  const BlocManagerConsumer({
    required this.listener,
    required this.builder,
    this.listenWhen,
    this.buildWhen,
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
  Widget build(BuildContext context) => BlocConsumer<B, Object>(
        key: key,
        bloc: BlocManager.instance.fetch<B>(blocKey),
        listenWhen: (Object previousState, Object currentState) =>
            listenWhen?.call(previousState as S, currentState as S) ?? true,
        listener: (BuildContext context, Object state) =>
            listener(context, state as S),
        buildWhen: (Object previousState, Object currentState) =>
            buildWhen?.call(previousState as S, currentState as S) ?? true,
        builder: (BuildContext context, Object state) =>
            builder(context, state as S),
      );
}
