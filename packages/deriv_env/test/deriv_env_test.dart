import 'package:flutter_test/flutter_test.dart';

import 'package:deriv_env/env.dart';

void main() {
  setUpAll(() => TestWidgetsFlutterBinding.ensureInitialized());

  group('env class test =>', () {
    test('get() method should throw exception if env is not initialized.',
        () async {
      expect(() => Env().get<String>('STRING_VAR'), throwsException);
    });

    test('load() method should populate env map.', () async {
      expect(Env().isInitialized, false);

      await Env().load('test/.env.test');

      expect(Env().isInitialized, true);

      expect(Env().entries['STRING_VAR'], 'hello world');
      expect(Env().entries['INT_VAR'], '123');
      expect(Env().entries['DOUBLE_VAR'], '3.14');
      expect(Env().entries['BOOL_VAR'], 'true');
    });

    test('get() method should return default value if key is not found.',
        () async {
      await Env().load('test/.env.test');

      expect(
        Env().get<String>('INVALID_KEY', defaultValue: 'default'),
        'default',
      );
    });

    test('get() method should parse value as int.', () async {
      await Env().load('test/.env.test');

      expect(Env().get<int>('INT_VAR'), 123);
    });

    test('get() method should parse value as double.', () async {
      await Env().load('test/.env.test');

      expect(Env().get<double>('DOUBLE_VAR'), 3.14);
    });

    test('get() method should parse value as bool.', () async {
      await Env().load('test/.env.test');

      expect(Env().get<bool>('BOOL_VAR'), true);
    });

    test('throws an exception if file is empty.', () async {
      expect(() => Env().load('test/.env.empty.test'), throwsException);
    });

    test('throws an exception if env is not initialized.', () async {
      expect(() => Env().get<String>('valid_key'), throwsException);
    });

    test('throws an exception if key is not found.', () async {
      await Env().load('test/.env.test');

      expect(() => Env().get<String>('INVALID_KEY'), throwsException);
    });

    test(
        'does not throw an exception if key is not found and a default value is provided.',
        () async {
      await Env().load('test/.env.test');

      expect(() => Env().get('INVALID_KEY', defaultValue: 42), returnsNormally);
    });
  });
}
