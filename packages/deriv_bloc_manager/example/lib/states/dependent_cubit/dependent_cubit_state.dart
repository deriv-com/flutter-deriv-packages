part of 'dependent_cubit.dart';

abstract class DependentCubitState {}

class DependentCubitInitialState extends DependentCubitState {
  @override
  String toString() => 'Dependent Cubit Initial State';
}

class DependentCubitLoadingState extends DependentCubitState {
  @override
  String toString() => 'Dependent Cubit Loading State';
}

class DependentCubitLoadedState extends DependentCubitState {
  @override
  String toString() => 'Dependent Cubit Loaded State';
}
