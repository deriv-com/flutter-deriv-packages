import 'package:passkeys_poc/features/authentication/domain/base_models/base_user_model.dart';

class UserModel extends BaseUserModel {

  UserModel({
    required super.id,
    required super.email,
    super.name,
    super.password
  });

  factory UserModel.dummyData() {
    return UserModel(
      id: '1',
      email: 'bassam.elobeid@deriv.com',
      name: 'Bassam',
    );
  }
}
