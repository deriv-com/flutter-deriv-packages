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
      expect(Env().isInitialized, isFalse);

      await Env().load('test/.env.test');

      expect(Env().isInitialized, isTrue);

      expect(Env().entries.length, 7);

      expect(Env().entries['STRING_VAR'], 'hello world');
      expect(Env().entries['INT_VAR'], '123');
      expect(Env().entries['DOUBLE_VAR'], '3.14');
      expect(Env().entries['BOOL_VAR'], 'true');
      expect(Env().entries['VAR_WITH_EQUALS'], 'hello=world');
      expect(Env().entries['VAR_WITH_HASH'], 'hello#world');
      expect(
        Env().entries['ENCRYPTED_VAR'],
        'dVyH3QjdHYcjcS2TQ1XenmDVvf5ViN8ZpSVEcjfFhsk=',
      );
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

      expect(Env().get<bool>('BOOL_VAR'), isTrue);
    });

    test(
        'get() method should parse value with a parser factory if it is provided.',
        () async {
      await Env().load('test/.env.test');

      expect(
        Env().get<String>(
          'STRING_VAR',
          parser: (String value) => value.toUpperCase(),
        ),
        'HELLO WORLD',
      );

      expect(
        Env().get<int>(
          'INT_VAR',
          parser: (String value) => int.parse(value) * 2,
        ),
        246,
      );

      expect(
        Env().get<double>(
          'DOUBLE_VAR',
          parser: (String value) => double.parse(value) * 2,
        ),
        6.28,
      );

      expect(
        Env().get<bool>(
          'DOUBLE_VAR',
          parser: (String value) => double.parse(value) > 3.14,
        ),
        false,
      );
    });

    test('check handling variables with special characters like `#` and `=`.',
        () async {
      await Env().load('test/.env.test');

      expect(Env().entries['VAR_WITH_EQUALS'], 'hello=world');
      expect(Env().entries['VAR_WITH_HASH'], 'hello#world');
    });

    test('handle encrypted variable.', () async {
      await Env().load('test/.env.test');

      expect(
        Env().get<String>(
          'ENCRYPTED_VAR',
          encrypted: true,
          decryptionKey: 'TbKjMndW1L8vczgGQfPo2IyUxh6XAEay',
        ),
        'ecnrypted message',
      );
    });

    test('throws an exception if file is empty.', () async {
      expect(() => Env().load('test/.env.empty.test'), throwsException);
    });

    test(
        'throws an exception if encrypted is true but no encryptionKey is proveided.',
        () async {
      expect(
        () => Env().get<String>('valid_key', encrypted: true),
        throwsException,
      );
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
