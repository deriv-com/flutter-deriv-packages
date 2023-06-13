
import 'package:deriv_auth_ui/deriv_auth_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

void main() {
  group('DerivPasswordPolicyModel', () {
    patrolTest('isMatchWith() returns true for matching password', ($) async {
      final policy = DerivPasswordPolicyModel(
        description: 'At least 8 characters',
        regex: RegExp(r'.{8,}'),
      );

      expect(policy.isMatchWith('password123'), isTrue);
    });

    patrolTest('isMatchWith() returns false for non-matching password', ($) async {
      final policy = DerivPasswordPolicyModel(
        description: 'At least 8 characters',
        regex: RegExp(r'.{8,}'),
      );

      expect(policy.isMatchWith('pass'), isFalse);
    });

    patrolTest('isMatchWith() returns true for optional policy with empty password', ($) async {
      final policy = DerivPasswordPolicyModel(
        description: 'Optional policy',
        regex: RegExp(r'^$'),
        isOptional: true,
      );

      expect(policy.isMatchWith(''), isTrue);
    });
  });
}
