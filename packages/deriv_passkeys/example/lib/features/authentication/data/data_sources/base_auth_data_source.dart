import 'package:flutter/foundation.dart';

@immutable
abstract class BaseAuthDataSource<Rq, Rs> {
  const BaseAuthDataSource();

  Future<Rs> login({
    required Rq data,
  });

  Future<Rs> signup({
    required Rq data,
  });

  Future logout();
}