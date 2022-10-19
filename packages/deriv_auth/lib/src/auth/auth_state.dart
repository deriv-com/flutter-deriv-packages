// abstract class AuthLoadingState {}

// class AuthInitialLoading extends AuthState implements AuthLoadingState {}
// class  extends AuthState implements AuthLoadingState {}

abstract class AuthState {
  const AuthState();
}

class AuthAppAuthorizedState extends AuthState {
  final String jwtToken;

  const AuthAppAuthorizedState({required this.jwtToken});
}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthSuccessState extends AuthAppAuthorizedState {
  AuthSuccessState({required super.jwtToken});
}

class AuthFailureState extends AuthState {
  final String? errorCode;
  final String errorMessage;

  const AuthFailureState({this.errorCode, required this.errorMessage});
}
