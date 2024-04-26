import 'dart:async';

import 'package:example/core/contracts/data/base_data_source.dart';
import 'package:example/features/login/data/login_mapper.dart';
import 'package:example/features/login/data/login_model.dart';

abstract class BaseLoginDataSource implements BaseDataSource {
  BaseLoginDataSource(this.mapper);

  @override
  final LoginMapper mapper;

  Future<LoginModel> authorize(String token);

  Future<void> logout();
}
