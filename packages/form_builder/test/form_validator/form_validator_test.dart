import 'package:test/test.dart';
import 'package:form_builder/form_builder.dart';

import 'rules/equal_rule_test.dart';
import 'rules/max_rule_test.dart';
import 'rules/min_rule_test.dart';
import 'rules/no_special_character_rule_test.dart';
import 'rules/required_rule_test.dart';

void main() {
  group('FormValidator =>', () {
    test('should be valid if no validation rules are present', () {
      final FormValidator _validator = FormValidator();

      expect(_validator.validate()(null), isNull);
    });

    group('rules =>', () {
      equalGroup();
      maxGroup();
      minGroup();
      noSpecialCharacterGroup();
      requiredGroup();
    });
  });
}
