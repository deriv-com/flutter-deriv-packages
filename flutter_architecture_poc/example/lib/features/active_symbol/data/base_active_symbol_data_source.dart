import 'dart:async';

import 'package:example/core/contracts/data/base_data_source.dart';
import 'package:example/features/active_symbol/data/active_symbol_mapper.dart';
import 'package:example/features/active_symbol/data/active_symbol_model.dart';

abstract class BaseActiveSymbolDataSource implements BaseDataSource {
  BaseActiveSymbolDataSource(this.mapper);

  @override
  final ActiveSymbolMapper mapper;

  Future<Iterable<ActiveSymbolModel>> fetchActiveSymbols();
}
