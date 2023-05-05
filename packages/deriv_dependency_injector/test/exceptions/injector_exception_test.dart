import 'package:test/test.dart';

import 'package:deriv_dependency_injector/dependency_injector.dart';

void main() {
  group('injector exception tests =>', () {
    test('should have a message when passed in.', () {
      final InjectorException exception =
          InjectorException(message: 'Test message');

      expect(exception.message, equals('Test message'));
      expect(exception.toString(), equals('InjectorException: Test message'));
    });

    test('should not have a message when not passed in.', () {
      final InjectorException exception = InjectorException();

      expect(exception.message, isNull);
      expect(exception.toString(), equals('InjectorException: null'));
    });
  });
}
