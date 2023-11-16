// ignore_for_file: always_specify_types

import 'package:deriv_auth_ui/deriv_auth_ui.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:patrol_finders/patrol_finders.dart';
import '../../../pump_app.dart';

class MockDerivGetStartedSlideModel extends Mock
    implements DerivGetStartedSlideModel {}

void main() {
  group('DerivGetStartedLayout', () {
    late MockDerivGetStartedSlideModel mockSlideModel;

    const String appLogoIconPath = 'assets/icons/ic_logo_extended.svg';
    const String backgroundImagePath = 'assets/images/triangles.svg';

    setUpAll(() {
      mockSlideModel = MockDerivGetStartedSlideModel();
      when(() => mockSlideModel.imagePath)
          .thenReturn('assets/images/charts.svg');
      when(() => mockSlideModel.supportingText).thenReturn('Supporting text');
    });

    patrolWidgetTest('should render DerivGetStartedLayout',
        (PatrolTester $) async {
      await $.pumpApp(DerivGetStartedLayout(
        slides: [mockSlideModel],
        appLogoIconPath: appLogoIconPath,
        backgroundImagePath: backgroundImagePath,
        onLoginTapped: () {},
        onSignupTapped: () {},
      ));

      expect($(DerivGetStartedLayout), findsOneWidget);
      expect($(AppBar), findsOneWidget);
      expect($(PrimaryButton), findsOneWidget);
      expect($(SecondaryButton), findsOneWidget);
    });

    patrolWidgetTest('should call onLoginTapped when login button is pressed',
        (PatrolTester $) async {
      bool loginTapped = false;

      await $.pumpApp(DerivGetStartedLayout(
        slides: [mockSlideModel],
        appLogoIconPath: appLogoIconPath,
        backgroundImagePath: backgroundImagePath,
        onLoginTapped: () {
          loginTapped = true;
        },
        onSignupTapped: () {},
      ));

      await $.tap($(SecondaryButton));

      expect(loginTapped, isTrue);
    });

    patrolWidgetTest('should call onSignupTapped when signup button is pressed',
        (PatrolTester $) async {
      bool signupTapped = false;

      await $.pumpApp(DerivGetStartedLayout(
        slides: [mockSlideModel],
        appLogoIconPath: appLogoIconPath,
        backgroundImagePath: backgroundImagePath,
        onLoginTapped: () {},
        onSignupTapped: () {
          signupTapped = true;
        },
      ));

      await $.tap($(PrimaryButton));

      expect(signupTapped, isTrue);
    });
  });
}
