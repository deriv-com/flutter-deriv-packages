import 'package:dartz/dartz.dart';
import 'package:passkeys_poc/core/data/failures.dart';
import 'package:passkeys_poc/core/domain/base_usecase.dart';
import 'package:passkeys_poc/features/authentication/data/repositories/cred_auth_repository.dart';
import 'package:passkeys_poc/features/authentication/domain/base_models/base_user_model.dart';

class CredLoginUseCase extends BaseUsecase<BaseUserModel, CredLoginUseCaseParams> {
  final CredAuthRepository _credAuthRepository;
  CredLoginUseCase():_credAuthRepository = CredAuthRepository();

  @override
  Future<Either<BaseFailure, BaseUserModel>> call(CredLoginUseCaseParams request) async {
    return await _credAuthRepository.login(
      request.email,
      request.password,
    );
  }
}

// cred signup usecase
class CredSignupUseCase extends BaseUsecase<BaseUserModel, CredSignupUseCaseParams> {
  final CredAuthRepository _credAuthRepository;
  CredSignupUseCase():_credAuthRepository = CredAuthRepository();

  @override
  Future<Either<BaseFailure, BaseUserModel>> call(CredSignupUseCaseParams request) async {
    return await _credAuthRepository.signup(
      request.email,
      request.password,
      request.name,
    );
  }
}

//logout usecase

class LogoutUseCase extends BaseUsecase<Unit, EmptyRequest> {
  final CredAuthRepository _credAuthRepository;
  LogoutUseCase():_credAuthRepository = CredAuthRepository();

  @override
  Future<Either<BaseFailure, Unit>> call(EmptyRequest request) async {
    return await _credAuthRepository.logout();
  }
}

class CredLoginUseCaseParams {
  final String email;
  final String password;

  CredLoginUseCaseParams({
    required this.email,
    required this.password,
  });
  

}


class CredSignupUseCaseParams {
  final String email;
  final String password;
  final String name;

  CredSignupUseCaseParams({
    required this.email,
    required this.password,
    required this.name,
  });
  

}