import 'package:passkeys_poc/features/authentication/domain/base_models/base_user_model.dart';

class UserEntity extends BaseUserModel {

  UserEntity({
    required super.id,
    required super.email,
    super.password,
    super.name,
  });

}
