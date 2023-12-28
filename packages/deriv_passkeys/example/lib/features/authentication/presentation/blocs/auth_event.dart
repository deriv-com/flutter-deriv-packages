
import 'package:equatable/equatable.dart';
import 'package:passkeys_poc/features/authentication/presentation/entities/user_entity.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {
  final UserEntity userEntity;

  const LoginEvent({
    required this.userEntity,
  });

  @override
  List<Object> get props => [userEntity];
}

class SignupEvent extends AuthEvent {
  final UserEntity userEntity;

  const SignupEvent({
    required this.userEntity,
  });

  @override
  List<Object> get props => [userEntity];
}


class LogoutEvent extends AuthEvent {
  const LogoutEvent();
}