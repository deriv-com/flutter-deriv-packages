import 'package:test/test.dart';

import 'package:flutter_deriv_bloc_manager/manager.dart';

void main() {
  group('BlocManagerException tests =>', () {
    test('should have the correct message when toString() is called.', () {
      final BlocManagerException exception =
          BlocManagerException(message: 'test message');

      expect('$exception', equals('BlocManagerException: test message'));
    });

    test('should throw an exception with the provided message.', () {
      final BlocManagerException exception =
          BlocManagerException(message: 'test message');

      expect(exception.message, equals('test message'));
    });

    test('should throw a runtime exception.', () {
      final BlocManagerException exception =
          BlocManagerException(message: 'test message');

      expect(exception, isA<Exception>());
    });
  });
}
