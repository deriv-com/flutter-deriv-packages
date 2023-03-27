# Deriv Dependency Injector

This is a package for dependency injection in Dart. It provides an Injector class that can be used to register and retrieve instances of classes.

## Usage

To use the package, you need to import it in your Dart file:

```dart
import 'package:deriv_dependency_injector/dependency_injector.dart';
```

Then, you can create an instance of the Injector class and use it to register and retrieve instances of classes:

```dart
final Injector injector = Injector();

// Register a class
injector.register<MyClass>(
  factoryFunction: (injector) => MyClass(),
);

// Retrieve an instance of the class
final instance = injector<MyClass>();
```

## API

`Injector`

The Injector class is the main class provided by the package. It has the following methods and properties:

`factory Injector({String name = _defaultKey})`

This is the constructor for the Injector class. It takes an optional name parameter which is used to create named injectors. If no name is provided, the default injector will be created.

`void register<T>({required ObjectFactoryFunction<T> factoryFunction, String key = _defaultKey, bool isSingleton = false})`

This method is used to register a class with the injector. It takes a generic type [T] as its first parameter, a factory function that creates an instance of the class, and an optional key and isSingleton parameter. If isSingleton is set to true, the instance will be created only once and reused. If it is set to false, the instance will be created every time it is requested.

`void registerWithParams<T>({required ObjectFactoryWithParametersFunction<T> factoryFunction, String key = _defaultKey})`

This method is similar to the register method, but it allows for additional parameters to be passed to the factory function when creating an instance of the class.

`T? <T>({String key = _defaultKey, Map<String, dynamic>? additionalParameters})`
`T? resolve<T>({String key = _defaultKey, Map<String, dynamic>? additionalParameters})`
`T? call<T>({String key = _defaultKey, Map<String, dynamic>? additionalParameters})`

This method is used to retrieve an instance of a registered class from the injector. It takes a generic type [T] as its first parameter and an optional key and additionalParameters parameter. If the class is not registered, an InjectorException will be thrown.

`Iterable<T?> getAll<T>({Map<String, dynamic>? additionalParameters})`

This method is used to retrieve all instances of a registered class from the injector. It takes an optional additionalParameters parameter that allows for additional parameters to be passed to the factory functions when creating instances of the class.

`void dispose()`

This method is used to dispose of the injector instance and remove it from the collection of injectors.

`final String? name`

This property returns the name of the injector instance. If the instance is the default injector, this property will be null.
