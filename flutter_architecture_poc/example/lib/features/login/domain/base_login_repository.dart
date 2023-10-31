import 'dart:async';

import 'package:example/core/contracts/domain/base_repository.dart';
import 'package:example/features/login/domain/login_entity.dart';

abstract class BaseLoginRepository implements BaseRepository {
  Future<LoginEntity> authorize(String token);

  Future<void> logout();
}
