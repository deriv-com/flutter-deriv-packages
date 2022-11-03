part of 'app_auth_cubit.dart';

@immutable
abstract class AppAuthState {
  const AppAuthState();
}

class AppAuthInitialState extends AppAuthState {}

class AppAuthLoadingState extends AppAuthState {}

class AppAuthSuccessState extends AppAuthState {
  final String jwtToken;

  const AppAuthSuccessState(this.jwtToken);
}

class AppAuthFailureState extends AppAuthState {}
