// ignore_for_file: always_specify_types

import 'package:deriv_auth_ui/deriv_auth_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

void main() {
  group('DerivResidenceModel', () {
    patrolTest('Constructor initializes all properties correctly',
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
