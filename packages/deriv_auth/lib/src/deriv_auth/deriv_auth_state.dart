import 'package:deriv_auth/src/auth/auth_error.dart';

abstract class DerivAuthState {}

class DerivAuthLoadingState extends DerivAuthState {}

class DerivAuthLoggedInState extends DerivAuthState {}

class DerivAuthLoggedOutState extends DerivAuthState {}

class DerivAuthErrorState extends DerivAuthState {
  DerivAuthErrorState({required this.message});

  final String message;
}
