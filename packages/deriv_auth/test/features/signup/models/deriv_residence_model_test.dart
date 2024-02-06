// ignore_for_file: always_specify_types

import 'package:deriv_auth/features/signup/models/deriv_residence_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol_finders/patrol_finders.dart';

void main() {
  group('DerivResidenceModel', () {
    patrolWidgetTest('Constructor initializes all properties correctly',
        (PatrolTester $) async {
      const model = DerivResidenceModel(
        isDisabled: true,
        name: 'United States',
        code: 'US',
      );

      expect(model.isDisabled, isTrue);
      expect(model.name, 'United States');
      expect(model.code, 'US');
    });
  });
}
