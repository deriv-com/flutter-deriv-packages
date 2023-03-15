import 'package:deriv_auth/core/extensions/extensions.dart';
import 'package:test/test.dart';

void main() {
  group('StringExtension on String tests =>', () {
    test('.parseXMLTag returns all contents between first XML [tag].', () {
      const String xml = '<tag>contents</tag>';
      const String tag = 'tag';

      expect(xml.parseXMLTag(tag), 'contents');
    });
  });
}
