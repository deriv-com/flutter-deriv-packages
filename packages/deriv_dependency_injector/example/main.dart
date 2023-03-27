import 'dart:developer' as developer;

import 'package:deriv_dependency_injector/dependency_injector.dart';

void main() {
  final Injector injector = Injector()
    ..register<SampleClass>(
      factoryFunction: (_) => SampleClass(),
      isSingleton: true,
    )
    ..register<SampleClass>(
      factoryFunction: (_) => SampleClass(),
      key: 'custom',
    )
    ..registerWithParams<SampleClassWithParams>(
      factoryFunction: (Injector injector, Map<String, dynamic>? params) =>
          SampleClassWithParams(params!['param']),
    );

  final SampleClass? sampleClass = injector<SampleClass>();
  sampleClass?.doSomething();

  final SampleClass? myCustomClass = injector<SampleClass>(key: 'custom');
  myCustomClass?.doSomething();

  final SampleClassWithParams? sampleClassWithParams =
      injector<SampleClassWithParams>(
    additionalParameters: <String, dynamic>{'param': 'hello'},
  );
  sampleClassWithParams?.doSomethingWithParams();

  final Iterable<SampleClass?> allSampleClasses =
      injector.resolveAll<SampleClass>();
  for (final SampleClass? sampleClass in allSampleClasses) {
    sampleClass?.doSomething();
  }

  injector.dispose();
}

class SampleClass {
  void doSomething() => developer.log('Doing something');
}

class SampleClassWithParams {
  SampleClassWithParams(this.param);

  final String param;

  void doSomethingWithParams() => developer.log('Doing something with $param');
}
