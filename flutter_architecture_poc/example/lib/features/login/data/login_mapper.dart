import 'package:example/core/contracts/data/base_mapper.dart';
import 'package:example/features/login/data/login_model.dart';
import 'package:example/features/login/domain/login_entity.dart';

class LoginMapper implements BaseMapper<LoginEntity, LoginModel> {
  @override
  LoginEntity toEntity(LoginModel model) => LoginEntity(
        loginId: model.loginId,
        balance: model.balance,
      );
}
