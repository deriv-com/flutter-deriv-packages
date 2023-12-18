part of 'tick_stream_cubit.dart';

abstract class TickStreamState {
  const TickStreamState();
}

class TickStreamInitialState extends TickStreamState {
  const TickStreamInitialState();
}

class TickStreamLoadingState extends TickStreamState {
  const TickStreamLoadingState();
}

class TickStreamLoadedState extends TickStreamState {
  const TickStreamLoadedState(this.tick);

  final TickStreamEntity tick;
}

class TickStreamErrorState extends TickStreamState {
  TickStreamErrorState(this.message);

  final String message;
}
