import 'package:flutter_test/flutter_test.dart';

import 'package:deriv_env/env.dart';

void main() {
  setUpAll(() => TestWidgetsFlutterBinding.ensureInitialized());

  group('Env class test =>', () {
    test('get() method should throw exception if env is not initialized.',
        () async {
      final Env env = Env();

      expect(() => env.get<String>('STRING_VAR'), throwsA(isA<Exception>()));
    });

    test('load() method should populate env map.', () async {
      final Env env = Env();

      expect(env.isInitialized, false);

      await env.load('test/.env.test');

      expect(env.isInitialized, true);

      expect(env.entries['STRING_VAR'], 'hello world');
      expect(env.entries['INT_VAR'], '123');
      expect(env.entries['DOUBLE_VAR'], '3.14');
      expect(env.entries['BOOL_VAR'], 'true');
    });

    test('get() method should return default value if key is not found.',
        () async {
      final Env env = Env();
      await env.load('test/.env.test');

      expect(env.get<String>('NOT_EXISTS', defaultValue: 'default'), 'default');
    });

    test('get() method should parse value as int.', () async {
      final Env env = Env();
      await env.load('test/.env.test');

      expect(env.get<int>('INT_VAR'), 123);
    });

    test('get() method should parse value as double.', () async {
      final Env env = Env();
      await env.load('test/.env.test');

      expect(env.get<double>('DOUBLE_VAR'), 3.14);
    });

    test('get() method should parse value as bool.', () async {
      final Env env = Env();
      await env.load('test/.env.test');

      expect(env.get<bool>('BOOL_VAR'), true);
    });

    test('throws an exception if file is empty.', () async {
      final Env env = Env();

      expect(() => env.load('test/.env.empty.test'), throwsException);
    });

    test('throws an exception if key is not found.', () async {
      final Env env = Env();
      await env.load('test/.env.test');

      expect(() => env.get<String>('invalid_key'), throwsException);
    });

    test(
        'does not throw an exception if key is not found and a default value is provided.',
        () async {
      final Env env = Env();
      await env.load('test/.env.test');

      expect(() => env.get('invalid_key', defaultValue: 42), returnsNormally);
    });

    test('throws an exception if not initialized.', () async {
      final Env env = Env();
      await env.load('test/.env.test');

      expect(() => env.get<String>('valid_key'), throwsException);
    });

    test('does not throw an exception if initialized.', () async {
      final Env env = Env();
      await env.load('test/.env.test');

      expect(
        () => env.get<String>('valid_key', defaultValue: 'default value'),
        returnsNormally,
      );
    });
  });
}
