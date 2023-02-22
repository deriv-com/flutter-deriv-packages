import 'package:flutter_test/flutter_test.dart';

import 'package:deriv_env/env.dart';

void main() {
  setUpAll(() => TestWidgetsFlutterBinding.ensureInitialized());

  group('Env test =>', () {
    test('load() should read and parse .env file correctly.', () async {
      await Env().load('test/.env.test');

      expect(Env().get<String>('STRING_VAR'), equals('value1'));
      expect(Env().get<String>('INT_VAR'), equals('2'));
    });

    test('get() should return default value if key is not found.', () async {
      await Env().load('test/.env.test');

      expect(
        Env().get<String>('Unknown', defaultValue: 'default'),
        equals('default'),
      );
    });

    test('get() should convert values to correct type.', () async {
      await Env().load('test/.env.test');

      expect(Env().get<String>('STRING_VAR'), equals('value1'));
      expect(Env().get<int>('INT_VAR'), equals(2));
      expect(Env().get<double>('DOUBLE_VAR'), equals(3.14));
      expect(Env().get<bool>('BOOL_VAR'), equals(true));
    });

    test('set() should add a new key-value pair to _env.', () {
      Env().set<String>('STRING_VAR', 'value1');

      expect(Env().get<String>('STRING_VAR'), equals('value1'));
    });
  });
}
