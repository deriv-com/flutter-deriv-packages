// ignore_for_file: always_specify_types

import 'package:deriv_auth_ui/deriv_auth_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol_finders/patrol_finders.dart';

void main() {
  group('DerivPasswordPolicyModel', () {
    patrolWidgetTest('isMatchWith() returns true for matching password',
        (PatrolTester $) async {
      final policy = DerivPasswordPolicyModel(
        description: 'At least 8 characters',
        regex: RegExp(r'.{8,}'),
      );

      expect(policy.isMatchWith('password123'), isTrue);
    });

    patrolWidgetTest('isMatchWith() returns false for non-matching password',
        (PatrolTester $) async {
      final policy = DerivPasswordPolicyModel(
        description: 'At least 8 characters',
        regex: RegExp(r'.{8,}'),
      );

      expect(policy.isMatchWith('pass'), isFalse);
    });

    patrolWidgetTest(
        'isMatchWith() returns true for optional policy with empty password',
        (PatrolTester $) async {
      final policy = DerivPasswordPolicyModel(
        description: 'Optional policy',
        regex: RegExp(r'^$'),
        isOptional: true,
      );

      expect(policy.isMatchWith(''), isTrue);
    });
  });
}
