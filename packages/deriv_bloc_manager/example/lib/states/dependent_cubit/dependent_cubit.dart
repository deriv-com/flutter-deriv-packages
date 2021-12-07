import 'package:bloc/bloc.dart';

import 'package:flutter_deriv_bloc_manager_example/event_listener_contracts/main_cubit_listener.dart';

part 'dependent_cubit_state.dart';

class DependentCubit extends Cubit<DependentCubitState>
    implements MainCubitEventListener {
  DependentCubit() : super(DependentCubitInitialState());
  @override
  void onLoading() => emit(DependentCubitLoadingState());

  @override
  void onLoaded() => emit(DependentCubitLoadedState());
}
