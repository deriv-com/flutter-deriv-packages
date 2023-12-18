import 'package:deriv_dependency_injector/dependency_injector.dart';

/// ObjectFactoryFunction method signature for creating an instance of type [T].
typedef ObjectFactoryFunction<T> = T Function(Injector injector);

/// ObjectFactoryWithParametersFunction method signature for creating an instance of type [T].
typedef ObjectFactoryWithParametersFunction<T> = T Function(
  Injector injector,
  Map<String, dynamic>? additionalParameters,
);

/// Type factory class for creating instances of type [T].
class TypeFactory<T> {
  /// Initializes a new instance of the [TypeFactory] class.
  TypeFactory({
    ObjectFactoryWithParametersFunction<T>? factoryFunction,
    bool? isSingleton,
  })  : _factoryFunction = factoryFunction,
        _isSingleton = isSingleton;

  T? _instance;

  final bool? _isSingleton;
  final ObjectFactoryWithParametersFunction<T>? _factoryFunction;

  /// Get type instance of type [T].
  T? get(Injector injector, Map<String, dynamic>? additionalParameters) {
    if (_isSingleton! && _instance != null) {
      return _instance;
    }

    final T instance = _factoryFunction!(injector, additionalParameters);

    if (_isSingleton!) {
      _instance = instance;
    }

    return instance;
  }
}
