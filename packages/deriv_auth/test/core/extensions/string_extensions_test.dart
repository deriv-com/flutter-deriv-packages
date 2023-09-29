import 'package:deriv_auth/core/extensions/extensions.dart';
import 'package:test/test.dart';

void main() {
  group('StringExtension on String tests =>', () {
    test('.parseXMLTag returns all contents between first XML [tag].', () {
      const String xml = '<tag>contents</tag>';
      const String tag = 'tag';

      expect(xml.parseXMLTag(tag), 'contents');
    });

    test('.toSnakeCase converts a camelCase string to snake_case.', () {
      const String snakeCase = 'snake_case';
      const String camelCase = 'snakeCase';

      expect(camelCase.toSnakeCase(), snakeCase);
    });

    test('.toSnakeCase returns the same string if it is not in "camelCase"',
        () {
      const String testString = 'test';

      expect(testString.toSnakeCase(), testString);
    });
  });
}
