import 'package:dartz/dartz.dart';
import 'package:passkeys_poc/core/data/failures.dart';
import 'package:passkeys_poc/features/authentication/domain/base_models/base_user_model.dart';

abstract class BaseAuthRepository {
  Future<Either<BaseFailure, BaseUserModel>> login(
    String email,
    String password,
  );
  Future<Either<BaseFailure, BaseUserModel>> signup(
    String email,
    String password,
    String name,
  );
  Future<Either<BaseFailure, Unit>> logout();
}
