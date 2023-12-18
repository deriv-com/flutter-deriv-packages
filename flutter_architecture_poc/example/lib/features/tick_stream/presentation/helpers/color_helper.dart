import 'package:example/features/tick_stream/presentation/enums/tick_state.dart';
import 'package:flutter/material.dart';

Color getColor(TickState state) {
  final Map<TickState, Color> colors = <TickState, Color>{
    TickState.up: Colors.green,
    TickState.down: Colors.red,
    TickState.none: Colors.white,
  };

  return colors[state]!;
}
