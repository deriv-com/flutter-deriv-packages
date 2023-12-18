import 'package:example/core/contracts/interactor/base_service_with_repository.dart';
import 'package:example/features/login/domain/login_entity.dart';

abstract class BaseLoginService implements BaseServiceWithRepository {
  Future<LoginEntity> authorize(String token);

  Future<void> logout();
}
