import 'package:test/test.dart';

import 'package:flutter_deriv_bloc_manager/manager.dart';

void main() {
  group('bloc manager exception test =>', () {
    test('toString returns correct string.', () {
      final BlocManagerException exception =
          BlocManagerException(message: 'test message');

      expect('$exception', '$BlocManagerException: test message');
    });
  });
}
