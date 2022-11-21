import 'package:deriv_auth/src/auth/auth_error.dart';
import 'package:deriv_auth/src/auth/models/authorize.dart';

abstract class DerivAuthState {}

class DerivAuthLoadingState extends DerivAuthState {}

class DerivAuthLoggedInState extends DerivAuthState {
  DerivAuthLoggedInState(this.authorizeEntity);

  final AuthorizeEntity authorizeEntity;
}

class DerivAuthLoggedOutState extends DerivAuthState {}

class DerivAuthErrorState extends DerivAuthState {
  DerivAuthErrorState({required this.message});
  
  final String message;
}
