import 'package:test/test.dart';

import 'package:deriv_dependency_injector/dependency_injector.dart';

void main() {
  group('type factory tests =>', () {
    late TypeFactory<MyClass> typeFactory;
    late Injector injector;

    setUp(() {
      injector = Injector();

      typeFactory = TypeFactory<MyClass>(
        factoryFunction:
            (Injector injector, Map<String, dynamic>? parameters) => MyClass(),
        isSingleton: true,
      );
    });

    test('get() returns a new instance if not a singleton.', () {
      final TypeFactory<MyClass> typeFactoryNotSingleton = TypeFactory<MyClass>(
        factoryFunction:
            (Injector injector, Map<String, dynamic>? parameters) => MyClass(),
        isSingleton: false,
      );
      final MyClass? instance1 = typeFactoryNotSingleton.get(injector, null);
      final MyClass? instance2 = typeFactoryNotSingleton.get(injector, null);

      expect(instance1, isNot(same(instance2)));
    });

    test('get() returns the same instance if singleton.', () {
      final MyClass? instance1 = typeFactory.get(injector, null);
      final MyClass? instance2 = typeFactory.get(injector, null);

      expect(instance1, same(instance2));
    });

    test('get() passes additionalParameters to factory function.', () {
      final TypeFactory<MyClass> typeFactoryWithParameters =
          TypeFactory<MyClass>(
        factoryFunction:
            (Injector injector, Map<String, dynamic>? parameters) =>
                MyClass.withParams(parameters!),
        isSingleton: false,
      );
      final Map<String, String> additionalParameters = <String, String>{
        'foo': 'bar',
      };

      final MyClass? instance =
          typeFactoryWithParameters.get(injector, additionalParameters);

      expect(instance?.foo, equals('bar'));
    });
  });
}

class MyClass {
  MyClass({this.foo});

  factory MyClass.withParams(Map<String, dynamic> parameters) =>
      MyClass(foo: parameters['foo']);

  final String? foo;
}
