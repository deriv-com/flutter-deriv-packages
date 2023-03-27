import 'package:deriv_dependency_injector/dependency_injector.dart';

const String _defaultKey = 'default';

/// Injector class for dependency injection.
class Injector {
  /// Get the instance of the named injector or create a new one if it doesn't exist.
  ///
  /// If no name is provided, the default injector will be returned.
  factory Injector({String name = _defaultKey}) =>
      _injectors[name] = _injectors[name] ?? Injector._internal(name: name);

  Injector._internal({this.name});

  static final Map<String, Injector> _injectors = <String, Injector>{};

  final Map<String, TypeFactory<dynamic>> _factories =
      <String, TypeFactory<dynamic>>{};

  /// The name of this injector instance.
  final String? name;

  /// Registers the given type to the given factory function and [key].
  ///
  /// If [isSingleton] is true, the instance will be created only once and reused.
  ///
  /// If [isSingleton] is false, the instance will be created every time it is requested.
  void register<T>({
    required ObjectFactoryFunction<T> factoryFunction,
    String key = _defaultKey,
    bool isSingleton = false,
  }) {
    final String objectKey = _generateKey(type: T, key: key);

    if (_factories.containsKey(objectKey)) {
      throw InjectorException(
        message: '$T is already registered with key $objectKey.',
      );
    }

    _factories[objectKey] = TypeFactory<T>(
      factoryFunction: (Injector injector, Map<String, dynamic>? parameters) =>
          factoryFunction(injector),
      isSingleton: isSingleton,
    );
  }

  /// Registers the given type to the given factory function and [key].
  void registerWithParams<T>({
    required ObjectFactoryWithParametersFunction<T> factoryFunction,
    String key = _defaultKey,
  }) {
    final String objectKey = _generateKey(type: T, key: key);

    if (_factories.containsKey(objectKey)) {
      throw InjectorException(
        message: '$T is already registered with key $objectKey.',
      );
    }

    _factories[objectKey] = TypeFactory<T>(
      factoryFunction: factoryFunction,
      isSingleton: false,
    );
  }

  /// Resolves the given type [T] and [key] to an instance.
  T resolve<T>({
    String key = _defaultKey,
    Map<String, dynamic>? additionalParameters,
  }) {
    final String objectKey = _generateKey(type: T, key: key);
    final TypeFactory<dynamic>? objectFactory = _factories[objectKey];

    if (objectFactory == null) {
      throw InjectorException(
        message: 'No factory registered for $T with key $objectKey.',
      );
    }

    return objectFactory.get(this, additionalParameters);
  }

  /// Shortcut for [resolve] method.
  T call<T>({
    String key = _defaultKey,
    Map<String, dynamic>? additionalParameters,
  }) =>
      resolve<T>(key: key, additionalParameters: additionalParameters);

  /// Resolves all instances of the given type [T].
  Iterable<T?> resolveAll<T>({Map<String, dynamic>? additionalParameters}) {
    final List<T?> instances = <T?>[];
    final String keyForType =
        _generateKey(type: T).replaceFirst(_defaultKey, '');

    _factories.forEach((String key, TypeFactory<dynamic> typeFactory) {
      if (key.contains(keyForType)) {
        instances.add(typeFactory.get(this, additionalParameters));
      }
    });

    return instances;
  }

  /// Disposes of the injector instance and removes it from the named collection of injectors.
  void dispose() {
    _factories.clear();
    _injectors.remove(name);
  }

  String _generateKey<T>({T? type, String key = _defaultKey}) =>
      '${type.toString()}::$key';
}
