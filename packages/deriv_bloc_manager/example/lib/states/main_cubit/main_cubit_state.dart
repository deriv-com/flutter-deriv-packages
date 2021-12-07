part of 'main_cubit.dart';

abstract class MainCubitState {}

class MainCubitInitialState extends MainCubitState {
  @override
  String toString() => 'Main Cubit Initial State';
}

class MainCubitLoadingState extends MainCubitState {
  @override
  String toString() => 'Main Cubit Loading State';
}

class MainCubitLoadedState extends MainCubitState {
  @override
  String toString() => 'Main Cubit Loaded State';
}
