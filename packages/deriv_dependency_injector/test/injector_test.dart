import 'package:test/test.dart';

import 'package:deriv_dependency_injector/dependency_injector.dart';

class Dependency {}

class Dependent {
  Dependent(this.dependency);

  final Dependency dependency;
}

void main() {
  tearDown(() => Injector().dispose());

  group('injector tests =>', () {
    test(
        'creates a new injector instance and gets the instance of the named injector.',
        () {
      final Injector injector1 = Injector(name: 'injector1');
      final Injector injector2 = Injector(name: 'injector2');
      final Injector injector3 = Injector();

      expect(injector1, equals(Injector(name: 'injector1')));
      expect(injector2, equals(Injector(name: 'injector2')));
      expect(injector3, equals(Injector()));
    });

    test('maps a type to a factory function', () {
      final Injector injector = Injector();
      final Dependency dependency = Dependency();

      injector.map<Dependency>(factoryFunction: (_) => dependency);

      expect(injector.get<Dependency>(), equals(dependency));
    });

    test('maps a type to a factory function with additional parameters.', () {
      final Injector injector = Injector();
      final Dependency dependency = Dependency();
      injector
        ..mapWithParams<Dependent>(
          factoryFunction:
              (Injector injector, Map<String, dynamic>? parameters) =>
                  Dependent(parameters!['dependency']),
        )
        ..map<Dependency>(factoryFunction: (_) => dependency);

      expect(
        injector.get<Dependent>(additionalParameters: <String, dynamic>{
          'dependency': dependency,
        })?.dependency,
        equals(dependency),
      );
    });

    test('gets the mapped instance of a type.', () {
      final Injector injector = Injector();
      final Dependency dependency = Dependency();

      injector.map<Dependency>(factoryFunction: (_) => dependency);

      expect(injector.get<Dependency>(), equals(dependency));
    });

    test('gets all the mapped instances of a type', () {
      final Injector injector = Injector();
      final Dependency dependency1 = Dependency();
      final Dependency dependency2 = Dependency();
      injector
        ..map<Dependency>(factoryFunction: (_) => dependency1, key: 'key1')
        ..map<Dependency>(factoryFunction: (_) => dependency2, key: 'key2');

      expect(injector.getAll<Dependency>(),
          equals(<Object?>[dependency1, dependency2]));
    });

    test(
        'disposes of the injector instance and removes it from the named collection of injectors.',
        () {
      final Injector injector = Injector();
      final Dependency dependency = Dependency();

      injector
        ..map<Dependency>(factoryFunction: (_) => dependency)
        ..dispose();

      expect(
        () => injector.get<Dependency>(),
        throwsA(isA<InjectorException>()),
      );
    });

    test('map() throws exception when mapping already exists.', () {
      Injector().map<String>(factoryFunction: (Injector injector) => 'value');

      expect(
        () => Injector()
            .map<String>(factoryFunction: (Injector injector) => 'new value'),
        throwsA(const TypeMatcher<InjectorException>()),
      );
    });

    test('mapWithParams() throws exception when mapping already exists.', () {
      Injector().mapWithParams<String>(
        factoryFunction:
            (Injector injector, Map<String, dynamic>? parameters) => 'value',
      );

      expect(
        () => Injector().mapWithParams<String>(
          factoryFunction:
              (Injector injector, Map<String, dynamic>? parameters) =>
                  'new value',
        ),
        throwsA(const TypeMatcher<InjectorException>()),
      );
    });

    test('get() throws exception when mapping does not exist.', () {
      expect(
        () => Injector().get<String>(),
        throwsA(const TypeMatcher<InjectorException>()),
      );
    });
  });
}
