import 'dart:async';

import 'package:example/features/login/data/base_login_data_source.dart';
import 'package:example/features/login/domain/base_login_repository.dart';
import 'package:example/features/login/domain/login_entity.dart';

class LoginRepoistory implements BaseLoginRepository {
  LoginRepoistory(this.dataSource);

  @override
  final BaseLoginDataSource dataSource;

  @override
  Future<LoginEntity> authorize(String token) =>
      dataSource.authorize(token).then(dataSource.mapper.toEntity);

  @override
  Future<void> logout() => dataSource.logout();
}
