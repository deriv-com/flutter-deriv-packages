import 'package:dart_clean_architecture/dart_clean_architecture/core/domain.dart';

import '../core/interactor.dart';
import 'domain_layer.dart';

abstract class BaseFeatureService implements BaseServiceWithRepository {
  const BaseFeatureService(this.repository);

  @override
  final BaseFeatureRepository repository;

  Future<BaseEntity?> getData();
}

class FeatureService implements BaseFeatureService {
  const FeatureService(this.repository);

  @override
  final BaseFeatureRepository repository;

  @override
  Future<FeatureEntity?> getData() async =>
      throw UnimplementedError(); // repository?.mapper.toEntity(await repository?.dataSource.getData());
}
