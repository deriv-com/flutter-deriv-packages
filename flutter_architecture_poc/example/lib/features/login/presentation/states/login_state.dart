part of 'login_cubit.dart';

abstract class LoginState {
  const LoginState();
}

class LoginLoadingState extends LoginState {
  const LoginLoadingState();
}

class LoginLoggedInState extends LoginState {
  const LoginLoggedInState(this.loginId);

  final String loginId;
}

class LoginLoggedOutState extends LoginState {
  const LoginLoggedOutState();
}

class LoginErrorState extends LoginState {
  LoginErrorState(this.message);

  final String message;
}
