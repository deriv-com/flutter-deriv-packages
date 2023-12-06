part of 'active_symbol_cubit.dart';

abstract class ActiveSymbolState {
  const ActiveSymbolState();
}

class ActiveSymbolInitialState extends ActiveSymbolState {
  const ActiveSymbolInitialState();
}

class ActiveSymbolLoadingState extends ActiveSymbolState {
  const ActiveSymbolLoadingState();
}

class ActiveSymbolLoadedState extends ActiveSymbolState {
  const ActiveSymbolLoadedState(this.activeSymbols);

  final List<ActiveSymbolEntity> activeSymbols;
}

class ActiveSymbolErrorState extends ActiveSymbolState {
  ActiveSymbolErrorState(this.message);

  final String message;
}
