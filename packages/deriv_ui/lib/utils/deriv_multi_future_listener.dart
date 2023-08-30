import 'dart:async';

import 'package:flutter/material.dart';

/// A widget that listens to multiple futures and calls the onDone callback.
///
/// It also calls the onError callback if any of the futures fails.
class DerivMultiFutureListener extends StatefulWidget {
  /// Initializes a [DerivMultiFutureListener].
  const DerivMultiFutureListener({
    required this.futures,
    required this.child,
    required this.onDone,
    required this.onError,
    Key? key,
  }) : super(key: key);

  /// The futures to listen to.
  final List<Future<dynamic>> futures;

  /// The widget below this widget in the tree.
  final Widget child;

  /// The callback to call when all futures are completed.
  final VoidCallback onDone;

  /// The callback to call when any of the futures fails.
  final void Function(Object error) onError;

  @override
  State<DerivMultiFutureListener> createState() =>
      _DerivMultiFutureListenerState();
}

class _DerivMultiFutureListenerState extends State<DerivMultiFutureListener> {
  @override
  void initState() {
    super.initState();

    _listenOnTaskCompletion();
  }

  @override
  Widget build(BuildContext context) => widget.child;

  void _listenOnTaskCompletion() {
    Future.wait<dynamic>(widget.futures, eagerError: true).then(
      (_) => widget.onDone(),
      onError: (dynamic error) =>
          widget.onError(error is Object ? error : Exception()),
    );
  }
}
