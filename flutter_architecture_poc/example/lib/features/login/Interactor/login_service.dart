import 'package:example/features/login/interactor/base_login_service.dart';
import 'package:example/features/login/domain/base_login_repository.dart';
import 'package:example/features/login/domain/login_entity.dart';

class LoginService implements BaseLoginService {
  LoginService(this.repository);

  @override
  final BaseLoginRepository repository;

  @override
  Future<LoginEntity> authorize(String token) => repository.authorize(token);

  @override
  Future<void> logout() => repository.logout();
}
