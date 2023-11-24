import 'package:deriv_env/env_loader.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:deriv_env/env.dart';

void main() {
  setUpAll(() => TestWidgetsFlutterBinding.ensureInitialized());

  const String stringKey = 'STRING_VAR';
  const String intKey = 'INT_VAR';
  const String doubleKey = 'DOUBLE_VAR';
  const String boolKey = 'BOOL_VAR';
  const String varWithEqualsKey = 'VAR_WITH_EQUALS';
  const String varWithHashKey = 'VAR_WITH_HASH';
  const String encryptedKey = 'ENCRYPTED_VAR';

  group('env class test =>', () {
    test('get() method should throw exception if env is not initialized.',
        () async {
      expect(() => Env().get<String>('STRING_VAR'), throwsException);
    });

    test('load() method should populate env map.', () async {
      expect(Env().isInitialized, isFalse);

      await Env().initialize(EnvLoader(filePath: 'test/.env.test'));

      expect(Env().isInitialized, isTrue);

      expect(Env().env!.entries.length, 7);

      expect(Env().env!.entries[stringKey], 'hello world');
      expect(Env().env!.entries[intKey], '123');
      expect(Env().env!.entries[doubleKey], '3.14');
      expect(Env().env!.entries[boolKey], 'true');
      expect(Env().env!.entries[varWithEqualsKey], 'hello=world');
      expect(Env().env!.entries[varWithHashKey], 'hello#world');
      expect(
        Env().env!.entries[encryptedKey],
        'dVyH3QjdHYcjcS2TQ1XenmDVvf5ViN8ZpSVEcjfFhsk=',
      );
    });

    test('get() method should return default value if key is not found.',
        () async {
      await Env().initialize(EnvLoader(filePath: 'test/.env.test'));

      expect(
        Env().get<String>('INVALID_KEY', defaultValue: 'default'),
        'default',
      );
    });

    test('get() method should parse value as int.', () async {
      await Env().initialize(EnvLoader(filePath: 'test/.env.test'));

      expect(Env().get<int>(intKey), 123);
    });

    test('get() method should parse value as double.', () async {
      await Env().initialize(EnvLoader(filePath: 'test/.env.test'));

      expect(Env().get<double>(doubleKey), 3.14);
    });

    test('get() method should parse value as bool.', () async {
      await Env().initialize(EnvLoader(filePath: 'test/.env.test'));

      expect(Env().get<bool>(boolKey), isTrue);
    });

    test(
        'get() method should parse value with a parser factory if it is provided.',
        () async {
      await Env().initialize(EnvLoader(filePath: 'test/.env.test'));

      expect(
        Env().get<String>(
          stringKey,
          parser: (String value) => value.toUpperCase(),
        ),
        'HELLO WORLD',
      );

      expect(
        Env().get<int>(
          intKey,
          parser: (String value) => int.parse(value) * 2,
        ),
        246,
      );

      expect(
        Env().get<double>(
          doubleKey,
          parser: (String value) => double.parse(value) * 2,
        ),
        6.28,
      );

      expect(
        Env().get<bool>(
          doubleKey,
          parser: (String value) => double.parse(value) > 3.14,
        ),
        false,
      );
    });

    test('check handling variables with special characters like `#` and `=`.',
        () async {
      await Env().initialize(EnvLoader(filePath: 'test/.env.test'));

      expect(Env().env!.entries[varWithEqualsKey], 'hello=world');
      expect(Env().env!.entries[varWithHashKey], 'hello#world');
    });

    test('handle encrypted variable.', () async {
      await Env().initialize(EnvLoader(filePath: 'test/.env.test'));

      expect(
        Env().get<String>(
          encryptedKey,
          decryptionKey: 'TbKjMndW1L8vczgGQfPo2IyUxh6XAEay',
        ),
        'ecnrypted message',
      );
    });

    test('throws an exception if file is empty.', () async {
      expect(
          () => Env().initialize(EnvLoader(filePath: 'test/.env.empty.test')),
          throwsException);
    });

    test('throws an exception if env is not initialized.', () async {
      expect(() => Env().get<String>('valid_key'), throwsException);
    });

    test('throws an exception if key is not found.', () async {
      await Env().initialize(EnvLoader(filePath: 'test/.env.test'));

      expect(() => Env().get<String>('INVALID_KEY'), throwsException);
    });

    test(
        'does not throw an exception if key is not found and a default value is provided.',
        () async {
      await Env().initialize(EnvLoader(filePath: 'test/.env.test'));

      expect(() => Env().get('INVALID_KEY', defaultValue: 42), returnsNormally);
    });
  });
}
