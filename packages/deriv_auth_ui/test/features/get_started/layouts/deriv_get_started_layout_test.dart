import 'package:deriv_auth_ui/deriv_auth_ui.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:patrol/patrol.dart';

import '../../../pump_app.dart';

class MockDerivGetStartedSlideModel extends Mock
    implements DerivGetStartedSlideModel {}

void main() {
  group('DerivGetStartedLayout', () {
    late MockDerivGetStartedSlideModel mockSlideModel;

    const appLogoIconPath = 'assets/icons/ic_logo_extended.svg';
    const backgroundImagePath = 'assets/images/triangles.svg';

    setUpAll(() {
      mockSlideModel = MockDerivGetStartedSlideModel();
      when(() => mockSlideModel.imagePath)
          .thenReturn('assets/images/charts.svg');
      when(() => mockSlideModel.supportingText).thenReturn('Supporting text');
    });

    patrolTest('should render DerivGetStartedLayout', ($) async {
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

    patrolTest('should call onLoginTapped when login button is pressed',
        ($) async {
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

    patrolTest('should call onSignupTapped when signup button is pressed',
        ($) async {
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
