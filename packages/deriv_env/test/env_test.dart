import 'package:deriv_env/env_loader.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:deriv_env/env.dart';

void main() {
  setUpAll(() => TestWidgetsFlutterBinding.ensureInitialized());

  group('env class test =>', () {
    test('get() method should throw exception if env is not initialized.',
        () async {
      expect(() => EnvLoader().get<String>('STRING_VAR'), throwsException);
    });

    test('load() method should populate env map.', () async {
      expect(EnvLoader().isInitialized, isFalse);

      await EnvLoader().initialize(Env(), 'test/.env.test');

      expect(EnvLoader().isInitialized, isTrue);

      expect(EnvLoader().env!.entries.length, 7);

      expect(EnvLoader().env!.entries['STRING_VAR'], 'hello world');
      expect(EnvLoader().env!.entries['INT_VAR'], '123');
      expect(EnvLoader().env!.entries['DOUBLE_VAR'], '3.14');
      expect(EnvLoader().env!.entries['BOOL_VAR'], 'true');
      expect(EnvLoader().env!.entries['VAR_WITH_EQUALS'], 'hello=world');
      expect(EnvLoader().env!.entries['VAR_WITH_HASH'], 'hello#world');
      expect(
        EnvLoader().env!.entries['ENCRYPTED_VAR'],
        'dVyH3QjdHYcjcS2TQ1XenmDVvf5ViN8ZpSVEcjfFhsk=',
      );
    });

    test('get() method should return default value if key is not found.',
        () async {
      await EnvLoader().initialize(Env(), 'test/.env.test');

      expect(
        EnvLoader().get<String>('INVALID_KEY', defaultValue: 'default'),
        'default',
      );
    });

    test('get() method should parse value as int.', () async {
      await EnvLoader().initialize(Env(), 'test/.env.test');

      expect(EnvLoader().get<int>('INT_VAR'), 123);
    });

    test('get() method should parse value as double.', () async {
      await EnvLoader().initialize(Env(), 'test/.env.test');

      expect(EnvLoader().get<double>('DOUBLE_VAR'), 3.14);
    });

    test('get() method should parse value as bool.', () async {
      await EnvLoader().initialize(Env(), 'test/.env.test');

      expect(EnvLoader().get<bool>('BOOL_VAR'), isTrue);
    });

    test(
        'get() method should parse value with a parser factory if it is provided.',
        () async {
      await EnvLoader().initialize(Env(), 'test/.env.test');

      expect(
        EnvLoader().get<String>(
          'STRING_VAR',
          parser: (String value) => value.toUpperCase(),
        ),
        'HELLO WORLD',
      );

      expect(
        EnvLoader().get<int>(
          'INT_VAR',
          parser: (String value) => int.parse(value) * 2,
        ),
        246,
      );

      expect(
        EnvLoader().get<double>(
          'DOUBLE_VAR',
          parser: (String value) => double.parse(value) * 2,
        ),
        6.28,
      );

      expect(
        EnvLoader().get<bool>(
          'DOUBLE_VAR',
          parser: (String value) => double.parse(value) > 3.14,
        ),
        false,
      );
    });

    test('check handling variables with special characters like `#` and `=`.',
        () async {
      await EnvLoader().initialize(Env(), 'test/.env.test');

      expect(EnvLoader().env!.entries['VAR_WITH_EQUALS'], 'hello=world');
      expect(EnvLoader().env!.entries['VAR_WITH_HASH'], 'hello#world');
    });

    test('handle encrypted variable.', () async {
      await EnvLoader().initialize(Env(), 'test/.env.test');

      expect(
        EnvLoader().get<String>(
          'ENCRYPTED_VAR',
          decryptionKey: 'TbKjMndW1L8vczgGQfPo2IyUxh6XAEay',
        ),
        'ecnrypted message',
      );
    });

    test('throws an exception if file is empty.', () async {
      expect(() => EnvLoader().initialize(Env(), 'test/.env.empty.test'),
          throwsException);
    });

    test('throws an exception if env is not initialized.', () async {
      expect(() => Env().get<String>('valid_key'), throwsException);
    });

    test('throws an exception if key is not found.', () async {
      await EnvLoader().initialize(Env(), 'test/.env.test');

      expect(() => EnvLoader().get<String>('INVALID_KEY'), throwsException);
    });

    test(
        'does not throw an exception if key is not found and a default value is provided.',
        () async {
      await EnvLoader().initialize(Env(), 'test/.env.test');

      expect(() => EnvLoader().get('INVALID_KEY', defaultValue: 42),
          returnsNormally);
    });
  });
}
