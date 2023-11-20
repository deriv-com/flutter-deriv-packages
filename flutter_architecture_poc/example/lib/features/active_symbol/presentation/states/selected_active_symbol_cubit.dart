import 'package:example/features/active_symbol/domain/active_symbol_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'selected_active_symbol_state.dart';

class SelectedActiveSymbolCubit extends Cubit<SelectedActiveSymbolState> {
  SelectedActiveSymbolCubit() : super(SelectedActiveSymbolUpdateState());

  void updateActiveSymbol({ActiveSymbolEntity? activeSymbol}) =>
      emit(SelectedActiveSymbolUpdateState(activeSymbol: activeSymbol));
}
