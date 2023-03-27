import 'dart:developer' as developer;

import 'package:deriv_dependency_injector/dependency_injector.dart';

void main() {
  final Injector injector = Injector()
    ..map<SampleClass>(
      factoryFunction: (_) => SampleClass(),
      isSingleton: true,
    )
    ..map<SampleClass>(
      factoryFunction: (_) => SampleClass(),
      key: 'custom',
    )
    ..mapWithParams<SampleClassWithParams>(
      factoryFunction: (Injector injector, Map<String, dynamic>? params) =>
          SampleClassWithParams(params!['param']),
    );

  final SampleClass? sampleClass = injector.get<SampleClass>();
  sampleClass?.doSomething();

  final SampleClass? myCustomClass = injector.get<SampleClass>(key: 'custom');
  myCustomClass?.doSomething();

  final SampleClassWithParams? sampleClassWithParams =
      injector.get<SampleClassWithParams>(
    additionalParameters: <String, dynamic>{'param': 'hello'},
  );
  sampleClassWithParams?.doSomethingWithParams();

  final Iterable<SampleClass?> allSampleClasses =
      injector.getAll<SampleClass>();
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
