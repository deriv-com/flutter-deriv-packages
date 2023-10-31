part of 'selected_active_symbol_cubit.dart';

abstract class SelectedActiveSymbolState {
  const SelectedActiveSymbolState({this.activeSymbol});

  final ActiveSymbolEntity? activeSymbol;
}

class SelectedActiveSymbolUpdateState extends SelectedActiveSymbolState {
  SelectedActiveSymbolUpdateState({ActiveSymbolEntity? activeSymbol})
      : super(activeSymbol: activeSymbol);
}
