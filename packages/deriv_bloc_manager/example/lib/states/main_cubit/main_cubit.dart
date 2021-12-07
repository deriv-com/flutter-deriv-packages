import 'package:bloc/bloc.dart';

part 'main_cubit_state.dart';

class MainCubit extends Cubit<MainCubitState> {
  MainCubit() : super(MainCubitInitialState());

  Future<void> doCalculation() async {
    await Future.delayed(
      const Duration(seconds: 3),
      () => emit(MainCubitLoadedState()),
    );

    emit(MainCubitLoadingState());

    await Future.delayed(
      const Duration(seconds: 3),
      () => emit(MainCubitLoadedState()),
    );
  }
}
