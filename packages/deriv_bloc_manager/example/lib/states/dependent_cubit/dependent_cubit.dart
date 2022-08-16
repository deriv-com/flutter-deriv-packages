import 'package:flutter_deriv_bloc_manager/listener_bloc.dart';
import 'package:flutter_deriv_bloc_manager_example/states/main_cubit/main_cubit.dart';

part 'dependent_cubit_state.dart';

class DependentCubit extends ListenerBloc<DependentCubitState> {
  DependentCubit() : super(DependentCubitInitialState()) {
    addListener<MainCubit, MainCubitState>(listener: onMainCubitState);
  }

  void onMainCubitState(MainCubitState mainCubitState) {
    if (mainCubitState is MainCubitLoadingState) {
      onLoading();
    } else if (mainCubitState is MainCubitLoadedState) {
      onLoaded();
    }
  }

  void onLoading() => emit(DependentCubitLoadingState());

  void onLoaded() => emit(DependentCubitLoadedState());
}
