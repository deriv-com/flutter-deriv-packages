import 'package:equatable/equatable.dart';
import 'package:passkeys_poc/core/data/failures.dart';
import 'package:passkeys_poc/features/authentication/presentation/entities/user_entity.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class InitialAuthState extends AuthState {}

class LoadingAuthState extends AuthState {}

class AuthenticatedState extends AuthState {
  final UserEntity userEntity;

  const AuthenticatedState(this.userEntity);

  @override
  List<Object> get props => [userEntity];
}

class ErrorAuthState extends AuthState {
  final BaseFailure failure;

  const ErrorAuthState(this.failure);

  @override
  List<Object> get props => [failure];
}