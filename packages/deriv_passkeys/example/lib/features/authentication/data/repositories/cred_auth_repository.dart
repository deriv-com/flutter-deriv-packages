import 'package:dartz/dartz.dart';
import 'package:passkeys_poc/core/data/failures.dart';
import 'package:passkeys_poc/features/authentication/data/data_sources/cred_auth_data_source.dart';
import 'package:passkeys_poc/features/authentication/data/models/user_model.dart';
import 'package:passkeys_poc/features/authentication/domain/base_models/base_user_model.dart';
import 'package:passkeys_poc/features/authentication/domain/repositories/base_auth_repository.dart';

class CredAuthRepository implements BaseAuthRepository {

  CredAuthDataSource credAuthDataSource;

  CredAuthRepository():credAuthDataSource = const CredAuthDataSource();

  @override
  Future<Either<BaseFailure, BaseUserModel>> login(
    String email,
    String password,
  ) async {
    try {
        final BaseUserModel userModelResponse = await credAuthDataSource.login(
          data:  UserModel(
            id: "1",
            email: email,
            password: password,
          ),
          );
        return Right(userModelResponse);
      } on Exception catch (e) {
        return Left(
          ServerFailure(
            message: e.toString(),
          ),
        );
      }
  }
  
  @override
  Future<Either<BaseFailure, BaseUserModel>> signup(
    String email,
    String password,
    String name,
  ) async {
    try {
        final BaseUserModel userModelResponse = await credAuthDataSource.signup(
          data: UserModel(
            id: "1",
            email: email,
            password: password,
            name: name,
          ),
          );
        return Right(userModelResponse);
      } on Exception catch (e) {
        return Left(
          ServerFailure(
            message: e.toString(),
          ),
        );
      }
  }

  @override
  Future<Either<BaseFailure, Unit>> logout() async {
    try {
        final logoutResponse = await credAuthDataSource.logout();
        return Right(logoutResponse);
      } on Exception catch (e) {
        return Left(
          ServerFailure(
            message: e.toString(),
          ),
        );
      }
  }
}
