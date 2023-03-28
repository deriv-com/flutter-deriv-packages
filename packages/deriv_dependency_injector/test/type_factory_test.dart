import 'package:test/test.dart';

import 'package:deriv_dependency_injector/dependency_injector.dart';

void main() {
  group('type factory tests =>', () {
    late TypeFactory<SampleClass> typeFactory;
    late Injector injector;

    setUp(() {
      injector = Injector();

      typeFactory = TypeFactory<SampleClass>(
        factoryFunction:
            (Injector injector, Map<String, dynamic>? parameters) =>
                SampleClass(),
        isSingleton: true,
      );
    });

    test('get() returns a new instance if not a singleton.', () {
      final TypeFactory<SampleClass> typeFactoryNotSingleton =
          TypeFactory<SampleClass>(
        factoryFunction:
            (Injector injector, Map<String, dynamic>? parameters) =>
                SampleClass(),
        isSingleton: false,
      );
      final SampleClass? instance1 =
          typeFactoryNotSingleton.get(injector, null);
      final SampleClass? instance2 =
          typeFactoryNotSingleton.get(injector, null);

      expect(instance1, isNot(same(instance2)));
    });

    test('get() returns the same instance if singleton.', () {
      final SampleClass? instance1 = typeFactory.get(injector, null);
      final SampleClass? instance2 = typeFactory.get(injector, null);

      expect(instance1, same(instance2));
    });

    test('get() passes additionalParameters to factory function.', () {
      final TypeFactory<SampleClass> typeFactoryWithParameters =
          TypeFactory<SampleClass>(
        factoryFunction:
            (Injector injector, Map<String, dynamic>? parameters) =>
                SampleClass.withParams(parameters!),
        isSingleton: false,
      );
      final Map<String, String> additionalParameters = <String, String>{
        'foo': 'bar',
      };

      final SampleClass? instance =
          typeFactoryWithParameters.get(injector, additionalParameters);

      expect(instance?.foo, equals('bar'));
    });
  });
}

class SampleClass {
  SampleClass({this.foo});

  factory SampleClass.withParams(Map<String, dynamic> parameters) =>
      SampleClass(foo: parameters['foo']);

  final String? foo;
}
